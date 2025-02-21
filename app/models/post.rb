# frozen_string_literal: true
# This is your post model.
class Post < ApplicationRecord
  validates :title, presence: true
end
