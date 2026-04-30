class VetsController < ApplicationController
  before_action :set_vet, only: %i[ show edit update destroy ]

  def index
    @vets = Vet.all
  end

  def show
  end

  def new
    @vet = Vet.new
  end

  def edit
  end

  def create
    @vet = Vet.new(vet_params)

    if @vet.save
      flash[:notice] = "Successfully established veterinarian."
      redirect_to vet_path(@vet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @vet.update(vet_params)
      flash[:notice] = "Veterinarian successfully updated."
      redirect_to vet_path(@vet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vet.destroy
    flash[:notice] = "Veterinarian successfully removed."
    redirect_to vets_path
  end

  private

  def set_vet
    @vet = Vet.find(params[:id])
  end

  def vet_params
    params.require(:vet).permit(:first_name, :last_name, :specialization, :email, :phone)
  end
end
