class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    user.update(update_params)
    redirect_to root_path
  end

  private
  def update_params
    params.permit(:username,:email,:password,:member,:profile,:works)
  end
end