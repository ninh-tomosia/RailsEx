class Admin::PostsController < AdminController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        post.user = current_user
        binding.pry
        if post.save
            @posts = Post.all
            render action: :index
        else
            @post = Post.new
            render action: :new
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end
end