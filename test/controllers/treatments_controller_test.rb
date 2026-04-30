require "test_helper"

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment = treatments(:one)
    @appointment = appointments(:one)
  end

  test "should get new" do
    get new_appointment_treatment_url(@appointment)
    assert_response :success
  end

  test "should create treatment" do
    assert_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: { treatment: { name: "Nuevo Tratamiento", medication: "Pildoras", dosage: "1 al dia", notes: "Test", administered_at: "2024-12-01 10:00:00" } }
    end
    assert_redirected_to appointment_url(@appointment)
    assert flash[:notice]
  end

  test "should not create treatment with invalid params" do
    assert_no_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: { treatment: { name: "" } } 
    end
    assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_appointment_treatment_url(@appointment, @treatment)
    assert_response :success
  end

  test "should update treatment" do
    patch appointment_treatment_url(@appointment, @treatment), params: { treatment: { name: "Actualizado" } }
    assert_redirected_to appointment_url(@appointment)
    assert flash[:notice]
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete appointment_treatment_url(@appointment, @treatment)
    end
    assert_redirected_to appointment_url(@appointment)
    assert flash[:notice]
  end
end