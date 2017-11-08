class Post < ApplicationRecord
  default_scope { where(deleted: false) }
  belongs_to :user
  has_many :comments, dependent: :destroy

  # Calculate the score of the post for the purpose of selecting trending posts
  # formula is log_10(activities) + sign * (submission_time - epoch)/45000
  # where activities = max{number of likes + number of comments, 1},
  # epoch = 1970/1/1, time difference is in seconds,
  # sign = 1 if there is at least one like or comment, and 0 otherwise
  def compute_trending_score
    # TODO(ajyang99) replace 5 with the actual number of likes once like
    # functionality is implemented
    mock_num_likes = 5
    num_activities = mock_num_likes + comments.length
    sign = num_activities > 0 ? 1 : 0
    num_activities = [num_activities, 1].max
    seconds_since_epoch = created_at.to_i
    # post fresher by 12.5h (45000s) equiv to older post with 10x activities
    freshness_coefficient = 45_000
    Math.log10(num_activities) +
      sign * seconds_since_epoch / freshness_coefficient
  end

  def destroy
    update(deleted: true)
  end
end
