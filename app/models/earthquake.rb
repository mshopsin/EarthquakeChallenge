class Earthquake < ActiveRecord::Base
  attr_accessible :Datetime, :Depth, :Eqid, :Lat, :Lon, :Magnitude, :NST, :Region, :Src, :Version
end
