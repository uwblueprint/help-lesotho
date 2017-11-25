require 'test_helper'
require 'mocha/test_unit'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'post_params has all valid params if user is admin' do
    current_user = create_user(admin: true)
    params = ActionController::Parameters.new(
      post: {
        title: 'sample title',
        content: 'sample content',
        featured: true,
        invalid_param: true,
      }
    )

    posts_controller = PostsController.new
    posts_controller.stubs(:params).returns(params)
    posts_controller.stubs(:current_user).returns(current_user)
    post_params = posts_controller.send(:post_params)
    assert_includes post_params.keys, 'title'
    assert_includes post_params.keys, 'content'
    assert_includes post_params.keys, 'featured'
  end

  test 'post_params drops invalid params if user is admin' do
    current_user = create_user(admin: true)
    params = ActionController::Parameters.new(
      post: {
        title: 'sample title',
        content: 'sample content',
        featured: true,
        invalid_param: true,
      }
    )

    posts_controller = PostsController.new
    posts_controller.stubs(:params).returns(params)
    posts_controller.stubs(:current_user).returns(current_user)
    post_params = posts_controller.send(:post_params)
    refute_includes post_params.keys, 'invalid_param'
  end

  test 'post_params has all valid params if user is not admin' do
    current_user = create_user
    params = ActionController::Parameters.new(
      post: {
        title: 'sample title',
        content: 'sample content',
      }
    )

    posts_controller = PostsController.new
    posts_controller.stubs(:params).returns(params)
    posts_controller.stubs(:current_user).returns(current_user)
    post_params = posts_controller.send(:post_params)
    assert_includes post_params.keys, 'title'
    assert_includes post_params.keys, 'content'
  end

  test 'post_params drops invalid params if user is not admin' do
    current_user = create_user
    params = ActionController::Parameters.new(
      post: {
        title: 'sample title',
        content: 'sample content',
        featured: true,
      }
    )

    posts_controller = PostsController.new
    posts_controller.stubs(:params).returns(params)
    posts_controller.stubs(:current_user).returns(current_user)
    post_params = posts_controller.send(:post_params)
    refute_includes post_params.keys, 'featured'
  end
end
