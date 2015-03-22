class RelationshipsController < ApplicationController
  
  def new
    @relationship = Relationship.new
    @user_options = User.where(role:"premium")
  end

  def create
    @relationship = Relationship.new(relationship_params)
    @wiki = Wiki.find_by(params[:id])
    if @relationship.save
      flash[:notice] = "Your new Collaborator was saved."
      redirect_to :back
    else
      flash[:notice] = 'Please try again.'
      redirect_to :back
    end
  end
  
   def destroy
     @relationship = Relationship.find(params[:id])
    
     authorize(@relationship)
    
     if @relationship.destroy
      flash[:notice] = "Your Collaborator has been removed."
      redirect_to :back
    else
      flash[:error] = "Collaborator couldn't be deleted. Please try again."
      redirect_to :back
    end
  end
  
  private
  
  def relationship_params
    params.require(:relationship).permit(:wiki_id, :user_id, :creator_created)
  end
end