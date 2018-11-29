require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'Contact Us'
    assert_select 'description', 'If you have any problems or even just some general feedback, why not send us a message using the contact form below?'
  end

end
