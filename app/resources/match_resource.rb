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

  belongs_to :opponent,
             resource: UserResource

  belongs_to :player,
             resource: UserResource

  # Indirect associations

end
