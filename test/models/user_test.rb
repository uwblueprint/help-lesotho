require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user without email" do
    user = new_user(email: nil)
    assert_not user.save
  end

  test "should not save user without password" do
    user = new_user(password: nil)
    assert_not user.save
  end

end
