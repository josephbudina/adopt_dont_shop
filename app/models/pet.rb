class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  def self.search(input)
    if input == ""
      @pets = nil
    elsif input
      @pets = Pet.where("lower(name) LIKE ?", "%#{input.downcase}%")
    end
  end
end
