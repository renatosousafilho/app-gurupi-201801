class PostQueries
  def self.all_by_user(user)
    if user.is_admin?
      @posts = Post.all
    else
      @posts = user.author.posts
    end
  end
end
