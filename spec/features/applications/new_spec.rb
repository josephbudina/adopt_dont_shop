require 'rails_helper'

RSpec.describe 'Application new page' do
  before :each do
    @application = Application.create!(name: "Jeff", street_address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011, applicant_description: "This is a test 1", pet_names: "Fluffy, Dan", status: "In Progress")
    @application_2 = Application.create!(name: "Sally", street_address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012, applicant_description: "This is a test 2", pet_names: "Ida, Scruffy", status: "Pending")
  end

  it "sees and fills out form" do
    visit '/applications/new'

    fill_in "name", with: @application.name
    fill_in "street_address", with: @application.street_address
    fill_in "city", with: @application.city
    fill_in "state", with: @application.state
    fill_in "zip", with: @application.zip

    click_on "Submit"
    expect(current_path).to eq("/applications/#{Application.last.id}")
    expect(page).to have_content(@application.name)
    expect(page).to have_content(@application.street_address)
    expect(page).to have_content(@application.city)
    expect(page).to have_content(@application.state)
    expect(page).to have_content(@application.zip)
    expect(page).to have_content("In Progress")
  end

  it "fails to fill out form and returns to page with error message" do
    visit '/applications'

    click_on "Submit"
    expect(current_path).to eq('/applications')
    expect(page).to have_content("There Were Some Errors")
  end
end