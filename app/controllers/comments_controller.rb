class CommentsController < ApplicationController
  def index
  end
  def create
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end
end
