require "test_helper"

class KarinaPhotosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @karina_photo = karina_photos(:karina_photos_one)
  end

  test "should get index" do
    get karina_photos_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:karina)
    get new_karina_photo_url
    assert_response :success
  end

  test "should create karina_photo" do
    sign_in users(:karina)
    assert_difference("KarinaPhoto.count") do
      post karina_photos_url, params: { karina_photo: { description: @karina_photo.description, title: @karina_photo.title, image: @karina_photo.image } }
    end

    assert_redirected_to karina_photo_url(KarinaPhoto.last)
  end

  test "should show karina_photo" do
    get karina_photo_url(@karina_photo)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:karina)
    get edit_karina_photo_url(@karina_photo)
    assert_response :success
  end

  test "should update karina_photo" do
    sign_in users(:karina)
    patch karina_photo_url(@karina_photo), params: { karina_photo: { description: @karina_photo.description, title: @karina_photo.title, image: @karina_photo.image } }
    assert_redirected_to karina_photo_url(@karina_photo)
  end

  test "should destroy karina_photo" do
    sign_in users(:karina)
    assert_difference("KarinaPhoto.count", -1) do
      delete karina_photo_url(@karina_photo)
    end

    assert_redirected_to karina_photos_url
  end
end
