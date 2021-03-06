FactoryGirl.define do
  sequence(:id) { |n| n }
  sequence(:slug) { |n| "slug_#{n}" }

  factory :country do
    id
    factory :test_country do
      league
    end
  end

  factory :league do
    id
    slug { generate :slug }
    factory :test_league do
      country
      after(:build) do |league|
        build_list(:match, 10, league: league)
        build_list(:team, 3, league: league)
      end
    end
  end

  factory :match, aliases: %i(home_match away_match) do
    id
    factory :test_match do
      country
      league
      season
      home_team
      away_team
      after(:build) do |match|
        build_list(:home_player, 11, home_matches: [match])
        build_list(:away_player, 11, away_matches: [match])
      end
    end
  end

  factory :player, aliases: %i(home_player away_player) do
    id
    factory :test_player do
      player_stat
      after(:build) do |player|
        build_list(:home_match, 3, home_players: [player])
        build_list(:away_match, 3, away_players: [player])
      end
    end
  end

  factory :player_stat do
    id
    factory :test_player_stat do
      player
    end
  end

  factory :season do
    id
    factory :test_season do
      after(:build) do |season|
        build_list(:match, 10, season: season)
      end
    end
  end

  factory :team, aliases: %i(home_team away_team) do
    id
    short_name { generate :slug }
    factory :test_team do
      league
      after(:build) do |team|
        build_list(:home_match, 3, home_team: team)
        build_list(:away_match, 3, away_team: team)
      end
    end
  end
end
