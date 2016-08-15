class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @member = user.member
    @works = user.works
    @profile = user.profile
  end
end