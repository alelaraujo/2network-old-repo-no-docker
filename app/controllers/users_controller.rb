
class UsersController < ApplicationController
  before_action :set_user, only: %i[show update edit]
  
  def show
    authorize @user
  end
  
  def edit
    authorize @user
  end

  def update
    authorize @user
    # if user_params[:photo].nil?
      # @user.photo.purge
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # def destroy
  #   authorize @user.destroy
  #   redirect_to root_path
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:photo)
  end
end
