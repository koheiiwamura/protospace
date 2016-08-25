class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.all.includes(:user).page(params[:page]).per(8).order("likes_count DESC")
  end
end
