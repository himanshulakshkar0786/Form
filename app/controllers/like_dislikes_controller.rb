class LikeDislikesController < ApplicationController

  before_action :authenticate_user!

  def like
  	@post = Post.find(params[:id])
    url = params[:url]
    if url == "show"

      if current_user.voted_up_on? @post      
          redirect_to post_path(@post)
          flash[:success] = "Post already liked!"
      else
          @post.upvote_by current_user
          redirect_to post_path(@post)
          flash[:success] = "Post liked!"
      end
    
    elsif url == "my_posts"

      if current_user.voted_up_on? @post      
          redirect_to posts_user_path(@post.user.id)
          flash[:success] = "Post already liked!"
      else
          @post.upvote_by current_user
          redirect_to posts_user_path(@post.user.id)
          flash[:success] = "Post liked!"
      end
      
    else

      if current_user.voted_up_on? @post      
          redirect_to root_path
          flash[:success] = "Post already liked!"
      else
          @post.upvote_by current_user
          redirect_to root_path
          flash[:success] = "Post liked!"
      end
    end
  end  

  def dislike
  	@post = Post.find(params[:id])
    url = params[:url]
    if url == "show"

      if current_user.voted_down_on? @post    
        redirect_to post_path(@post)
        flash[:success] = "Post already disliked!"
      else
        @post.downvote_by current_user
        redirect_to post_path(@post)
        flash[:success] = "Post disliked!"
      end

    elsif url == "my_posts"

      if current_user.voted_down_on? @post    
        redirect_to posts_user_path(@post.user.id)
        flash[:success] = "Post already disliked!"
      else
        @post.downvote_by current_user
        redirect_to posts_user_path(@post.user.id)
        flash[:success] = "Post disliked!"
      end

    else

      if current_user.voted_down_on? @post    
        redirect_to root_path
        flash[:success] = "Post already disliked!"
      else
        @post.downvote_by current_user
        redirect_to root_path
        flash[:success] = "Post disliked!"
      end
    end
  end

  def upvote
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    if current_user.voted_up_on? @comment      
        redirect_to post_path(@post)
        flash[:success] = "Comment already liked!"
    else
        @comment.upvote_by current_user
        redirect_to post_path(@post)
        flash[:success] = "Comment liked!"
    end
  end

  def downvote
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    if current_user.voted_down_on? @comment    
      redirect_to post_path(@post)
      flash[:success] = "Comment already disliked!"
    else
      @comment.downvote_by current_user
      redirect_to post_path(@post)
      flash[:success] = "Comment disliked!"
    end
  end

end