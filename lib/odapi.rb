# frozen_string_literal: true

require 'httparty'
module ODApi
  # class ODApi
  class ODApi
    class HeroNotExist < StandardError; end

    class << self
      # GET heroues
      def heroes(api_key = '')
        if api_key
          HTTParty.get("https://api.opendota.com/api/heroes?api_key=#{api_key}")
        else
          HTTParty.get("https://api.opendota.com/api/heroes")
        end
      end

      # GET matches
      def matches(params, api_key = '')
        if api_key
          response = HTTParty.get("https://api.opendota.com/api/heroes/#{params[:id]}/matches?api_key=#{api_key}")
        else
          response = HTTParty.get("https://api.opendota.com/api/heroes/#{params[:id]}/matches")
        end
        raise HeroNotExist.new("Doesn't exists hero with id: #{params[:id]}") if response.empty?
        response
      end
    end
  end
end
