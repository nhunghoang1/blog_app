class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:tag]
      @article = Article.tagged_with(params[:tag]) 
    else
      @article = Article.all
    end
  end

  def show 
    @article = Article.find(params[:id])
    @tag = @article.tags
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, { tag_ids: [] })
  end

end