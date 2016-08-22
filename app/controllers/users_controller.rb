class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update]

  def show
    @prototypes = @user.prototypes.page(params[:page]).per(8)
  end

  def edit
  end

  def update
    @user.update(update_params)
    if @user.update(update_params)
      redirect_to root_path,notice:"更新に成功しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private
  def update_params
    params.require(:user).permit(:username, :email, :password, :member, :profile, :works, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end