class Weather
  attr_reader :weather
  def initialize
    @weather = HTTParty.get('http://api.wunderground.com/api/765906dc6c727d2b/hourly/q/MA/Boston.json')
  end

  def three_hour_blocks
    place = 0
    hourly_info = []
    until place > 24
      hourly_info << {time: time(place),
      temp: temp(place),
      conditions: conditions(place),
      image: image(place)}
      place += 3
    end
    hourly_info
  end

  def time(place)
    weather['hourly_forecast'][place]['FCTTIME']['civil']
  end

  def temp(place)
    "#{weather['hourly_forecast'][place]['feelslike']['english']}°"
  end

  def conditions(place)
    weather['hourly_forecast'][3]['condition']
  end

  def image(place)
    weather['hourly_forecast'][3]['icon_url']
  end
end
