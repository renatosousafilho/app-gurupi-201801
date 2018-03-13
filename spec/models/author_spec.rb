require 'rails_helper'

describe Author do
  let(:user) { User.create(email: "brucewayne@lja.com", password: "pwd12345")}
  it "with data valid" do
    author = Author.new(name: "John Doe", bio: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do...', user: user)
    expect(author).to be_valid
  end
end
