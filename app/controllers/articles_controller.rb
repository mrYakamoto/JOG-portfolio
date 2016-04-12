class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(title: article_params[:title])
    if @article.save
      redirect_to '/'
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(article_params[:id])
  end

  def destroy
    @article = Article.find(article_params[:id])
    @article.destroy
    redirect_to '/'
  end

  private
  def article_params
    params.require(:article).permit(:title, :id)
  end
end