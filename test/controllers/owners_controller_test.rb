require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  fixtures :owners
  setup do
    @owner = owners(:one) 
  end

  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should show owner" do
    get owner_url(@owner)
    assert_response :success
  end

  test "should create owner" do
    assert_difference("Owner.count") do
      post owners_url, params: { owner: { first_name: "New", last_name: "Owner", email: "new@owner.com", phone: "123456" } }
    end
    assert_redirected_to owner_url(Owner.last)
    assert flash[:notice]
  end

  test "should not create owner with invalid params" do
    assert_no_difference("Owner.count") do
      post owners_url, params: { owner: { first_name: "Incomplete", email: "bad@owner.com" } }
    end
    assert_response :unprocessable_entity
  end

  test "should update owner" do
    patch owner_url(@owner), params: { owner: { first_name: "Updated Name" } }
    assert_redirected_to owner_url(@owner)
    assert flash[:notice]
  end

  test "should destroy owner" do
    assert_difference("Owner.count", -1) do
      delete owner_url(@owner)
    end
    assert_redirected_to owners_url
    assert flash[:notice]
  end
end