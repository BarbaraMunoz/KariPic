require 'test_helper'

class KarinaPhotoTest < ActiveSupport::TestCase
  test "should have a valid fixture" do
    assert karina_photos(:karina_photos_one).valid?
  end

  test "should belong to a user" do
    karina_photo = karina_photos(:karina_photos_one)
    assert_instance_of User, karina_photo.user
  end
end
