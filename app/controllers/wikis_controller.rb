class WikisController < ApplicationController
  def index
    @wikis = current_user.wikis.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    if @wiki.save
      relationship = Relationship.new(wiki_id: @wiki.id, user_id: current_user.id, creator_created: true)
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
