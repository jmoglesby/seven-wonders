class GameSession < ApplicationRecord
  # Associations
  has_and_belongs_to_many :players, class_name: "User"
  has_many :score_cards, dependent: :destroy

  # Scopes
  scope :complete, -> { where() } # TODO: finish scope

  # Properties
  def created_by
  end
end
