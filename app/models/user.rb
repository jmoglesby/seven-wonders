class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :game_sessions, foreign_key: "creator_user_id"
  has_and_belongs_to_many :games, class_name: "GameSession"
  has_many :score_cards
end
