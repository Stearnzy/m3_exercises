require 'faraday'
require 'json'

class AdviceService
  def conn
    Faraday.get('https://api.adviceslip.com/advice')
  end

  def random
    JSON.parse(conn.body)
  end
end