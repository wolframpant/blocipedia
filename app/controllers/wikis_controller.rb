class WikisController < ApplicationController
  
  def destroy
    @wiki = Wiki.find(params[:id])
    authorize(@wiki)
    
    if @wiki.destroy
      flash[:notice] = "Your Wiki has been removed."
      redirect_to wikis_path
    else
      flash[:error] = "Wiki couldn't be deleted. Please try again."
      redirect_to wikis_path
    end

  end

  def index
    @wikis = Wiki.all
    @user = current_user
  end

  def my_wikis
    @wikis = current_user.wikis.where(relationships: {creator_created: true})
  end

  def show
    @wiki = Wiki.find(params[:id])
    @images = Image.where(wiki_id: @wiki.id)
    @image = Image.new
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
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
      render :create
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @user_options = User.all.map{|u|[u.name, u.id]}
    authorize(@wiki)
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize(@wiki)
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :personal, user_ids: []))
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
