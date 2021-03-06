class TagsController < ApplicationController
 def index
  @tags = ActsAsTaggableOn::Tag.most_used
 end

 def show
  @tag = ActsAsTaggableOn::Tag.find(params[:id]).includes(:user, :prototype)
  @prototypes = Prototype.tagged_with(@tag.name).includes(:user,:tags)
 end

end
