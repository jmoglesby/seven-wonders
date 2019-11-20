class ScoreCard < ApplicationRecord
  belongs_to :user
  belongs_to :game_session

  # Properties
  def military_point_total
    plus_one_military_victory_tokens +
    (plus_three_military_victory_tokens * 3) +
    (plus_five_military_victory_tokens * 5) +
    (plus_seven_military_victory_tokens * 7) -
    minus_one_military_victory_tokens -
    (minus_two_military_victory_tokens * 2) -
    (minus_three_military_victory_tokens * 3)
  end

  def coin_point_total
    coin_total - debt_total
  end

  def science_point_total
    case wildcard_symbols
      when 0 then zero_wildcards
      when 1 then one_wildcard
      when 2 then two_wildcards
      when 3 then three_wildcards
    end
  end

  private # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def zero_wildcards
    tablet_symbols ** 2 +
    cog_symbols ** 2 +
    compass_symbols ** 2 +
    [tablet_symbols, cog_symbols, compass_symbols].min * 7
  end

  def one_wildcard
  end

  def two_wildcards
  end

  def three_wildcards
  end
end
