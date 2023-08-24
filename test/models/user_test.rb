require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have a valid fixture" do
    assert users(:karina).valid?
  end

  test "should have many karina_photos" do
    karina = users(:karina)
    assert_equal 2, karina.karina_photos.count
  end
end
