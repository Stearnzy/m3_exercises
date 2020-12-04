require 'faraday'
require 'json'

class ChuckService
  def conn
    Faraday.new('https://api.chucknorris.io')
  end

  def parse(response)
    JSON.parse(response)
  end

  def random
    response = conn.get('/jokes/random')
    parse(response.body)
  end
end
