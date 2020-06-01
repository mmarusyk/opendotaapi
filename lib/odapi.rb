# frozen_string_literal: true

require 'httparty'
module ODApi
  # class ODApi
  class ODApi
    class HeroNotExist < StandardError; end

    class << self
      # GET heroues
      def heroes
        HTTParty.get('https://api.opendota.com/api/heroes')
      end

      # GET matches
      def matches(params)
        response = HTTParty.get("https://api.opendota.com/api/heroes/#{params[:id]}/matches")
        raise HeroNotExist.new("Doesn't exists hero with id: #{params[:id]}") if response.empty?
        response
      end
    end
  end
end
