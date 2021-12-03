class Match < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :opponent,
             :class_name => "User"

  belongs_to :player,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    player.to_s
  end

end
