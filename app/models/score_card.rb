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
    (coin_total / 3) - debt_total
  end

  def science_point_total
    case wildcard_symbols
      when 0 then zero_wildcards
      when 1 then one_wildcard
      when 2 then two_wildcards
      when 3 then three_wildcards
    end
  end

  def babel_point_total
    (babel_tiles_played > 0 ? (babel_tiles_played ** 2 + 1) : 0) +
    great_project_token_points -
    great_project_penalty_total
  end

  def total_score
    military_point_total +
    coin_point_total +
    science_point_total +
    wonder_points +
    blue_card_points +
    yellow_card_points +
    purple_card_points +
    black_card_points +
    leader_points +
    fleet_points +
    babel_point_total
  end

  private # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def zero_wildcards
    tablet_symbols ** 2 +
    cog_symbols ** 2 +
    compass_symbols ** 2 +
    [tablet_symbols, cog_symbols, compass_symbols].min * 7
  end

  def one_wildcard
    s1 = (
      (tablet_symbols ** 2 + 1) +
      cog_symbols ** 2 +
      compass_symbols ** 2 +
      [tablet_symbols + 1, cog_symbols, compass_symbols].min * 7
    )
    s2 = (
      tablet_symbols ** 2 +
      (cog_symbols ** 2 + 1) +
      compass_symbols ** 2 +
      [tablet_symbols, cog_symbols + 1, compass_symbols].min * 7
    )
    s3 = (
      tablet_symbols ** 2 +
      cog_symbols ** 2 +
      (compass_symbols ** 2 + 1) +
      [tablet_symbols, cog_symbols, compass_symbols + 1].min * 7
    )
    [s1, s2, s3].max
  end

  def two_wildcards
    s1 = (
      (tablet_symbols ** 2 + 2) +
      cog_symbols ** 2 +
      compass_symbols ** 2 +
      [tablet_symbols + 2, cog_symbols, compass_symbols].min * 7
    )
    s2 = (
      (tablet_symbols ** 2 + 1) +
      (cog_symbols ** 2 + 1) +
      compass_symbols ** 2 +
      [tablet_symbols + 1, cog_symbols + 1, compass_symbols].min * 7
    )
    s3 = (
      (tablet_symbols ** 2 + 1) +
      cog_symbols ** 2 +
      (compass_symbols ** 2 + 1) +
      [tablet_symbols + 1, cog_symbols, compass_symbols + 1].min * 7
    )
    s4 = (
      tablet_symbols ** 2 +
      (cog_symbols ** 2 + 2) +
      compass_symbols ** 2 +
      [tablet_symbols, cog_symbols + 2, compass_symbols].min * 7
    )
    s5 = (
      tablet_symbols ** 2 +
      (cog_symbols ** 2 + 1) +
      (compass_symbols ** 2 + 1) +
      [tablet_symbols, cog_symbols + 1, compass_symbols + 1].min * 7
    )
    s6 = (
      tablet_symbols ** 2 +
      cog_symbols ** 2 +
      (compass_symbols ** 2 + 2) +
      [tablet_symbols, cog_symbols, compass_symbols + 2].min * 7
    )
    [s1, s2, s3, s4, s5, s6].max
  end

  def three_wildcards
    s1 = (
      (tablet_symbols ** 2 + 3) +
      (cog_symbols ** 2) +
      (compass_symbols ** 2) +
      [tablet_symbols + 3, cog_symbols, compass_symbols].min * 7
    )
    s2 = (
      (tablet_symbols ** 2 + 2) +
      (cog_symbols ** 2 + 1) +
      (compass_symbols ** 2) +
      [tablet_symbols + 2, cog_symbols + 1, compass_symbols].min * 7
    )
    s3 = (
      (tablet_symbols ** 2 + 2) +
      (cog_symbols ** 2) +
      (compass_symbols ** 2 + 1) +
      [tablet_symbols + 2, cog_symbols, compass_symbols + 1].min * 7
    )
    s4 = (
      (tablet_symbols ** 2 + 1) +
      (cog_symbols ** 2 + 2) +
      (compass_symbols ** 2) +
      [tablet_symbols + 1, cog_symbols + 2, compass_symbols].min * 7
    )
    s5 = (
      (tablet_symbols ** 2 + 1) +
      (cog_symbols ** 2) +
      (compass_symbols ** 2 + 2) +
      [tablet_symbols + 1, cog_symbols, compass_symbols + 2].min * 7
    )
    s6 = (
      (tablet_symbols ** 2 + 1) +
      (cog_symbols ** 2 + 1) +
      (compass_symbols ** 2 + 1) +
      [tablet_symbols + 1, cog_symbols + 1, compass_symbols + 1].min * 7
    )
    s7 = (
      (tablet_symbols ** 2) +
      (cog_symbols ** 2 + 3) +
      (compass_symbols ** 2) +
      [tablet_symbols, cog_symbols + 3, compass_symbols].min * 7
    )
    s8 = (
      (tablet_symbols ** 2) +
      (cog_symbols ** 2 + 2) +
      (compass_symbols ** 2 + 1) +
      [tablet_symbols, cog_symbols + 2, compass_symbols + 1].min * 7
    )
    s9 = (
      (tablet_symbols ** 2) +
      (cog_symbols ** 2 + 1) +
      (compass_symbols ** 2 + 2) +
      [tablet_symbols, cog_symbols + 1, compass_symbols + 2].min * 7
    )
    s10 = (
      (tablet_symbols ** 2) +
      (cog_symbols ** 2) +
      (compass_symbols ** 2 + 3) +
      [tablet_symbols, cog_symbols, compass_symbols + 3].min * 7
    )
    [s1, s2, s3, s4, s5, s6, s7, s8, s9, s10].max
  end
end
