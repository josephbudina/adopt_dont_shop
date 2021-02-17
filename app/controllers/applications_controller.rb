class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pets = Pet.search(params[:search])
  end

  def new
    @application = Application.new(application_params)
  end

  def create
    @application = Application.new(application_params)
    if @application.valid?
      @application = Application.create!(application_params)
      redirect_to "/applications/#{@application.id}"
    else
      render :new
    end
  end

  def update
    @application = Application.find(params[:id])
    if params[:applicant_description] == ""
      flash[:notice] = "Please fill out description."
      render :show
    elsif params[:commit] == "Submit Application"
      application.update(application_params)
      application.update(status: "Pending")
      redirect_to "/applications/#{application.id}"
    end
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip, :applicant_description, :pet_names, :status)
  end
end