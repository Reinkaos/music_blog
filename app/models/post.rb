class Post < ApplicationRecord #:nodoc:
  validates :title, presence: true
  validates :body,  presence: true
end
