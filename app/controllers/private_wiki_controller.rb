class PrivateWikiController < ApplicationController
  def new
    @wiki = Wiki.new
    @wiki.personal = true
  end

  def create
  end

  def show
  end

  def index
    @wikis = Wiki.all
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "Your Wiki has been removed."
      redirect_to private_wiki_index_path
    else
      flash[:error] = "Wiki couldn't be deleted. Please try again."
      redirect_to private_wiki_index_path
    end
  end
end
