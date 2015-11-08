class ApiController < ApplicationController

 def index
  if params[:location]
    @nearest = Location.near params[:location]
  else
    @nearest = []
  end

  render :json  => { success: @nearest.any?, cars:  @nearest.as_json(only: [:description, :latitude, :longitude])  }
 end

end

