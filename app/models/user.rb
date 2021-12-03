class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader

  # Direct associations

  has_many   :sessions,
             class_name: "Lesson",
             foreign_key: "player_id",
             dependent: :destroy

  has_many   :lessons,
             foreign_key: "coach_id",
             dependent: :destroy

  has_many   :comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  has_many   :games,
             class_name: "Match",
             foreign_key: "opponent_id",
             dependent: :destroy

  has_many   :matches,
             foreign_key: "player_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end
end
