require 'test_helper'

class MortgagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mortgages_index_url
    assert_response :success
  end

end
