require 'net/http'
require 'json'

class IPLocationService

  def self.get_city_name(ip)
    api_key = ENV['IP2LOCATION_API_KEY']
    url = URI("https://api.ip2location.io/?key=#{api_key}&ip=#{ip}")

    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    data["city_name"]
  end

end
