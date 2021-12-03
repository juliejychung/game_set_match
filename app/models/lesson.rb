class Lesson < ApplicationRecord
  # Direct associations

  belongs_to :coach,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    coach.to_s
  end

end
