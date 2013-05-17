require 'spec_helper'

describe Earthquake, ".search" do
  it "no query string should return all results" do
    Earthquake.search({}).should eq(Earthquake.all)
  end
  
end
