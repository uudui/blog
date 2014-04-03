require 'test_helper'

class Settings::ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
