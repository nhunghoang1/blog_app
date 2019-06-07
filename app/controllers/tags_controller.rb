class TagsController < ApplicationController
  def index
    @tag = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.create(tag_params)
    if 
      @tag.save
      redirect_to @tag
    else
      render 'new'
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if
      @tag.update(tag_params)
    
      redirect_to tag_path(@tag)
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
