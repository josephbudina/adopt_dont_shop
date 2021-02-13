require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    @application_1 = Application.create!(name: "Shady Application", street_address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011, applicant_discription: "This is a test 1", pet_names: "Fluffy, Dan", status: "In Progress")
    @application_2 = Application.create!(name: "Silly Application", street_address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012, applicant_discription: "This is a test 2", pet_names: "Ida, Scruffy", status: "Pending")
  end

    it "displays Applications with that id and all its attributes" do
      visit "/applications/#{@application_1.id}"
  
      expect(page).to have_content(@application_1.name)
      expect(page).to have_content(@application_1.street_address)
      expect(page).to have_content(@application_1.city)
      expect(page).to have_content(@application_1.state)
      expect(page).to have_content(@application_1.zip)
      expect(page).to have_content(@application_1.applicant_discription)
      expect(page).to have_content(@application_1.pet_names)
      expect(page).to have_content(@application_1.status)
    end
  end