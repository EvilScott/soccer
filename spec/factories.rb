FactoryGirl.define do
  factory :country do
    factory :test_country do
      league
    end
  end

  factory :league do
    factory :test_league do
      country
      after(:create) do |league|
        create_list(:match, 10, league: league)
      end
    end
  end

  factory :match, aliases: %i(home_match away_match) do
    factory :test_match do
      country
      league
      season
      home_team
      away_team
      after(:create) do |match|
        create_list(:home_player, 11, match: match)
        create_list(:away_player, 11, match: match)
      end
    end
  end

  factory :player, aliases: %i(home_player away_player) do
    factory :test_player do
      player_stat
      after(:create) do |player|
        create_list(:home_match, 3, player: player)
        create_list(:away_match, 3, player: player)
      end
    end
  end

  factory :player_stat do
    factory :test_player_stat do
      player
    end
  end

  factory :season do
    factory :test_season do
      after(:create) do |season|
        create_list(:match, 10, season: season)
      end
    end
  end

  factory :team, aliases: %i(home_team away_team) do
    factory :test_team do
      league
      after(:create) do |team|
        create_list(:home_match, 3, home_team: team)
        create_list(:away_match, 3, away_team: team)
      end
    end
  end
end
