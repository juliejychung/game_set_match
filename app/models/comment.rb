class Comment < ApplicationRecord
  # Direct associations

  belongs_to :match

  belongs_to :commenter,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    body
  end
end
