class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all.includes(:user, :tags).page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.new(create_params)
     if @prototype.save
       redirect_to root_path,notice:"投稿しました"
     else
       flash[:alert] = "投稿に失敗しました"
       render :new
     end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id])
  end

  def edit
  end

  def update
    if @prototype.update(update_params)
      redirect_to root_path, success:"更新しました"
    else
      flash[:alert] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    if current_user.id == @prototype.user_id
      @prototype.destroy
      redirect_to root_path, warning:"削除しました"
    else
      redirect_to root_path, alert:"削除できませんでした"
    end
  end

  private
  def create_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,images_attributes: [:image,:roll]).merge(user_id:current_user.id, tag_list: params[:prototype][:tag])
  end

  def update_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,images_attributes: [:id,:image,:roll]).merge(user_id:current_user.id, tag_list: params[:prototype][:tag])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
