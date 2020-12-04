require 'faraday'
require 'json'

class TacoService
  def conn
    Faraday.new('http://taco-randomizer.herokuapp.com')
  end

  def parse(response)
    JSON.parse(response)
  end

  def random_ingredients
    response = conn.get('/random/')
    parse(response.body)
  end
end