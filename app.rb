require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative 'lib/quotes'
require "pg"
require 'sinatra/flash'


enable :sessions

def db_connection
  begin
    connection = PG.connect(dbname: "todolist")
    yield(connection)
  ensure
    connection.close
  end
end

configure :development, :test do
  require 'pry'
end

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
    if flash[:blah]
      flash[:blah]
    end
  tasks = db_connection { |conn| conn.exec("SELECT task FROM tasks") }
  @title = "Hello World"
  forecast = Weather.new.three_hour_blocks
  night_times = ["8:00 PM" ,"9:00 PM", "10:00 PM", "11:00 PM", "12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM","6:00 AM"]
  if night_times.include?(forecast[0][:time])
    bg_color = '0000aa'
  else
    bg_color = '2B7DFA'
  end
  quote = Quote.new.new_quote
  erb :index, locals: { quote: quote, forecast: forecast, tasks: tasks, bg_color: bg_color }
end

post "/" do
  task = params["task_name"]
  if task == ''
    flash[:blah] = "You fucked up. Try posting a new task again. :D"
  else
    db_connection do |conn|
      conn.exec_params("INSERT INTO tasks (task) VALUES ($1)", [task])
    end
  end
  redirect "/"
end


post '/remove' do
  task_to_remove = params.keys[0]
  db_connection do |conn|
    conn.exec_params("DELETE FROM tasks where task='#{task_to_remove}'")
  end
  redirect "/"
end
