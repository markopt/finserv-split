require 'test_helper'

class BankingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get banking_index_url
    assert_response :success
  end

end
