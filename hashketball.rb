# Write your code here!
require 'pry'

def game_hash
  game = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black','White'],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise','Purple'],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  num_points = 0
  game_hash.each do |game, team|
    team.each do |category, info|
      if category == :players
        info.each do |players_name, stats|
          if players_name.to_s == name
            stats.each do |stat, value|
              if stat.to_s === "points"
                num_points = value
              end
            end
          end
        end
      end
    end
  end
  num_points
end

def shoe_size(name)
  shoe_size = 0
  game_hash.each do |game, team|
    team.each do |category, info|
      if category == :players
        info.each do |players_name, stats|
          if players_name.to_s == name
            stats.each do |stat, value|
              if stat.to_s === "shoe"
                shoe_size = value
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors (team)
  tc = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors].collect do |color|
      tc.push(color)
    end
  else
    game_hash[:away][:colors].collect do |color|
      tc.push(color)
    end
  end
  tc
end

def team_names
  teams = []
  game_hash.each do |game, ha|
    ha.each do |cat, data|
      if cat.to_s == 'team_name'
        teams.push(data)
      end
    end
  end
  teams
end

def player_numbers (team)
  numbs = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |stats, value|
      value.each do |player_stats, val|
        if player_stats.to_s == 'number'
          numbs.push(val)
        end
      end
    end
  else
    game_hash[:away][:players].each do |stats, value|
      value.each do |player_stats, val|
        if player_stats.to_s == 'number'
          numbs.push(val)
        end
      end
    end
  end
  numbs
end

def player_stats (name)
  player_stats = []
  game_hash.each do |game, team|
    team.each do |category, info|
      if category == :players
        info.each do |players_name, stats|
          if players_name.to_s == name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_shoe_size_rebounds = 0
  biggest_shoe = false
  game_hash.each do |team, ha|
    ha.each do |cat, value|
      if cat.to_s == "players"
        value.each do |players, cats|
          cats.each do |shoe, value|
            if shoe.to_s == "shoe"
              if value > biggest_shoe_size
                biggest_shoe_size = value
                biggest_shoe = true
              end
            end
            if shoe.to_s == "rebounds"
              if biggest_shoe
                biggest_shoe_size_rebounds = value
              end
              biggest_shoe = false
            end
          end
        end
       end
    end
  end
  biggest_shoe_size_rebounds
end
