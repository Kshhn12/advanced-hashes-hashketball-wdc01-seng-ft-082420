# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
require './hashketball.rb'
require 'pry'

def num_points_scored(player)
  iterator = 0
  while iterator < game_hash[:home][:players].length do
    game_hash[:home][:players].each do |player_info|
      if player_info[:player_name] == player 
        return player_info[:points]
      end
    end
    iterator += 1
  end
  iterator = 0
  while iterator < game_hash[:away][:players].length do
    game_hash[:away][:players].each do |player_info|
      if player_info[:player_name] == player 
        return player_info[:points]
      end
    end
    iterator += 1
  end
end

def shoe_size(player)
  iterator = 0
  while iterator < game_hash[:home][:players].length do
    game_hash[:home][:players].each do |player_info|
      if player_info[:player_name] == player 
        return player_info[:shoe]
      end
    end
    iterator += 1
  end
  iterator = 0
  while iterator < game_hash[:away][:players].length do
    game_hash[:away][:players].each do |player_info|
      if player_info[:player_name] == player 
        return player_info[:shoe]
      end
    end
    iterator += 1
  end
end

def team_colors(team)
  game_hash.each do |which_team|
    if which_team[1][:team_name] == team
      return which_team[1][:colors]
    end
  end
end

def team_names
  home_team = game_hash[:home][:team_name]
  away_team = game_hash[:away][:team_name]
  team_names = [home_team, away_team]
end

def player_numbers(team)
  player_nums = []
  game_hash.each do |which_team|
    if which_team[1][:team_name] == team
      iterator = 0
      while iterator < which_team[1][:players].length do
        player_nums.push(which_team[1][:players][iterator][:number])
        iterator += 1
      end
    end
  end
  return player_nums
end

def player_stats(player_name)
  game_hash[:home][:players].each do |player_info|
    if player_info[:player_name] == player_name
      return player_info
    end
  end
  game_hash[:away][:players].each do |player_info|
    if player_info[:player_name] == player_name
      return player_info
    end
  end
end

def big_shoe_rebounds
  iterator = 0
  shoe_size_array = []
  while iterator < game_hash[:home][:players].length
    shoe_size_array.push(shoe_size(game_hash[:home][:players][iterator][:player_name]))
    iterator +=1
  end
  iterator = 0
  while iterator < game_hash[:away][:players].length
    shoe_size_array.push(shoe_size(game_hash[:away][:players][iterator][:player_name]))
    iterator +=1
  end
  shoe_size_array = shoe_size_array.sort
  game_hash[:home][:players].each do |player_info|
    if player_info[:shoe] == shoe_size_array[shoe_size_array.length - 1]
      return player_info[:rebounds]
    end
  end
  game_hash[:away][:players].each do |player_info|
    if player_info[:shoe] == shoe_size_array[shoe_size_array.length - 1]
      return player_info[:rebounds]
    end
  end
end