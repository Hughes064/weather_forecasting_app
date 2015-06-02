require 'yahoo_weatherman'

puts "What is your zipcode?"
zipcode = gets

client = Weatherman::Client.new
weather = client.lookup_by_location(zipcode).forecasts

#get today as a number
today = Time.new.day

weather.each do |weather|
	if today === weather["date"].day
		puts "Today is " + weather["text"].to_s + " and the forecast is for a high of " + ((weather["high"] * 2) + 30).to_s + " and a low of " + ((weather["low"] * 2) + 30).to_s + "."
	elsif today + 1 == weather["date"].day
	 puts "Tomorrow is " + weather["day"].to_s + " and the forecast is for a high of " + ((weather["high"] * 2) + 30).to_s + " and a low of " + ((weather["low"] * 2) + 30).to_s + "."

	else puts "The forecast for " + weather["day"].to_s + " is for a high of " + ((weather["high"] * 2) + 30).to_s + " and a low of " + ((weather["low"] * 2) + 30).to_s + "."
	end
end


