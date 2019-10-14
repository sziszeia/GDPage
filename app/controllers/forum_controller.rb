class ForumController < ApplicationController
    def forumhome
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def newpost

    end

    def create
        @post = Post.new(post_params)

        respond_to do |format|
            if @post.save
              format.html { redirect_to action: 'show', id: @post.id, notice: 'Post was successfully created.' }
              format.json { render :show, status: :created, location: @post }
            else
              format.html { render :newpost }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    private def post_params
        params.require(:post).permit(:username, :body)
    end
end
