# frozen_string_literal: true

class GameSession < ApplicationRecord
  # Associations
  has_and_belongs_to_many :players, class_name: 'User'
  has_many :score_cards, dependent: :destroy

  # Scopes
  scope :completed_games, -> { where } # TODO: finish scope

  # Properties
  def creator
    User.find(creator_user_id)
  end

  def expansions
    expansions = []
    expansions << :leaders        if leaders_expansion
    expansions << :cities         if cities_expansion
    expansions << :babel_tower    if babel_tower_expansion
    expansions << :babel_projects if babel_projects_expansion
    expansions << :armada         if armada_expansion
  end

  def completed?
    players.count == score_cards.count
  end
end
