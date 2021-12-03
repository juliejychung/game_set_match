class User < ApplicationRecord
  # Direct associations

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
