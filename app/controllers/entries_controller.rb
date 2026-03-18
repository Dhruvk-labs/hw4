class EntriesController < ApplicationController
  def new
    if @current_user == nil
      redirect_to "/login"
      return
    end

    @place = Place.find_by({ "id" => params["place_id"], "user_id" => @current_user.id })

    if @place == nil
      redirect_to "/places"
      return
    end
  end

  def create
    if @current_user == nil
      redirect_to "/login"
      return
    end

    @place = Place.find_by({ "id" => params["place_id"], "user_id" => @current_user.id })

    if @place == nil
      redirect_to "/places"
      return
    end

    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = @place.id
    @entry["user_id"] = @current_user.id
    @entry.uploaded_image.attach(params["uploaded_image"])

    if @entry.save
      redirect_to "/places/#{@place.id}"
    else
      redirect_to "/entries/new?place_id=#{@place.id}"
    end
  end
end
