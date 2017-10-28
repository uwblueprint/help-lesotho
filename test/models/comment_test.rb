require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "comment must have a user" do
  	comment = Comment.new
	assert_not comment.save 
  end

  test "comment must belong to a post" do
  	comment = Comment.new
	assert_not comment.save 
  end



end
