require "pry"
def game_hash
  {
    :away => 
    {:team_name => "Charlotte Hornets",
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
    },
    :home => 
    {:team_name => "Brooklyn Nets",
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
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |road_home, team|
    #to iterate over hash you need a key/value pair and first two items in og hash are home/away and team
  team.each do |attribute, stats|
   #within those hashes you need to go another level deeper
   if attribute == :players
     # ensures that the attribute we are accessing is the players.
     stats.each do |player|
       #given a specific player we want to get the stats for that player
       if player[:player_name] == player_name
         return player[:points]
     end
   end
end   
end
end
end


def shoe_size(player_name)
  game_hash.each do |road_home, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
end
end
end
end
end
end

def team_colors(team_name)
  game_hash.each do |road_home, team|
      if team[:team_name] == team_name
            return team[:colors]
    end
  end
end

def team_names
  game_hash.map do |road_home, team|
    #.map gives us a new array
   team[:team_name]
   #selects the right value (:team_name) for road_home
end
end

def player_numbers(team_name)
  numbs = []
  game_hash.each do |road_home, team|
    if team[:team_name] == team_name
      #checking if a team name equals what we passed in
    team.each do |attribute, stats|
      #then we want to iterate over each team's stats
      if attribute == :players
        stats.each do |player|
          #looking at stats for each player
          numbs << player[:number]
          #adds a plyers number to the array
      end
    end
  end
end
end
  numbs
end

def player_stats(player_name)
  stats_hash = {}
  game_hash.each do |road_home, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player|
          if player[:player_name] == player_name
            stats_hash = player.delete_if do |key, value|
              key == :player_name
            #delete_if will remove a key for us. since we dont need to include player_name in the
                end
    end
  end
  end
end
end
  stats_hash
end




def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |home_road, team|
    team[:players].each do |player|
      size = player[:shoe]
      if size > biggest_shoe
        biggest_shoe = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end



