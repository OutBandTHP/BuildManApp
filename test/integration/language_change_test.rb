require "test_helper"

class LanguageChangeTest < ActionDispatch::IntegrationTest
  def setup
    # User with non-en language 
    @user = users(:userfour)
  end

  test "user language changes with language selector" do
    get login_path
    assert_match I18n.locale.to_s, :en
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_match I18n.locale.to_s, :he
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { language: "en"} }
    assert_match I18n.locale.to_s, :en
    I18n.locale = :he
    get root_path
    assert_match @user.language.to_s, :he
  end  
end
