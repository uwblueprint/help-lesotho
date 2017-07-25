class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    authorize @post, :owner?
  end

  def update
    authorize @post, :owner?
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    authorize @post, :owner?
    @post.destroy
    redirect_to root_path
  end

  def search
    params.permit(:query)
    puts params[:query]
    @query = params[:query]
    @posts = Post.where("title ILIKE ? OR content ILIKE ?", "%#{@query}%", "%#{@query}");
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
