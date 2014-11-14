class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    authorize @wikis
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
    authorize @wiki
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params) 
      redirect_to @wiki
      flash[:notice] = "Success!"
    else
      render :edit
      flash[:notice] = "Please try again."
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

