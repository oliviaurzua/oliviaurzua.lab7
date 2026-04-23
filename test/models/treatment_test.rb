require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  setup do
    @owner = Owner.create!(first_name: "Test", last_name: "Owner", email: "owner_treat@vet.com", phone: "123")
    @pet = Pet.create!(name: "Test Pet", species: "cat", weight: 5, date_of_birth: 2.years.ago, owner: @owner)
    @vet = Vet.create!(first_name: "Test", last_name: "Vet", specialization: "General", email: "vet_treat@vet.com")
    @appointment = Appointment.create!(date: Date.tomorrow, reason: "Vaccines", pet: @pet, vet: @vet, status: "scheduled")
  end

  test "should save a valid treatment" do
    treatment = Treatment.new(name: "Rabies Vaccine", administered_at: Time.current, appointment: @appointment)
    assert treatment.save, "Failed to save a valid treatment: #{treatment.errors.full_messages.join(', ')}"
  end

  test "should not save treatment without required fields" do
    treatment = Treatment.new
    assert_not treatment.save, "Saved the treatment without required fields"
    assert_not_nil treatment.errors[:name], "No validation error for name"
    assert_not_nil treatment.errors[:administered_at], "No validation error for administered_at"
    assert_not_nil treatment.errors[:appointment], "No validation error for appointment"
  end
end