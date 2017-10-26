module PostsHelper
  def TruncateContent(content)
    content = truncate(content, length:87)
  end
end
