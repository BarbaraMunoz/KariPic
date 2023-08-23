
require "test_helper"

class KarinaPhotosControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:karina)
    @karina_photo = karina_photos(:one)
  end

  test "should get index" do
    get karina_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_karina_photo_url
    assert_response :success
  end

  test "should create karina_photo" do
    assert_difference('KarinaPhoto.count') do
      post karina_photos_url, params: { karina_photo: { title: "New Photo", description: "Description" } }
    end

    assert_redirected_to karina_photo_url(KarinaPhoto.last)
  end

  test "should show karina_photo" do
    get karina_photo_url(@karina_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_karina_photo_url(@karina_photo)
    assert_response :success
  end

  test "should update karina_photo" do
    patch karina_photo_url(@karina_photo), params: { karina_photo: { title: "Updated Photo" } }
    assert_redirected_to karina_photo_url(@karina_photo)
  end

  test "should destroy karina_photo" do
    assert_difference('KarinaPhoto.count', -1) do
      delete karina_photo_url(@karina_photo)
    end

    assert_redirected_to karina_photos_url
  end
end


