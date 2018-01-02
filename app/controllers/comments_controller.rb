class CommentsController < ApplicationController

	before_action :authenticate_user!, except: :show
	before_action :find_comment, only: [:edit, :update, :destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment= @post.comments.create(comment_params)
		redirect_to post_path(@post)
		flash[:success] = "Comment created!"
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
      		redirect_to post_path(@post)
    	else
      		render 'edit'
    	end
	end

	def destroy	
		#@comment.destroy
		#redirect_to post_path(@post)
		#flash[:success] = "Comment deleted!"

		#if @comment.user != current_user
		if @comment.post.user_id != current_user.id
			redirect_to post_path(@post)
			flash[:success] = "You are not authorized to delete this comment."
		else
			@comment.destroy
			redirect_to post_path(@post)
			flash[:success] = "Comment deleted!"
		end
	end

	private

	def find_comment
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:description, :user_id)
	end
end