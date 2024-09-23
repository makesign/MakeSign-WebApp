class DashboardController < ApplicationController
  def index
    @hide_navbar = true
  end

  def reservations
    reservations = fetch_reservations
    render json: { reservations: reservations }
  end

  private

  def fetch_reservations
    api_url = ENV['API_URL']     
    api_id = ENV['API_ID']     
    api_key = ENV['API_KEY']

    # Debugging: Log API URL, ID, and Key to ensure they are being loaded correctly
    Rails.logger.debug("API URL: #{api_url}")
    Rails.logger.debug("API ID: #{api_id}")
    Rails.logger.debug("API KEY: #{api_key}")

    # Check for missing environment variables
    if api_url.blank? || api_id.blank? || api_key.blank?
      Rails.logger.error("Missing API environment variables")
      return []
    end

    begin
      # Set up the request headers
      uri = URI(api_url)
      req = Net::HTTP::Get.new(uri)
      req['X-Booked-ApiId'] = api_id
      req['X-Booked-ApiKey'] = api_key
      req['Content-Type'] = 'application/json'

      # Perform the request and log the response status
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(req)
      end

      # Log the status code and response body
      # Rails.logger.debug("API Response Code: #{res.code}")
      # Rails.logger.debug("API Response Body: #{res.body}")

      if res.is_a?(Net::HTTPSuccess)
        reservations = JSON.parse(res.body)['reservations']
        return reservations.select do |reservation|
          allowed_tools.include?(reservation['resourceName'])
        end.map do |reservation|
          {
            startDate: reservation['startDate'],
            endDate: reservation['endDate'],
            name: reservation['title'] || 'Untitled Project',
            tool: reservation['resourceName']  
          }
        end
      else
        Rails.logger.error("API request failed: #{res.code} #{res.message}")
        return []
      end
    rescue StandardError => e
      Rails.logger.error("Error fetching reservations: #{e.message}")
      return []
    end
  end

  def allowed_tools
    [
      "3D Drucker M200plus #1",
      "3D Drucker M200plus #2",
      "3D Drucker M200plus #3",
      "3D Drucker M300plus",
      "3D Drucker M300dual",
      "3D Drucker Inventure #1",
      "Lasercutter",
      "CNC-Fräse Stepcraft M1000",
      "CNC-Fräse Modela MDX"
    ]
  end
end
