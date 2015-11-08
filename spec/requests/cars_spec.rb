require 'rails_helper'

RSpec.describe "Cars", type: :request do
  describe "GET /cars?location=SOMETHING" do
    
    it "should return a json with the list of cars" do
      location1, location2 = Location.create!, Location.create!
      get cars_path, :location => "56.3242,2334324.0303"
      response.header['Content-Type'].should include 'application/json' and have_http_status(200)
    end
    
    it "shoud return a json containing the response (true or false)" do
      location1, location2 = Location.create!, Location.create!
      get cars_path
      response.body.should include 'success'
    end
    
    it "should contain a list of cars" do
      location1, location2 = Location.create!, Location.create!
      get cars_path
      response.body.should include 'cars'
    end
    
  end
end
