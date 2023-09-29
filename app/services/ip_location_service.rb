require 'net/http'
require 'json'

class IpLocationService

  def self.get_city_name(ip)
    # Überprüfen, ob es einen Eintrag für diese IP-Adresse von heute gibt
    ip_location = IpLocation.find_by(ip: ip, last_updated: Date.today)

    return ip_location.location if ip_location

    # Falls nicht, rufen Sie den externen Service auf
    api_key = ENV['IP2LOCATION_API_KEY']
    url = URI("https://api.ip2location.io/?key=#{api_key}&ip=#{ip}")

    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    # Speichern Sie die neue IP-Adresse und den Standort in der Datenbank
    IpLocation.create(ip: ip, location: data["city_name"], last_updated: Date.today)

    data["city_name"]
  end
end
