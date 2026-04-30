class OwnersController < ApplicationController
  before_action :set_owner, only: %i[ show edit update destroy ]

  def index
    @owners = Owner.includes(:pets).all
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def edit
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      flash[:notice] = "Owner successfully created."
      redirect_to owner_path(@owner)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @owner.update(owner_params)
      flash[:notice] = "Owner updated successfully."
      redirect_to owner_path(@owner)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @owner.destroy
    flash[:notice] = "Owner successfully removed."
    redirect_to owners_path
  end

  private

  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end
end