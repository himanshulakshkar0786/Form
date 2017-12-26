class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	before_action :find_post, except: [:new, :index, :create]

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to root_path
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
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
