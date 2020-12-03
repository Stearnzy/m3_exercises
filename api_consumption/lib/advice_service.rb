require 'faraday'
require 'json'

class AdviceService
  def conn
    Faraday.get('https://api.adviceslip.com/advice')
  end

  def parse
    JSON.parse(conn.body)
  end

  def random
    self.parse
  end
end