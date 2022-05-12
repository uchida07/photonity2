class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def search_tag
     @post = Post.new
     @posts = Post.search(params[:keyword])
  end
   
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @reply = Reply.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.save
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :introduction, :machine, :image, :tag)
  end

end
