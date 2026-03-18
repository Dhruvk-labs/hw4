class PlacesController < ApplicationController
  def index
    if @current_user == nil
      redirect_to "/login"
      return
    end

    @places = Place.where({ "user_id" => @current_user.id })
  end

  def show
    if @current_user == nil
      redirect_to "/login"
      return
    end

    @place = Place.find_by({ "id" => params["id"], "user_id" => @current_user.id })

    if @place == nil
      redirect_to "/places"
      return
    end

    @entries = Entry.where({ "place_id" => @place.id, "user_id" => @current_user.id })
  end

  def new
    if @current_user == nil
      redirect_to "/login"
      return
    end
  end

  def create
    if @current_user == nil
      redirect_to "/login"
      return
    end

    @place = Place.new
    @place["name"] = params["name"]
    @place["user_id"] = @current_user.id

    if @place.save
      redirect_to "/places"
    else
      redirect_to "/places/new"
    end
  end
end
