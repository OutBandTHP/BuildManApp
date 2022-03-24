require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path(locale: 'en')
    assert_template 'mht_frame/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", news_path
    assert_select "a[href=?]", login_path
    user = users(:userone)
    log_in_as(user)
    get root_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(user)
    assert_select "a[href=?]", edit_user_path(user)
  end
end