class CommentsController < ApplicationController
  def index
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comment_path{comment.prototype} # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "comments/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end

  
  private
  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end
end
