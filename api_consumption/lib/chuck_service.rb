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

  def random_in_category(category)
    response = conn.get("/jokes/random?category=#{category}")
    parse(response.body)
  end

  def categories
    response = conn.get('/jokes/categories')
    parse(response.body)
  end
end
