module PostsHelper
  def truncate_content(content)
    truncate(content, length: 87)
  end
end
