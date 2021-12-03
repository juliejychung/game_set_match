class Match < ApplicationRecord
  # Direct associations

  belongs_to :player,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    player.to_s
  end

end
