class Quote
  def new_quote
    quote = (HTTParty.get('http://www.iheartquotes.com/api/v1/random?source=fortunes').split("[fortune]"))
    quote[0]
  end
end
