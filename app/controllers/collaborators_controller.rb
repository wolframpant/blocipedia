class CollaboratorsController < ApplicationController

  def new
    @relationships = Relationships.all 
    @user_options = Users.all.map|u| [(u.name || u.email), u.id]
    @wiki - Wiki.find(params[:id])
  end

  def index
    @wiki = Wiki.find(params[:id])
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @user = User.find(params[:id])
    @r = Relationship.create(wiki_id: @wiki.id, user_id: @user.id, collaborator: 'true')
    if r.update
      redirect_to collaborator_list_path
      flash[:notice] = "Success!"
    else
      render :edit
      flash[:notice] = "Please try again."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :collaborator)
  end

end