class WikisController < ApplicationController
  respond_to :html, :js

  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "Your Wiki has been removed."
      redirect_to wikis_path
    else
      flash[:error] = "Wiki couldn't be deleted. Please try again."
      redirect_to wikis_path
    end

    # respond_with(@wiki) do |format|
    #   format.html {redirect_to[@wiki.id]}
    # end

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
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @user_options = User.all.map{|u|[u.name, u.id]}
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :personal, user_ids: []))
      # if params(user.id)
      #   @r = Relationship.new(wiki_id: @wiki.id, user_id: @user.id, collaborator: true)
      # end
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
