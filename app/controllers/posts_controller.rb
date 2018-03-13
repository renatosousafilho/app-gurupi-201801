class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = PostQueries.all_by_user(current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    @use_case = AddPostToAuthor.new(@post, current_user)
    if @use_case.perform
      flash[:success] = "Post created succesful"
      redirect_to posts_path
    else
      @post = @use_case.post
      flash.now[:error] = @use_case.errors.full_messages.first
      render :new
    end
  end

  private


  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

end
