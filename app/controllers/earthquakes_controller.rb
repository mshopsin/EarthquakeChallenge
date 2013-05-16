class EarthquakesController < ApplicationController
  def index
    earthquakes = Earthquake.search(params)
    respond_to do |format|
      format.json { render :json => earthquakes }
    end
  end
end
