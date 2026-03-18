class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])

    if @user.save
      session["user_id"] = @user["id"]
      flash["notice"] = "Account created."
      redirect_to "/"
    else
      flash["notice"] = "Could not create account."
      redirect_to "/signup"
    end
  end
end
