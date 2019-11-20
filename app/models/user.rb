class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :games, class_name: "GameSession", foreign_key: "creator_user_id"
  has_and_belongs_to_many :game_sessions
  has_many :score_cards
end
