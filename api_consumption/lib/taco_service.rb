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

  def random_taco
    response = conn.get('/random/?full-taco=true')
    parse(response.body)
  end

  def contributions(user)
    response = conn.get("/contributions/#{user}/")
    parse(response.body)
  end

  def ingredients_by_type(input)
    response = conn.get("/contributors/#{input}/")
    parse(response.body)
  end

  def contributors_by_ingredient(category, ingredient)
    response = conn.get("/contributors/#{category}/#{ingredient}/")
    parse(response.body)
  end
end