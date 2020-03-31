def game_hash
  return game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10,
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12,
        }
      ]
    }
  }
end




def player_stats(player_name)
  pl = get_player(player_name)
  return {
    :number => pl[:number],
    :shoe => pl[:shoe],
    :points => pl[:points],
    :rebounds => pl[:rebounds],
    :assists => pl[:assists],
    :steals => pl[:steals],
    :blocks => pl[:blocks],
    :slam_dunks => pl[:slam_dunks]
  }
end

def get_player(player_name)
  gh = game_hash

  # check home team
  home_players = gh[:home][:players]
  home_player = home_players.find { |x| x[:player_name] == player_name }
  # if home_player is not null, we have found the player
  if home_player
    return home_player
  end

  # was not a home team player, find in the away team
  away_players = gh[:away][:players]
  away_player = away_players.find { | x | x[:player_name] == player_name }
  if away_player
    return away_player
  end
end

def num_points_scored(player_name)
  return get_player(player_name)[:points]
end

# ------------------------------------------
# INSTRUCTIONS - shoe_size(player_name)
# ------------------------------------------
# * Build a method, `shoe_size`, that takes in an argument of a player's name and
#   returns the shoe size for that player.
#   * Think about how you will find the shoe size of the correct player. How can
#     you check and see if a player's name matches the name that has been passed
#     into the method as an argument?
def shoe_size(player_name)
  return get_player(player_name)[:shoe]
end


# ------------------------------------------
# INSTRUCTIONS - team_colors(team_name)
# ------------------------------------------
# * Build a method, `team_colors`, that takes in an argument of the team name and
#   returns an `Array` of that team's colors.
def team_colors(team_name)
  gh = game_hash
  if gh[:home][:team_name] == team_name
    return gh[:home][:colors]
  else
    return gh[:away][:colors]
  end
end

# ------------------------------------------
# INSTRUCTIONS - team_names() 
# ------------------------------------------
# * Build a method, `team_names`, that operates on the game `Hash` to return an
#   `Array` of the team names.
def team_names()
  gh = game_hash
  output = []
  output << gh[:home][:team_name]
  output << gh[:away][:team_name]
  return output
end


# ------------------------------------------
# INSTRUCTIONS - team_numbers(team_name)
# ------------------------------------------
# * Build a method, `player_numbers`, that takes in an argument of a team name and
# returns an `Array` of the jersey numbers for that team.
def player_numbers(team_name)
  gh = game_hash
  if gh[:home][:team_name] == team_name
    return gh[:home][:players].map  { |k, v| k[:number] }
  else
    # build an array of the team numbers, based on the provided team 
    # leveraging the key,value pair for the player stat 
    return gh[:away][:players].map  { |k, v| k[:number] }
  end
end


def find_player_with_largest(stat)
  gh = game_hash

  # find the player with the largest shoe size
  home_players = gh[:home][:players]
  away_players = gh[:away][:players]

  player = home_players[0]
  i = 0
  while i < home_players.count do
    if player[stat] < home_players[i][stat]
      player = home_players[i]
    end
    i += 1
  end
  i = 0
  while i < away_players.count do
    if player[stat] < away_players[i][stat]
      player = away_players[i]
    end
    i += 1
  end

  return player
end

def big_shoe_rebounds
  player = find_player_with_largest(:shoe)
  return player[:rebounds]
end



# def team_names(team_name)
#   gh = game_hash
#   if gh[:home][:team_name] == team_name
#     return gh[:home][:players].map  { |k, v| k[:player_name] }
#   else
#     return gh[:away][:players].map  { |k, v| k[:player_name] }
#   end
# end
 
