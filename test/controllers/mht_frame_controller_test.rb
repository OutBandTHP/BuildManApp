require 'test_helper'

class FramePagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    I18n.default_locale = :en
    @base_title = I18n.t('navigation.app_name')
  end
  
  test "should get root" do
    get root_url(locale: 'en')
    assert_response :success
  end
  
  test "should get home" do
    get root_path(locale: 'en')
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path(locale: 'en')
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path(locale: 'en')
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path(locale: 'en')
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get news" do
    get news_path(locale: 'en')
    assert_response :success
    assert_select "title", "News | #{@base_title}"
  end

  test "should get Hebrew" do
    get news_path(locale: 'en')
    assert_response :success
    post '#/home', params: { set_locale: 'he' }
    assert_redirected_to root_url(locale: 'he')
  end

  test "should get English" do
    get news_path(locale: 'he')
    assert_response :success
    post '#/home', params: { set_locale: 'en' }
    assert_redirected_to root_url(locale: 'en')
  end
end