require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  setup do
    @owner = Owner.create!(first_name: "Test", last_name: "Owner", email: "owner_app@vet.com", phone: "123")
    @pet = Pet.create!(name: "Test Pet", species: "dog", weight: 10, date_of_birth: 1.year.ago, owner: @owner)
    @vet = Vet.create!(first_name: "Test", last_name: "Vet", specialization: "General", email: "vet_app@vet.com")
  end

  test "should save a valid appointment" do
    appointment = Appointment.new(date: Date.tomorrow, reason: "Annual checkup", pet: @pet, vet: @vet, status: "scheduled")
    assert appointment.save, "Failed to save a valid appointment: #{appointment.errors.full_messages.join(', ')}"
  end

  test "should not save appointment without required fields" do
    appointment = Appointment.new
    assert_not appointment.save, "Saved the appointment without required fields"
    assert_not_nil appointment.errors[:date], "No validation error for date"
    assert_not_nil appointment.errors[:reason], "No validation error for reason"
    assert_not_nil appointment.errors[:pet], "No validation error for pet"
    assert_not_nil appointment.errors[:vet], "No validation error for vet"
    assert_not_nil appointment.errors[:status], "No validation error for status"
  end
end