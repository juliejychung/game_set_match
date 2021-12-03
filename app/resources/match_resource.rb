class MatchResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :player_id, :integer
  attribute :opponent_id, :integer
  attribute :date, :date
  attribute :time, :string
  attribute :court_id, :integer

  # Direct associations

  # Indirect associations

end
