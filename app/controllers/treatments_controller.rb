class TreatmentsController < ApplicationController
  before_action :set_appointment

  before_action :set_treatment, only: %i[ edit update destroy ]

  def new
    @treatment = @appointment.treatments.build
  end

  def edit
  end

  def create
    @treatment = @appointment.treatments.build(treatment_params)

    if @treatment.save
      flash[:notice] = "Successfully created treatment."
      redirect_to appointment_path(@appointment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @treatment.update(treatment_params)
      flash[:notice] = "Successfully updated treatment."
      redirect_to appointment_path(@appointment)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @treatment.destroy
    flash[:notice] = "Treatment successfully removed."
    redirect_to appointment_path(@appointment)
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def set_treatment
    @treatment = @appointment.treatments.find(params[:id])
  end

  def treatment_params
    params.require(:treatment).permit(:name, :medication, :dosage, :administered_at, :clinical_notes) 
  end
end