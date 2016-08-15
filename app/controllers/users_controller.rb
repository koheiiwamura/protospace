class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update]
  def show
  end
  def edit
  end
  def update
    @user.update(update_params)
    redirect_to root_path
  end

  private
  def update_params
    params.require(:user).permit(:username,:email,:password,:member,:profile,:works)
  end

  def set_user
    @user = User.find(params[:id])
  end
end