class ArticlesController < ApplicationController
  def index
    @articles = Article.by_priority
    @publications = Publication.all
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to '/'
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(edit_params[:id])
  end

  def update
    @article = Article.find(edit_params[:id])
    if request.xhr?
      change = article_params[:change].to_i
      @article.priority += change
      @article.save
    else
      @article.update(article_params)
    end

    respond_to do |format|
      format.json { render json: { article: @article, change: change } }
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @article = Article.find(delete_params[:id])
    @article.destroy
    respond_to do |format|
      format.json { render json: { article: @article } }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :image_url, :publication_id, :change)
  end
  def edit_params
    params.permit(:id)
  end
  def delete_params
    params.permit(:id)
  end
end