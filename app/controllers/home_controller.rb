class HomeController < ApplicationController
  helper PostsHelper
  def index
    @posts = Post.order('created_at').last(3).reverse
  end
end
