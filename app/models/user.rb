class User < ApplicationRecord
  # Direct associations

  has_many   :games,
             :class_name => "Match",
             :foreign_key => "opponent_id",
             :dependent => :destroy

  has_many   :matches,
             :foreign_key => "player_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end

end
