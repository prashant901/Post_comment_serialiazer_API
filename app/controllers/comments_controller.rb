class CommentsController < ApplicationController
    before_action :set_posts

    def index
        @comments = @post.comments
        render json: @comments, each_serializer: CommentSerializer
    end

    def create 
        @comment = @post.comments.new(comment_params)
        if @comment.save
            render json: @comment, notice: "Comment was created"
        else 
            render json: @comment.errors, notice: "comment is not created"
        end
    end
    def destroy
        @comment =@post.comment.find(params[:id])
        @comment.destroy
    end

     private 
      def set_posts
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.permit(:content)
      end
end
