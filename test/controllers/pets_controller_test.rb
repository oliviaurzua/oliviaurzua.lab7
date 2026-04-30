require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:one)
    @owner = owners(:one) 
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should create pet" do
    assert_difference("Pet.count") do
      post pets_url, params: { pet: { name: "Nuevo", species: "dog", breed: "Pug", weight: 5.0, date_of_birth: "2023-01-01", owner_id: @owner.id } }
    end
    assert_redirected_to pet_url(Pet.last)
    assert flash[:notice]
  end

  test "should not create pet with invalid params" do
    assert_no_difference("Pet.count") do
      post pets_url, params: { pet: { name: "", species: "Perro" } }
    end
    assert_response :unprocessable_entity
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { name: "Nombre Actualizado" } }
    assert_redirected_to pet_url(@pet)
    assert flash[:notice]
  end

  test "should destroy pet" do
    assert_difference("Pet.count", -1) do
      delete pet_url(@pet)
    end
    assert_redirected_to pets_url
    assert flash[:notice]
  end
end