require 'rails_helper'

RSpec.describe 'Application new page' do
  before :each do
    @application_1 = Application.create!(name: "Jeff", street_address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011, applicant_description: "This is a test 1", pet_names: "Fluffy, Dan", status: "In Progress")
    @application_2 = Application.create!(name: "Sally", street_address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012, applicant_description: "This is a test 2", pet_names: "Ida, Scruffy", status: "Pending")
  end

  it "sees and fills out form" do
    visit '/applications/new'

    fill_in "name", with: @application_1.name
    fill_in "street_address", with: @application_1.street_address
    fill_in "city", with: @application_1.city
    fill_in "state", with: @application_1.state
    fill_in "zip", with: @application_1.zip

    click_on "Submit"
    expect(current_path).to eq("/applications/#{Application.last.id}")
    expect(page).to have_content(@application_1.name)
    expect(page).to have_content(@application_1.street_address)
    expect(page).to have_content(@application_1.city)
    expect(page).to have_content(@application_1.state)
    expect(page).to have_content(@application_1.zip)
    expect(page).to have_content("In Progress")
  end

  it "fails to fill out form and returns to page with error message" do
    visit '/applications/new'

    click_on "Submit"
    expect(current_path).to eq(visit '/applications/new')
    expect(page).to have_content("You Must Fill In Blank Fields")
  end
end