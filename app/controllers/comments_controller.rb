class CommentsController < ApplicationController
  def index
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      redirect_to comment_path{comment.prototype.id} # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = Prototype.find(params[:prototype_id])
      #if you put Prototype.find(params[:id]) then it will be considered comment id. so you need to designate which id. which is prototype_id
      @comments = @prototype.comments
      render "prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end

  
  private
  def comment_params
    params.require(:comment).permit(:comment, :image).merge(user_id: current_user.id)
  end
end
