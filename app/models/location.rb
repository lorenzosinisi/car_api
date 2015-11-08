class Location < ActiveRecord::Base
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  
  def self.near(coords)
    lat = coords.split(",").first
    lon = coords.split(",").second
    ids = Search.nearest lat, lon
    locations = Location.where(location_id: ids).by_distance(origin: [lat, lon]).limit(10) # in case the alghoritm does something unespected like returning more than 10 results
  end

end
