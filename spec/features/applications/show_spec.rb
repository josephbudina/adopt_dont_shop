require 'rails_helper'
RSpec.describe 'Application show page' do
  before :each do
    @application_1 = Application.create!(name: "Shady Application", street_address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011, applicant_description: "This is a test 1", pet_names: "Fluffy, Dan", status: "In Progress")
    @application_2 = Application.create!(name: "Silly Application", street_address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012, applicant_description: "This is a test 2", pet_names: "Ida, Scruffy", status: "Pending")
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
  end

    it "displays Applications with that id and all its attributes" do
      visit "/applications/#{@application_1.id}"

      expect(page).to have_content(@application_1.name)
      expect(page).to have_content(@application_1.street_address)
      expect(page).to have_content(@application_1.city)
      expect(page).to have_content(@application_1.state)
      expect(page).to have_content(@application_1.zip)
      expect(page).to have_content(@application_1.applicant_description)
      expect(page).to have_content(@application_1.pet_names)
      expect(page).to have_content(@application_1.status)
    end

    describe "if app hasn't been submitted" do
      it "sees section on page to Add Pet to this Application" do
        visit "/applications/#{@application_1.id}"
        save_and_open_page
        expect(page).to have_content("Add a Pet to this Application:")

        fill_in 'search', with: "Thor"
        click_on 'Find Pets by Name'

        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("Thor")
      end
    end

  end