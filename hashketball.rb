require 'pry'

def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson",
       :number => 0,
       :shoe => 16,
       :points => 22,
       :rebounds => 12,
       :assists => 12,
       :steals => 3,
       :blocks => 1,
       :slam_dunks => 1
      },
      {:player_name => "Reggie Evans",
       :number => 30,
       :shoe => 14,
       :points => 12,
       :rebounds => 12,
       :assists => 12,
       :steals => 12,
       :blocks => 12,
       :slam_dunks => 7
      },
      {:player_name => "Brook Lopez",
       :number => 11,
       :shoe => 17,
       :points => 17,
       :rebounds => 19,
       :assists => 10,
       :steals => 3,
       :blocks => 1,
       :slam_dunks => 15
      },
      {:player_name => "Mason Plumlee",
       :number => 1,
       :shoe => 19,
       :points => 26,
       :rebounds => 11,
       :assists => 6,
       :steals => 3,
       :blocks => 8,
       :slam_dunks => 5
      },
      {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
       }
      ]
    },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
        {:player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
        },
         {:player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
         },
        {:player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
       },
       {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        {:player_name => "Kemba Walker",
         :number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |home_away, team_hash| #home_away = :home or :away; team_hash = team hash
      team_hash[:players].each do |single_player| #single_player is the player stat hash
        if player_name == single_player[:player_name]
        return single_player[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |home_away, team_hash| #home_away = :home or :away; team_hash = team hash
      team_hash[:players].each do |single_player| #single_player is the player stat HASH
        if player_name == single_player[:player_name] #If the name we pass in matches the player
                                                        #name in the current hash
        return single_player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, team_hash| #home_away = :home or :away; team_hash = team hash
    if team_hash[:team_name] == team_name
      return team_hash[:colors] #team_hash[:colors] is an ARRAY of the colors
    end
  end
end

def team_names
  game_hash.map do |home_away, team_hash| #home_away = :home or :away; team_hash = team hash
    team_hash[:team_name] #the name of the team
  end
end

def player_numbers(team_names)
  game_hash.each do |home_away, team_hash| #home_away = :home or :away; team_hash = team hash
    if team_hash[:team_name] == team_names
      return team_hash[:players].map do |single_player| #team_hash[:players] = :players ARRAY;
                                                        #single_player = individual player HASH
        single_player[:number]
      end
    end
  end
end

def player_stats(player_n)
game_hash.each do |home_away, keys| #home_away = :home or :away; keys = :team_name, :colors, or :players
    keys[:players].each do |single_player| #keys[:players] is an ARRAY; single_player is a one-player HASH
      if single_player[:player_name] == player_n #If the name we pass in matches the player
                                                 #name in the current hash
        return single_player.delete_if do |key_stat, value| #key_stat = :player_name; value = the player's name
          [:player_name].include?(key_stat)
        end
      end
    end
  end
end

#delete_if for hashes:
# h = { "a" => 100, "b" => 200, "c" => 300 }
# h.delete_if {|key, value| key >= "b" }   #=> {"a"=>100}

# Result:
# player_stats("Alan Anderson")
#   => { :number => 0,
#         :shoe => 16,
#         :points => 22,
#         :rebounds => 12,
#         :assists => 12,
#         :steals => 3,
#         :blocks => 1,
#         :slam_dunks => 1
#       }

def big_shoe_rebounds
  #First, find the player with the largest shoe size
  biggest_shoe = 0
  rebound_number = 0
  game_hash.each do |home_away, team_hash|
    team_hash[:players].each do |player_hash| #.each iterates over the :players array to get each individual player
      if player_hash[:shoe] > biggest_shoe
        biggest_shoe = player_hash[:shoe]
        #Then, return that player's number of rebounds
        rebound_number = player_hash[:rebounds]
      end
    end
  end
  #Remember to think about return values here.
  return rebound_number
end
