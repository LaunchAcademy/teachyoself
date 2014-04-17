class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.avatar = params[:user][:avatar]
    if @user == current_user
      if @user.save
        redirect_to user_path(@user), notice: 'Image uploaded successfully!'
      else
        redirect_to user_path(@user), notice: 'must be a gif, jpg, or png image.'
      end
    else
      redirect_to user_path(@user), notice: 'You can only update your own profile picture'
    end
  end

end
