class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    # binding.pry
    @application = Application.new(application_params)
    # binding.pry
    if @application.valid?
      @application = Application.create!(application_params)
      redirect_to "/applications/#{@application.id}"
    else
      render :new
    end
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip, :applicant_description, :pet_names, :status)
  end
end