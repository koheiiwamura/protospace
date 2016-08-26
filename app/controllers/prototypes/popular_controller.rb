class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user, :tags).page(params[:page]).per(8).order("likes_count DESC")
  end
end
