require 'httparty'

class ODApi
  class HeroNotExist < StandardError; end
  class << self
    def heroes
      HTTParty.get('https://api.opendota.com/api/heroes')
    end

    def matches(options)
      HTTParty.get("https://api.opendota.com/api/heroes/#{options[:id]}/matches")
    end
  end
end
