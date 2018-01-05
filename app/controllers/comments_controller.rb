class CommentsController < ApplicationController

	before_action :authenticate_user!, except: :show
	before_action :load_resource, only: [:edit, :update, :destroy]
	before_action :ensure_current_user, only: [:edit, :update, :destroy]

	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment= @post.comments.create(comment_params.merge(user: current_user))
		if @comment.save
			redirect_to post_path(@post)
			flash[:success] = "Comment created!"
		else
			redirect_to new_post_comment_path(@post)
			flash[:error] = @comment.errors.full_messages.join(",")
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
      		redirect_to post_path(@post)
      		flash[:success] = "Comment updated!"
    	else
      		render 'edit'
		end
	end

	def destroy	
		if @comment.destroy
			flash[:success] = "Comment deleted!"
		else
			flash[:error] = "comment can not be deleted!"
		end
			redirect_to post_path(@post)
	end

	private

	def load_resource
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def ensure_current_user
		unless @comment.user == current_user
			flash[:error] = "You are not authorized to edit and delete this comment!"
			redirect_to post_path(@post)
		end
	end	

	def comment_params
		params.require(:comment).permit(:description)
	end
end