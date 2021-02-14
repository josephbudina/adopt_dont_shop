class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :applicant_description
      t.string :pet_names
      t.string :status, :default => "In Progress"
    end
  end
end
