require 'test_helper'

class MortgageControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get mortgage_controller_url
    assert_response :success
  end

end
