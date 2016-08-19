class PrototypesController < ApplicationController
  before_action :set_prototypes, only: :index

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.new(create_params)
     if @prototype.save
       flash[:notice] = '投稿できました'
       redirect_to action: :index
     else
       flash[:alert] = '投稿に失敗しました'
       render :new
     end
  end

  private
  def create_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,images_attributes: [:image,:roll]).merge(user_id:current_user.id)
  end

  def set_prototypes
    @prototypes = Prototype.all.includes(:user)
  end
end
