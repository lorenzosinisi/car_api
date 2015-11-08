require 'rails_helper'

RSpec.describe Search, type: :model do
  
  describe ".generate_or_retrieve_tree" do
    
    it "should generate the tree if doesn't exist yet in db/kdtreefile_test" do
      File.delete("db/kdtreefile_" + Rails.env) if File.exist?("db/kdtreefile_" + Rails.env)
      Location.near "51.511383,-0.315112"
      File.exist?("db/kdtreefile_" + Rails.env).should be true
    end

    it "should return the tree when already generated" do
      # this should be done with factory girl but for now is fine 
      # populate the DB
      locations = Location.near "51.511383,-0.315112"
      Search.generate_or_retrieve_tree.is_a? Kdtree
    end

  end

  describe ".nearest" do

    it "should return an array of ids" do 
      search = Search.nearest 51.511383, -0.315112
      search.is_a? Array
    end
    
  end

end
