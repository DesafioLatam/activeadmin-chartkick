class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end

