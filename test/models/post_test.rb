require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'post must have a user' do
    post = new_post(user: nil)
    assert_not post.save
  end

  test 'compute trending score with zero comment' do
    post = create_post
    post.created_at = Time.zone.local(2017, 1, 1)
    actual_trending_score = post.compute_trending_score
    expected_trending_score = Math.log10(5) +
                              Time.zone.local(2017, 1, 1).to_i / 45_000
    assert actual_trending_score == expected_trending_score
  end

  test 'compute trending score with comments' do
    post = create_post
    10.times { create_comment(post: post) }
    post.reload
    post.created_at = Time.zone.local(2017, 1, 1)
    actual_trending_score = post.compute_trending_score
    expected_trending_score = Math.log10(15) +
                              Time.zone.local(2017, 1, 1).to_i / 45_000
    assert actual_trending_score == expected_trending_score
  end

  test 'querying for posts do not return deleted posts by default' do
    post = create_post
    post_deleted = create_post(deleted: true)
    all_posts = Post.all
    assert_includes all_posts, post
    refute_includes all_posts, post_deleted
  end

  test 'querying for unscoped posts return deleted posts as well' do
    post = create_post
    post_deleted = create_post(deleted: true)
    all_posts = Post.unscoped.all
    assert_includes all_posts, post
    assert_includes all_posts, post_deleted
  end

  test 'new post does not have deleted set to true' do
    post = create_post
    assert_equal false, post.deleted
  end

  test 'destroying a post sets deleted to true' do
    post = create_post
    post.destroy
    assert_equal true, post.deleted
  end
end
