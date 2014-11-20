class RelationshipsController < ApplicationController

  def new
    @relationship = Relationship.all
    @wiki = Wiki.find(params[:id])
    @user = User.all
  end

  def create
   @relationship = Relationship.new(relationship_params)
   if @relationship.save
      flash[:notice] = "Your new Collaborator was saved."
      redirect_to collaborator_collaborator_list_path
    else
      flash[:notice] = 'Please try again.'
      render :new
    end
  end

  private

  def relationship_params
    params.require(:relationship).permit(:user_id, :wiki_id, :collaborator, :creator_created)
  end
  
end