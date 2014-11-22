class PrivateWikiController < ApplicationController  

  def new
    @wiki = Wiki.new(personal: true)
    authorize(@wiki)
  end

  def index
    @wikis = Wiki.where(personal: true)
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize(@wiki)
    
    if @wiki.destroy
      flash[:notice] = "Your Wiki has been removed."
      redirect_to private_wiki_index_path
    else
      flash[:error] = "Wiki couldn't be deleted. Please try again."
      redirect_to private_wiki_index_path
    end
  end
end
