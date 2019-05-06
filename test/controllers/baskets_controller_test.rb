require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get baskets_add_url
    assert_response :success
  end

  test "should get remove" do
    get baskets_remove_url
    assert_response :success
  end

  test "should get show" do
    get baskets_show_url
    assert_response :success
  end

end
