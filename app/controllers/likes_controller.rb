class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    set_prototype
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    @like.destroy
    set_prototype
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
