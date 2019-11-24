# frozen_string_literal: true

class AddFieldsToGameSession < ActiveRecord::Migration[6.0]
  def change
    add_column :game_sessions, :teams, :boolean
    add_column :game_sessions, :leaders_expansion, :boolean
    add_column :game_sessions, :cities_expansion, :boolean
    add_column :game_sessions, :babel_tower_expansion, :boolean
    add_column :game_sessions, :babel_projects_expansion, :boolean
    add_column :game_sessions, :armada_expansion, :boolean
  end
end
