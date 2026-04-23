require "test_helper"

class VetTest < ActiveSupport::TestCase
  test "should save a valid vet" do
    vet = Vet.new(first_name: "Meredith", last_name: "Grey", specialization: "Surgery", email: "grey.test@vetclinic.com")
    assert vet.save, "Failed to save a valid vet"
  end

  test "should not save vet without required fields" do
    vet = Vet.new
    assert_not vet.save, "Saved the vet without required fields"
    assert_not_nil vet.errors[:first_name], "No validation error for first_name"
    assert_not_nil vet.errors[:last_name], "No validation error for last_name"
    assert_not_nil vet.errors[:specialization], "No validation error for specialization"
  end

  test "should reject invalid email format" do
    vet = Vet.new(first_name: "Derek", last_name: "Shepherd", specialization: "Neurology", email: "correo-sin-arroba")
    assert_not vet.save, "Saved vet with invalid email"
    assert_not_nil vet.errors[:email], "No validation error for invalid email"
  end

  test "should reject duplicate email" do
    Vet.create!(first_name: "Cristina", last_name: "Yang", specialization: "Cardiology", email: "unico.vet@vetclinic.com")
    
    duplicate_vet = Vet.new(first_name: "Owen", last_name: "Hunt", specialization: "Trauma", email: "unico.vet@vetclinic.com")
    assert_not duplicate_vet.save, "Saved vet with duplicate email"
    assert_includes duplicate_vet.errors[:email], "has already been taken"
  end
end