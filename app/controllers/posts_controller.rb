class PostsController < ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @post.update(user_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy
  end

  def show; end

private

  def find_user
    @post = Post.find_by(id: params[:id])
  end

  def user_params
    params.require(:post).permit(:user_id, :title, :description, :author)
  end
end
