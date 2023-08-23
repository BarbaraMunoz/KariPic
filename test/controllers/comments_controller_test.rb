# test/controllers/comments_controller_test.rb
require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:comment_one)
    sign_in users(:karina)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post karina_photo_comments_url(@comment.karina_photo), params: { comment: { content: "New Comment" } }
    end

    assert_redirected_to karina_photo_url(@comment.karina_photo)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete karina_photo_comment_url(@comment.karina_photo, @comment)
    end

    assert_redirected_to karina_photo_url(@comment.karina_photo)
  end
end

