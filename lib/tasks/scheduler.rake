require 'net/http'

desc "This task is called by the Heroku scheduler add-on"
task :ping_site => :environment do
  utc_time_now = Time.now.utc
  unless ( (utc_time_now.hour >= 5)&&(utc_time_now.hour <= 10 ) )
    if ENV['URL']
      puts "Sending ping"
      uri = URI(ENV['URL'])
      Net::HTTP.get_response(uri)
      puts "success..."
    end
  end
end
