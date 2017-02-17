class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def new
    render :new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post_url
    else
      redirect_to new_post_url
    end
  end

  def edit
    @post = Post.find(params[:id])
    if allow_to_edit?(@post)
      render :edit
    else
      redirect_to post_url
    end

  end

  def update
    post = Post.find(params[:id])
    if allow_to_edit?(post) && post.update
      redirect_to post_url
    else
      redirect_to edit_post_url
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,
                                 :url,
                                 :content,
                                 :sub_id,
                                 :author_id)
  end

  def allow_to_edit?(post)
    return false unless post && current_user
    current_user.id == post.author_id
  end
end
