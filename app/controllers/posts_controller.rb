class PostsController < ApplicationController
    before_filter :require_login, only: [:new, :create]
    
    def new
        @post = Post.new
    end
    
    def index
        @post = Post.all
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        
        if @post.save
           redirect_to posts_path
        else
            render 'new'
        end
    end
    
    
    private
    
    def post_params
         params.require(:post).permit(:content,:title)
    end
end
