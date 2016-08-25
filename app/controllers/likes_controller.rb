class LikesController < ApplicationController

  def create
    @like = Like.create(create_params)
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

  def create_params
    params.permit(:prototype_id).merge(user_id: current_user.id)
  end
end
