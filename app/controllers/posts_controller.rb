class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	before_action :load_resources, except: [:new, :index, :create]
	before_action :ensure_current_user, only: [:edit, :update, :destroy]

	def new
		@post = Post.new
	end

	def index
  		@posts = if params[:term]
    	Post.where('title LIKE ? OR description LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%")
  		else
    	Post.all
  		end
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to root_path
			flash[:notice] = "Post created!"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
			flash[:notice] = "Post updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
		flash[:notice] = "Post deleted!"
	end

	def upvote
  		@post.upvote_by current_user
  		redirect_to root_path
  		flash[:notice] = "Post liked!"
	end  

	def downvote
  		@post.downvote_by current_user
  		redirect_to root_path
  		flash[:notice] = "Post disliked!"
	end

	private

	def load_resources
		@post = Post.find(params[:id])
	end

    def ensure_current_user
    	if current_user.id != @post.user_id
    		redirect_to root_path
    		flash[:notice] = "You are not authorized to edit and delete this post."
    	end
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end
end