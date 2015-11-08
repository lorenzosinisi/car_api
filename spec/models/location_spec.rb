require 'rails_helper'

RSpec.describe Location, type: :model do
  
  before(:each) do
    id = 1
    # populate the db
    1000.times do
      Location.create(
           latitude:       51.5113 + (rand(99).to_f / 1000),
           longitude:      -0.3151 + (rand(99).to_f / 1000),
           description:    srand,
           location_id:    id
           )
      id += 1
    end
    # our target
    Location.create(
           latitude:       51.511383,
           longitude:      -0.315112,
           description:    srand,
           location_id:    id + 1
           )
    
    File.delete("db/kdtreefile_" + Rails.env) if File.exist?("db/kdtreefile_" + Rails.env)
  end

  describe ".near(coords)" do
    it "should return the 10 nearest locations" do
      locations = Location.near "51.511383,-0.315112"
      locations.count.should be 10
    end
    it "should order the result by distance" do
      locations = Location.near "51.511383,-0.315112"
      locations.first.id.should be 1001
    end
  end
end
