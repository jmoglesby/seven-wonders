class GameSession < ApplicationRecord
  # Associations
  has_and_belongs_to_many :players, class_name: "User"
  has_many :score_cards, dependent: :destroy

  # Scopes
  scope :completed_games, -> { where() } # TODO: finish scope

  # Properties
  def creator
    User.find(self.creator_user_id)
  end

  def expansions
    expansions = []
    expansions << :leaders        if self.leaders_expansion
    expansions << :cities         if self.cities_expansion
    expansions << :babel_tower    if self.babel_tower_expansion
    expansions << :babel_projects if self.babel_projects_expansion
    expansions << :armada         if self.armada_expansion
  end

  def completed?
    players.count == score_cards.count
  end
end
