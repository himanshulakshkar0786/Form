class CommentsController < ApplicationController

	before_action :authenticate_user!, except: :show
	before_action :load_resource, only: [:edit, :update, :destroy]
	before_action :ensure_current_user, only: [:edit, :update, :destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment= @post.comments.create(comment_params.merge(user: current_user))
		redirect_to post_path(@post)
		#flash[:success] = "Comment created!"
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
      		redirect_to post_path(@post)
      		flash[:notice] = "Comment updated!"
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