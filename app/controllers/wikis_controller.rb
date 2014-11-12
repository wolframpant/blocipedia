class WikisController < ApplicationController
  def index
    @wikis = Wiki.order('published_at DESC')
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wikis.build(wiki_params)
    if @wiki.valid?
      @wiki.save
      redirect_to @wiki, notice: 'Your new Wiki was saved.'
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
