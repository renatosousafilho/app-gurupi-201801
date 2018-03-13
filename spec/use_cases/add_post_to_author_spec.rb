require 'rails_helper'

describe "AddPostToAuthor" do
  # let(:user1) { User.create(email: "brucewayne@lja.com", password: "pwd12345", password_confirmation: "pwd12345")}
  #
  # let(:user2) { User.create(email: "clarkkent@lja.com", password: "pwd12345", password_confirmation: "pwd12345")}
  #
  # let(:author1) { Author.create(name: "Bruce Wayne", bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", user: user1)}
  #
  # let(:author2) { Author.create(name: "Clark Kent", bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", user: user2)}

  # let(:post1) { }
  #
  # let(:post2) { Post.new(title: "A Case For Use Cases", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", author_id: author2.id)}
  #
  before(:all) do
    @user1 = User.create(email: "brucewayne@lja.com", password: "pwd12345", password_confirmation: "pwd12345", is_admin: true)
    @user2 = User.create(email: "clarkkent@lja.com", password: "pwd12345", password_confirmation: "pwd12345")
    @user3 = User.create(email: "dianaprince@lja.com", password: "pwd12345", password_confirmation: "pwd12345")
    @author1 = Author.create(name: "Bruce Wayne", bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", user: @user1)
    @author2 = Author.create(name: "Clark Kent", bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", user: @user2)
    @author3 = Author.create(name: "Diana Prince", bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", user: @user3)
    @post1 = Post.new(title: "A Case For Use Cases", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", author_id: @author1.id)
    @post2 = Post.new(title: "A Case For Use Cases", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...", author_id: @author2.id)
  end

  it "#perform" do
    use_case = AddPostToAuthor.new(@post1, @user1)
    expect { use_case.perform }.to change { Post.count }.by 1
  end

  it "cannot save to other author" do
    use_case = AddPostToAuthor.new(@post2, @user3)
    expect(use_case).to_not be_valid
  end

  it "can save to other author if is admin" do
    use_case = AddPostToAuthor.new(@post2, @user1)
    expect(use_case).to be_valid
  end
end
