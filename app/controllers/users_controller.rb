class UsersController < ApplicationController

  # Methods not complete
  def create
    # byebug
    user = User.new(user_params)
    if user_params[:password] == user_params[:password_confirmation]

    end
    if user.save
      session[:user_id] = user.id
      render :json => user, status: 200
    else
      # render json response error here
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :image,
      :username,
      :email,
      :password,
      # :password_confirmation
    )
  end
end

