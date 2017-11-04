require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "post must have a user" do
    post = new_post(user: nil)
  assert_not post.save 
  end

end
