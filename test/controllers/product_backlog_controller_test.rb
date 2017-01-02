require 'test_helper'

class ProductBacklogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_backlog_index_url
    assert_response :success
  end

end
