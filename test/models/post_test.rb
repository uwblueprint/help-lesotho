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
end
