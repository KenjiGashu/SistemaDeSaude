require 'test_helper'

class PricipalControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
