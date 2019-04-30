require 'test_helper'

module InitInquiry
  class InquiriesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @inquiry = init_inquiry_inquiries(:one)
    end

    test "should get index" do
      get inquiries_url
      assert_response :success
    end

    test "should get new" do
      get new_inquiry_url
      assert_response :success
    end

    test "should create inquiry" do
      assert_difference('Inquiry.count') do
        post inquiries_url, params: { inquiry: { description: @inquiry.description, email: @inquiry.email, name: @inquiry.name, phone: @inquiry.phone, status: @inquiry.status } }
      end

      assert_redirected_to inquiry_url(Inquiry.last)
    end

    test "should show inquiry" do
      get inquiry_url(@inquiry)
      assert_response :success
    end

    test "should get edit" do
      get edit_inquiry_url(@inquiry)
      assert_response :success
    end

    test "should update inquiry" do
      patch inquiry_url(@inquiry), params: { inquiry: { description: @inquiry.description, email: @inquiry.email, name: @inquiry.name, phone: @inquiry.phone, status: @inquiry.status } }
      assert_redirected_to inquiry_url(@inquiry)
    end

    test "should destroy inquiry" do
      assert_difference('Inquiry.count', -1) do
        delete inquiry_url(@inquiry)
      end

      assert_redirected_to inquiries_url
    end
  end
end
