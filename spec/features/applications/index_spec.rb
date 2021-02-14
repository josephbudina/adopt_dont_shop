# require 'rails_helper'

# RSpec.describe "the Application index page" do
#     before each:
#       @application_1 = Application.create!(name: "Jeff", street_address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011, applicant_description: "This is a test 1", pet_names: "Fluffy, Dan", status: "In Progress")
#       @application_2 = Application.create!(name: "Sally", street_address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012, applicant_description: "This is a test 2", pet_names: "Ida, Scruffy", status: "Pending")
#       @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
#       @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
#       @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
#       @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
#       @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
#       @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
#       @jeff = @pet1.applications.create!(name: "Jeff", street_address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011, applicant_description: "This is a test 1", pet_names: "Fluffy, Dan", status: "In Progress")
#       # @athena = @application_1.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
#       # @pet_app = PetApplication.create!(pet: @athena, application: @jeff)
# end