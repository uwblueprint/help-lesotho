require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "post must have a user" do
  	post = Post.new
	assert_not post.save 
  end


end
