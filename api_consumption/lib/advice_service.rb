require 'faraday'
require 'json'

class AdviceService
  def conn
    Faraday.new('https://api.adviceslip.com/advice')
  end

  def parse(body)
    JSON.parse(body)
  end

  def random
    response = conn.get('/advice')
    parse(response.body)
  end

  def search(query)
    response = conn.get("/advice/search/#{query}")
    parse(response.body)
  end
end