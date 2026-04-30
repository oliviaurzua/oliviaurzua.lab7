require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vet = vets(:one)
  end

  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should show vet" do
    get vet_url(@vet)
    assert_response :success
  end

  test "should create vet" do
    assert_difference("Vet.count") do
      post vets_url, params: { vet: { first_name: "Nuevo", last_name: "Doctor", email: "nuevo@vet.com", specialization: "Cirugía", phone: "123" } }
    end
    assert_redirected_to vet_url(Vet.last)
    assert flash[:notice]
  end

  test "should not create vet with invalid params" do
    assert_no_difference("Vet.count") do
      post vets_url, params: { vet: { first_name: "", email: "malo@vet.com" } }
    end
    assert_response :unprocessable_entity
  end

  test "should update vet" do
    patch vet_url(@vet), params: { vet: { first_name: "Actualizado" } }
    assert_redirected_to vet_url(@vet)
    assert flash[:notice]
  end

  test "should destroy vet" do
    assert_difference("Vet.count", -1) do
      delete vet_url(@vet)
    end
    assert_redirected_to vets_url
    assert flash[:notice]
  end
end