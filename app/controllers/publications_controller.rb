class PublicationsController < ApplicationController

  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to new_article_path
    else
      redirect_to new_article_path

    end
  end

  def edit
    @publication = publication.find(publication_params[:id])
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
    redirect_to new_article_path
  end

  private
  def publication_params
    params.require(:publication).permit(:name)
  end

end