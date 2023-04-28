class PostsController < ApplicationController
  before_action :set_character

  def index
    @posts = if params[:category_id].present?
                  Post.where(category_id: params[:category_id]).order(created_at: sort_direction)
              else
                  Post.order(created_at: sort_direction)
              end
    @categories = Category.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @categories = Category.all

      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @categories = Category.all
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      @categories = Category.all

      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:word, :mean, :category_id)
  end

  def sort_column
    %w[word mean].include?(params[:sort_column]) ? params[:sort_column] : "word"
  end

  def sort_direction
    %w[asc desc].include?(params[:sort_order]) ? params[:sort_order] : "asc"
  end

  def set_character
    @character = Character.find_by(id: 1)
  end
end
