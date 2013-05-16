require 'date'

class Earthquake < ActiveRecord::Base
  attr_accessible :Datetime, :Depth, :Eqid, :Lat, :Lon, :Magnitude, :NST, :Region, :Src, :Version
  
  def self.search query_hash
    earthquakes = limit(100)
    
    if query_hash.has_key? :on
      event_date = DateTime.strptime( "#{query_hash[:on]}","%s" )
      start_date = Time.new(event_date.year, event_date.month, event_date.day)
      end_date =  start_date + 60 * 60 * 24
      earthquakes = earthquakes.where("Datetime >= ? AND Datetime <= ?", start_date, end_date)
    end
    
    if query_hash.has_key? :since
      event_date = DateTime.strptime( "#{query_hash[:since]}","%s" )
      start_date = Time.new(event_date.year, event_date.month, event_date.day)
      earthquakes = earthquakes.where("Datetime >= ?", start_date)
    end
    
    if query_hash.has_key? :over
      earthquakes = earthquakes.where("Magnitude >= ?", query_hash[:over])
    end
    
    if query_hash.has_key? :near
      coord = query_hash[:near].split(',')
      earthquakes = earthquakes.where("((ACOS(SIN(Lat * PI() / 180) * SIN(:lat * PI() / 180) + COS(Lat * PI() / 180) * COS(:lat * PI() / 180) * COS((Lon - :lon) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) < 5", {:lat => coord[0], :lon => coord[1]})
    end
    
    earthquakes #defaults to returning 100 most recent earthquakes
  end
  
end

#http://localhost:3000/earthquakes.json?on=1368351613
