class GameSession < ApplicationRecord
  has_and_belongs_to_many :players, class_name: "User"
end
