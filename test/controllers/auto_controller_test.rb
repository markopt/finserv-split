require 'test_helper'

class AutoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auto_index_url
    assert_response :success
  end

end
