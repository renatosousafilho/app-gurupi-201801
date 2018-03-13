class AddPostToAuthor
  include UseCase

  attr_reader :post

  validate :has_errors
  validate :author_is_enabled
  validate :post_belongs_to_author, if: lambda { !@user.is_admin? }

  def initialize(post, user)
    @post = post
    @user = user
  end

  def perform
    return unless valid?

    @post.author_id = @user.author.id unless @user.is_admin?
    @post.save

    self
  end

  private

  def has_errors
    return if @post.valid?

    errors.add(:base, "Invalid post")
  end

  def post_belongs_to_author
    return if @post.author_id == @user.author.id

    @post.errors.add(:author_id, "invalid author")
    errors.add(:base, "Invalid author")
  end

  def author_is_disabled
    return if @author.enabled?

    errors.add(:base, "Author was disabled")
  end
end
