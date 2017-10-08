class Photo < ApplicationRecord
  include ImageUploader[:image]
  # include ActsAsCommentable::Comment
  belongs_to :user
  has_many :comments
  acts_as_votable

end
