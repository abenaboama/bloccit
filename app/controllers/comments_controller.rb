class CommentsController < ApplicationController
  def create
   @topic = Topic.find(params[:topic_id])
   @post = Posts.find(params[:post_id])
   @comment = Comments.new(comment_params)
   @comment.post = @post
   @comment.user = current_user

   if @comment.save
     flash[:notice] = "Comment was saved."
     redirect_to [@topic, @post]
   else
     flash[:error]="There as an error saving your comment. Please try again."
     redirect_to [@topic, @post]
   end
 end


 def comment_params
  params.require(:comment).permit(:body)
end

end

