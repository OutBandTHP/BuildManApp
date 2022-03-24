require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @inactive_user  = users(:inactive)
    @activated_user = users(:usertwo)
  end

  test "should redirect when user not activated" do
    get user_path(@inactive_user, locale: :en)
    assert_response      :redirect
    assert_redirected_to root_url
  end

  test "should display user when activated" do
    get user_path(@activated_user, locale: :en)
    assert_response :success
    assert_template 'users/show'
  end
  
end
