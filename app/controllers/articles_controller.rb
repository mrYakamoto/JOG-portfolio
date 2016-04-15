class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @publications = Publication.all
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(article_params)
    @article.picture_from_url(@article.image_url)
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
    params.require(:article).permit(:title, :url, :image_url, :publication_id)
  end
end