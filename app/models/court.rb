class Court < ApplicationRecord
  # Direct associations

  has_many   :lessons,
             dependent: :destroy

  has_many   :matches,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    state
  end
end
