require 'mocha/test_unit'
require 'timecop'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'index returns top three trending posts within last two days' do
    post1 = nil
    post2 = nil
    post3 = nil
    post4 = nil
    Timecop.freeze(Time.zone.today - 1.day) do
      post1 = create_post
      post1.expects(:compute_trending_score).returns(10)
      post4 = create_post
      post4.expects(:compute_trending_score).returns(15)
    end
    Timecop.freeze(Time.zone.today) do
      post2 = create_post
      post2.expects(:compute_trending_score).returns(20)
    end
    Timecop.freeze(Time.zone.today - 4.days) do
      post3 = create_post
      post3.expects(:compute_trending_score).returns(100)
    end
    expected_top_three_posts = [post2, post4, post1]
    home_controller = HomeController.new
    home_controller.index
    assert_equal expected_top_three_posts, home_controller.instance_variable_get(:@posts)
  end

  test 'index only two posts within last two days' do
    post1 = nil
    post2 = nil
    post3 = nil
    post4 = nil
    Timecop.freeze(Time.zone.today - 1.day) do
      post1 = create_post
      post1.expects(:compute_trending_score).returns(10)
      post4 = create_post
      post4.expects(:compute_trending_score).returns(15)
    end
    Timecop.freeze(Time.zone.today - 4.days) do
      post2 = create_post
      post2.expects(:compute_trending_score).returns(20)
    end
    Timecop.freeze(Time.zone.today - 4.days) do
      post3 = create_post
      post3.expects(:compute_trending_score).returns(100)
    end
    expected_top_three_posts = [post4, post1, post2]
    home_controller = HomeController.new
    home_controller.index
    assert_equal expected_top_three_posts, home_controller.instance_variable_get(:@posts)
  end

  test 'index only two posts in total' do
    post1 = nil
    post2 = nil
    Timecop.freeze(Time.zone.today - 1.day) do
      post1 = create_post
      post1.expects(:compute_trending_score).returns(10)
    end
    Timecop.freeze(Time.zone.today - 4.days) do
      post2 = create_post
      post2.expects(:compute_trending_score).returns(20)
    end
    expected_top_three_posts = [post1, post2]
    home_controller = HomeController.new
    home_controller.index
    assert_equal expected_top_three_posts, home_controller.instance_variable_get(:@posts)
  end
end
