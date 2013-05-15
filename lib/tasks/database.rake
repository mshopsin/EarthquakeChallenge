require 'csv'

namespace :db do
  desc "insert new earthquakes"
  task :insert_quakes => :environment do
     response = RestClient.get("http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt")
     header = CSV.parse_line(response)
     count = 0
     hash = {}
     CSV.parse(response) do |row|
       if count == 0
         count += 1 #skip header
       else
         row.each_index do |i|
           hash[header[i].to_sym] = row[i]
         end
         Earthquake.create(hash)
       end
     end
  end
end