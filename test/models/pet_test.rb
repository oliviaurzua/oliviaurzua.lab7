require "test_helper"

class PetTest < ActiveSupport::TestCase
  setup do
    @owner = Owner.create!(first_name: "Test", last_name: "Owner", email: "test_owner_pet@vet.com", phone: "123")
  end

  test "should save a valid pet" do
    pet = Pet.new(name: "Firulais", species: "dog", weight: 15.5, date_of_birth: 2.years.ago, owner: @owner)
    assert pet.save, "Failed to save a valid pet"
  end

  test "should reject invalid species" do
    pet = Pet.new(name: "Dragon", species: "dinosaur", weight: 10, date_of_birth: 1.year.ago, owner: @owner)
    assert_not pet.save, "Saved a pet with invalid species"
    assert_not_nil pet.errors[:species], "No validation error for invalid species"
  end

  test "should reject future date of birth" do
    pet = Pet.new(name: "Viajero del Tiempo", species: "cat", weight: 5, date_of_birth: 1.month.from_now, owner: @owner)
    assert_not pet.save, "Saved a pet born in the future"
    assert_not_nil pet.errors[:date_of_birth], "No validation error for future date"
  end

  test "should reject weight zero or negative" do
    pet = Pet.new(name: "Fantasma", species: "cat", weight: 0, date_of_birth: 1.year.ago, owner: @owner)
    assert_not pet.save, "Saved a pet with 0 weight"
    assert_not_nil pet.errors[:weight], "No validation error for weight"
  end
end
