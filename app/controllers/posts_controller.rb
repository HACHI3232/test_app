class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: sort_direction)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])


  end

  def update
    @post = Post.find(params[:id])
    if  @post = @post.update(post_params)
      redirect_to posts_path
    else
      render edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:word,:mean)
  end


  def sort_column
    %w[word mean].include?(params[:sort_column]) ? params[:sort_column] : "word"
  end

  def sort_direction
    %w[asc desc].include?(params[:sort_order]) ? params[:sort_order] : "asc"
  end
end
