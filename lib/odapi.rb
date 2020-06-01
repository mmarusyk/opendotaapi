require 'httparty'

class ODApi
  class HeroNotExist < StandardError; end
  class << self
    def heroes
      HTTParty.get('https://api.opendota.com/api/heroes')
    end

    def matches(options)
      response = HTTParty.get("https://api.opendota.com/api/heroes/#{options[:id]}/matches")
      raise StandardError.new("Doesn't exists hero with ID: #{options[:id]}") if response.empty?
    end
  end
end
