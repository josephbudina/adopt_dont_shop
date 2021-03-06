require 'rails_helper'

describe 'admin application show page' do
  before :each do
    @application_1 = Application.create!(name: "Shady Application", street_address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011, applicant_description: "This is a test 1", pet_names: "Fluffy, Dan", status: "In Progress")
    @application_2 = Application.create!(name: "Silly Application", street_address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012, applicant_description: "This is a test 2", pet_names: "Ida, Scruffy", status: "Pending")
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @pet_applications = PetApplication.create!(application: @application_1, pet: @pet1)
    @pet_applications = PetApplication.create!(application: @application_1, pet: @pet2)
  end

  it 'has approve button next to every pet on application' do
    visit "/admin/applications/#{@application_1.id}"
    expect(page).to have_content("Thor")
    expect(page).to have_content("Athena")
    
    within("#pet_id-#{@pet1.id}") do
      expect(page).to have_button("Approve")
      click_on value='Approve'
    end
    # expect(current_path).to eq("/admin/applications/#{@application_1.id}")
    # expect(page).to_not have_content("Approve")
    # expect(page).to_not have_content("Approved")
  end
end