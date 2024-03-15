class PostsController < ApplicationController
 before_action :set_posts, only: [:show,:update,:destroy]

    def index 
        @posts = Post.all 
        render json: @posts
    end


    def show 
        @post = Post.find(params[:id])
        render json: @post, Serializer: PostSerializer 
    end

    def create 
        @post = Post.new(post_params)
        if @post.save 
            render json: @post, notice: "Post was Successfully Created"
        else 
            render json: @post.errors, notice: "Post is not created"
       end
    end
  
  def update
        if @post.update(post_params)
            render json: @post
        else
            render json: @post.errors, notice:"Post is not Updated"
        end
   end


    def destroy 
        @post.destroy
    end

  private
    def set_posts
        @post = Post.find(params[:id])
    end
    def post_params
        params.permit(:title,:content)
    end
end
