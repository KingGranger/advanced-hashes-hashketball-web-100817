require 'pry'

def game_hash
  the_game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end



def num_points_scored players_name
  points = 0
  game_hash.each{|location, team_info| team_info[:players].each{|player, stat| points += stat[:points] if player == players_name}}
  points
end

def shoe_size players_name
  size = 0
  game_hash.each{|location, team_info| team_info[:players].each{|player, stat| size += stat[:shoe] if player == players_name}}
  size
end

def team_colors team_name
  color = []
  game_hash.each{|location, team_info| color.push(team_info[:colors]) if team_info[:team_name] == team_name}
  color.flatten
#returns array
end

def team_names
  names = []
  game_hash.each{|location, team_info| names << team_info[:team_name]}
  names
#directly uses the hash to return an array of the team names
end

def player_numbers team_name
  jersey_nums = []
  game_hash.each{|location, team_info| team_info[:players].each{|player, stat| jersey_nums << stat[:number] if team_info[:team_name] == team_name}}
  jersey_nums
#returns an array of the jersey numbers from all the players on that team
end

def player_stats player_name
  stats = []
  game_hash.each{|location, team_info| team_info[:players].each{|player, stat| stats.push(stat) if player == player_name}}
  stats[0]
#returns object with all of the players stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebound = 0
  game_hash.each do |location, team_info|
    team_info[:players].each do |player, stat|
      if shoe_size < stat[:shoe]
        shoe_size = stat[:shoe]
        rebound = stat[:rebounds]
      end
    end
  end
  rebound
#returning the number of rebounds with the person with the largest shoe size
end

def most_points_scored
  mvp = ""
  points = 0
  game_hash.each do |location, team_info|
    team_info[:players].each do|player, stat|
      if points < stat[:points]
        mvp = player
        points = stat[:points]
      end
    end
  end
  mvp
end

def winning_team
  home = 0
  away = 0
  game_hash[:home][:players].each{|player, stats| home += stats[:points]}
  game_hash[:away][:players].each{|player, stats| away += stats[:points]}
  home > away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  name = ""
  game_hash.each{|location, team_info| team_info[:players].each{|player, stats| name = player if player.length > name.length}}
  name
end

def long_name_steals_a_ton?
  most_steals = 0
  longest_name_steals = 0
  game_hash.each{|location, team_info| team_info[:players].each{|player, stats| most_steals = stats[:steals] if most_steals < stats[:steals]}}
  game_hash.each do|location, team_info|
    team_info[:players].each{|player, stats| longest_name_steals = stats[:steals] if player_with_longest_name == player}
  end
  most_steals == longest_name_steals ? true : false 
#returns true if the person with the longest name has the most steals
end
