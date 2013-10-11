class PostsController < ApplicationController
load_and_authorize_resource
  def index
    @posts = Post.paginate(:page=>params[:page], :per_page =>5)
  end

  def new
       @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create

    if(signed_in?)
     @post = current_user.posts.create(post_params)
      if @post.save
          redirect_to @post
        else
          render 'new'
      end
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
