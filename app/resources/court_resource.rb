class CourtResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :state, :string
  attribute :city, :string
  attribute :neighborhood, :string
  attribute :name, :string

  # Direct associations

  has_many   :lessons

  has_many   :matches

  # Indirect associations

end
