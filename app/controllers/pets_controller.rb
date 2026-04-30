class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  def index
    @pets = Pet.includes(:owner).all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      flash[:notice] = "Successfully created pet."
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pet.update(pet_params)
      flash[:notice] = "Pet successfully updated."
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    flash[:notice] = "Pet successfully removed."
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :weight, :date_of_birth, :owner_id)
  end
end