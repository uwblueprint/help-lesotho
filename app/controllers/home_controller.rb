class HomeController < ApplicationController
  helper PostsHelper
  def index
    # Select 3 posts within last 2 days with highest trending score
    day_limit = 2
    num_post = 3
    @posts = Post
             .select { |post| post['created_at'] >= Time.zone.today - day_limit.day }
             .sort_by(&:compute_trending_score)
             .last(num_post)
             .reverse
    existing_post_num = @posts.length
    return unless existing_post_num < num_post
    # Fill the remaining slots with most recent posts
    most_recent_posts = Post.where.not(id: @posts.map(&:id))
                            .order('created_at')
                            .last(num_post - existing_post_num)
                            .reverse
    @posts += most_recent_posts
  end
end
