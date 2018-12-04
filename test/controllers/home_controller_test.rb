require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end


  #----------------Contact Tests------------------#
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_template layout: 'application'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'If you have any problems or even just some general feedback, why not send us a message using the contact form below?'
  end

  test "should post request contact but no email" do
    post request_contact_path

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post request_contact_path, params: { name: "Kieran Rigby", email: "kieran@kierigby.com", telephone: "07480944162", message:"Hello, this is a test message!" }

    assert_response :redirect
    assert_not_empty flash[:notice]
    assert_nil flash[:alert]
  end



end
