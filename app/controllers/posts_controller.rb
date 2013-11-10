class PostsController < ApplicationController
load_and_authorize_resource
  def index
    if params[:search]
      @search = params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").paginate(:per_page => 5, :page => params[:page])
    elsif params[:tag]
      @posts = Post.paginate(:page=>params[:page], :per_page =>5).order('created_at DESC').tagged_with(params[:tag])
      @tag = params[:tag]
    else
      @posts = Post.paginate(:page=>params[:page], :per_page =>5).order('created_at DESC')
    end
    @featured = Post.tagged_with("#featured").order("created_at DESC").first()
  end

  def new
       @post = Post.new
      1.times {@post.songs.build}
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
      params.require(:post).permit!
    end

end
