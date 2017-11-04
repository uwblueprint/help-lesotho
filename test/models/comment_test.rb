require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "comment must have a user" do
    comment = new_comment(user: nil)
  assert_not comment.save 
  end

  test "comment must belong to a post" do
    comment = new_comment(post: nil)
  assert_not comment.save 
  end

end
