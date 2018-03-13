class Post < ApplicationRecord
  validates :title, :author_id, presence: true

  belongs_to :author
end
