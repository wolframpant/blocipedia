class ImagesController < ApplicationController

  def new
    @image = Image.new(user_id:current_user.id)
    authorize @image
  end
  
  def create
    @image = Image.new(image_params)
    @wiki = Wiki.find_by(params[:id])
    authorize(@image)
    if @image.save
      flash[:notice] = "Your new Image was saved."
      redirect_to @wiki
    else
      flash[:notice] = 'Please enter both a title and a body for your Wiki.'
      render :create
    end
  end
  
  def destroy
    @image = Image.find(params[:id])
    authorize(@image)
    
    if @image.destroy
      flash[:notice] = "Your Image has been removed."
      redirect_to wikis_path
    else
      flash[:error] = "Image couldn't be deleted. Please try again."
      redirect_to wikis_path
    end
  end
  
  def show
    @image = Image.find_by(params [:id])
  
  def index
    @images = Image.where(wiki_id:wiki.id)
  end
  
  private
  
  def image_params
    params.require(:image).permit(:name, :location, :wiki_id, :user_id)
  end
  