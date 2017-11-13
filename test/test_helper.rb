require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    def new_user(params = {})
      User.new({
        email: 'test@email.com',
        password: 'password',
      }.merge(params))
    end

    def create_user(params = {})
      return @user if @user
      @user = new_user(params)
      @user.save!
      @user
    end

    def new_comment(params = {})
      Comment.new({
        user: create_user,
        post: create_post,
      }.merge(params))
    end

    def create_comment
      comment = new_comment
      comment.save!
      comment
    end

    def new_post(params = {})
      Post.new({
        user: create_user,
      }.merge(params))
    end

    def create_post
      post = new_post
      post.save!
      post
    end
  end
end
