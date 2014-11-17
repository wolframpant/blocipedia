class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def my_wikis
    @wikis = current_user.wikis.where(relationships: {creator_created: true})
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    authorize(@wiki)
    if @wiki.save
      @r = Relationship.create(wiki_id: @wiki.id, user_id: current_user.id, creator_created: 'true')
      flash[:notice] = "Your new Wiki was saved."
      redirect_to @wiki
    else
      flash[:notice] = 'Please enter both a title and a body for your Wiki.'
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params) 
      redirect_to wiki_path
      flash[:notice] = "Success!"
    else
      render :edit
      flash[:notice] = "Please try again."
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :personal)
  end
end
