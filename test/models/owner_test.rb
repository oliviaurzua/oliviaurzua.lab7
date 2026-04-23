require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  test "should save a valid owner" do
    owner = Owner.new(first_name: "Juan", last_name: "Perez", email: "juan@vetclinic.com", phone: "+56912345678")
    assert owner.save, "Failed to save a valid owner"
  end

  test "should not save owner without required fields" do
    owner = Owner.new
    assert_not owner.save, "Saved the owner without required fields"
    assert_not_nil owner.errors[:first_name], "No validation error for first_name"
    assert_not_nil owner.errors[:last_name], "No validation error for last_name"
  end

  test "should reject invalid email format" do
    owner = Owner.new(first_name: "Ana", last_name: "Gomez", email: "correo-malo", phone: "123")
    assert_not owner.save, "Saved owner with invalid email"
    assert_not_nil owner.errors[:email], "No validation error for invalid email"
  end

  test "should reject duplicate email" do
    Owner.create!(first_name: "Pedro", last_name: "Soto", email: "unico@vetclinic.com", phone: "111")
    
    duplicate_owner = Owner.new(first_name: "Maria", last_name: "Luz", email: "unico@vetclinic.com", phone: "222")
    assert_not duplicate_owner.save, "Saved owner with duplicate email"
    assert_includes duplicate_owner.errors[:email], "has already been taken"
  end
end