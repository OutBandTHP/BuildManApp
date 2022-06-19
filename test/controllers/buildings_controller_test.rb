require "test_helper"

class BuildingsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:userone)
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    @project = projects(:one)
    @building = buildings(:one)
  end
end
