require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:userone)
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    @project = projects(:two)
  end

  test "should get index" do
    get projects_path
    assert_response :success
  end

  test "should get new" do
    get new_project_path
    assert_response :success
  end

  test "should get edit" do
    get edit_project_path(@project, locale: :en)
    assert_response :success
  end
end
