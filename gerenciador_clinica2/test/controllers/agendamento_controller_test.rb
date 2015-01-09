require 'test_helper'

class AgendamentoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get salva" do
    get :salva
    assert_response :success
  end

end
