class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
       flash[:notice] = "Your new Wiki was saved."
       redirect_to @wiki
    else
      flash[:notice] = 'Please enter both a title and a body for your Wiki.'
      render :new
    end
  end

  def update
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

end
