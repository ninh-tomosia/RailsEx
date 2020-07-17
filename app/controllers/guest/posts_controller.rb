class Guest::PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
        @comments = Comment.find_by(post_id: @post)
    end
end