class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :body, :string
  attribute :commenter_id, :integer
  attribute :match_id, :integer

  # Direct associations

  belongs_to :match

  belongs_to :commenter,
             resource: UserResource

  # Indirect associations
end
