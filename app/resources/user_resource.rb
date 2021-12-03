class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :state, :string
  attribute :city, :string
  attribute :neighborhood, :string
  attribute :email, :string
  attribute :password, :string
  attribute :level, :string
  attribute :gender, :string
  attribute :age, :integer
  attribute :profile_picture, :string
  attribute :coach, :boolean
  attribute :cost_per_hour, :integer

  # Direct associations

  has_many   :lessons,
             foreign_key: :coach_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :games,
             resource: MatchResource,
             foreign_key: :opponent_id

  has_many   :matches,
             foreign_key: :player_id

  # Indirect associations

end
