class ForumController < ApplicationController
    def forumhome
        @posts = Post.all.order(created_at: :desc)
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        respond_to do |format|
            if @post.save
              format.html { redirect_to action: 'forumhome', notice: 'Post was successfully created.' }
              format.json { render :show, status: :created, location: @post }
            else
              format.html { render :new }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    private def post_params
        params.require(:post).permit(:username, :body)
    end
end
