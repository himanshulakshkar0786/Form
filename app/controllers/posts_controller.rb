class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_resources, except: [:new, :index, :create]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
      @posts = if params[:category_id].present? && params[:term].present?
        Post.joins(:user, :category).where('(title like ? OR users.name Like ?) AND category_id like ?', "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:category_id]}%")
      
      elsif params[:category_id].present?
          Category.find(params[:category_id]).posts

      elsif params[:term].present?
          Post.joins(:user).where('title like ? OR name Like ?', "%#{params[:term]}%", "%#{params[:term]}%")
      
      else
        Post.all.order(created_at: :desc).page(params[:page]).per(7)
      end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:success] = "Post created!"
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
      flash[:success] = "Post updated!"
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
      flash[:success] = "Post deleted!"
    else
      redirect_to root_path
      flash[:success] = "Post can't deleted!"
    end
  end

  private

  def load_resources
    @post = Post.find(params[:id])
  end

  def ensure_current_user
    if current_user.id != @post.user_id
      url = params[:url]
      if url == "show"
        redirect_to post_path(@post)
        flash[:error] = "You are not authorized to edit and delete other user's post."
      else
        redirect_to root_path
        flash[:error] = "You are not authorized to edit and delete other user's post."
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :description, :category_id, :image, :audio, :video, :type)
  end
end