# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save the post without title" do
    post = Post.new
    assert_not post.save, "Saved the post without title"
  end

  test "Should save the post with title" do
    post = Post.new(title: 'Test')
    assert post.save, "Saved the post successfully"
  end
end
