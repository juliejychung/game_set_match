class LessonResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :coach_id, :integer
  attribute :player_id, :integer
  attribute :date, :date
  attribute :time, :string
  attribute :court_id, :integer

  # Direct associations

  belongs_to :court

  belongs_to :player,
             resource: UserResource

  belongs_to :coach,
             resource: UserResource

  # Indirect associations

end
