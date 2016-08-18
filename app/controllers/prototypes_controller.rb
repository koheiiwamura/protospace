class PrototypesController < ApplicationController

  def index
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
    # Prototype.create(create_params)
    # # redirect_to root_path
    #   if Prototype.create(create_params)
    #     redirect_to action: :index, notice:"投稿できました"
    #   else
    #     flash.now[:alert] = "投稿できませんでした"
    #     render :new
    #   end
  end

  private
  def create_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,images_attributes: [:image,:roll]).merge(user_id:current_user.id)
    # if params[:prototype][:images_attributes][:image].nil?
    #   default_url
    # end
  end
end
