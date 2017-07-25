class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at").last(3).reverse
  end
end
