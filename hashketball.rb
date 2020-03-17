require 'pp'

def game_hash()
  gameHash = {:home => 
                {:team_name => 'Brooklyn Nets', 
                 :colors => ['Black', 'White'], 
                 :players =>[{:player_name => 'Alan Anderson',
                              :number => 0,
                              :shoe => 16,
                              :points => 22,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 3,
                              :blocks => 1,
                              :slam_dunks => 1},
                              
                              {:player_name => 'Reggie Evans',
                              :number => 30,
                              :shoe => 14,
                              :points => 12,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 12,
                              :blocks => 12,
                              :slam_dunks => 7},
                              
                              {:player_name => 'Brook Lopez',
                              :number => 11,
                              :shoe => 17,
                              :points => 17,
                              :rebounds => 19,
                              :assists => 10,
                              :steals => 3,
                              :blocks => 1,
                              :slam_dunks => 15},
                              
                              {:player_name => 'Mason Plumlee',
                              :number => 1,
                              :shoe => 19,
                              :points => 26,
                              :rebounds => 11,
                              :assists => 6,
                              :steals => 3,
                              :blocks => 8,
                              :slam_dunks => 5},
                              
                              {:player_name => 'Jason Terry',
                              :number => 31,
                              :shoe => 15,
                              :points => 19,
                              :rebounds => 2,
                              :assists => 2,
                              :steals => 4,
                              :blocks => 11,
                              :slam_dunks => 1}]}, 
                  :away => 
                    {:team_name => 'Charlotte Hornets', 
                     :colors => ['Turquoise', 'Purple'], 
                     :players =>[{:player_name => 'Jeff Adrien',
                                  :number => 4,
                                  :shoe => 18,
                                  :points => 10,
                                  :rebounds => 1,
                                  :assists => 1,
                                  :steals => 2,
                                  :blocks => 7,
                                  :slam_dunks => 2},
                                  
                                  {:player_name => 'Bismack Biyombo',
                                  :number => 0,
                                  :shoe => 16,
                                  :points => 12,
                                  :rebounds => 4,
                                  :assists => 7,
                                  :steals => 22,
                                  :blocks => 15,
                                  :slam_dunks => 10},
                                  
                                  {:player_name => 'DeSagna Diop',
                                  :number => 2,
                                  :shoe => 14,
                                  :points => 24,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 4,
                                  :blocks => 5,
                                  :slam_dunks => 5},
                                  
                                  {:player_name => 'Ben Gordon',
                                  :number => 8,
                                  :shoe => 15,
                                  :points => 33,
                                  :rebounds => 3,
                                  :assists => 2,
                                  :steals => 1,
                                  :blocks => 1,
                                  :slam_dunks => 0},
                                  
                                  {:player_name => 'Kemba Walker',
                                  :number => 33,
                                  :shoe => 15,
                                  :points => 6,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 7,
                                  :blocks => 5,
                                  :slam_dunks => 12}]}}
                     
  gameHash
end

def num_points_scored(name)
  
  data = game_hash
  
  # location[0] is the key, location[1] is the data associated with that key

  data.each do |location|
    i = 0
    while i < location[1][:players].length
      if location[1][:players][i][:player_name] == name
        return location[1][:players][i][:points]
      end
      i += 1
    end
  end
end

def shoe_size(name)
    
  data = game_hash
  
  # location[0] is the key, location[1] is the data associated with that key

  data.each do |location|
    i = 0
    while i < location[1][:players].length
      if location[1][:players][i][:player_name] == name
        return location[1][:players][i][:shoe]
      end
      i += 1
    end
  end
end

def team_colors(team)
  
  data = game_hash
  
  data.each do |location|
    if location[1][:team_name] == team
      return location[1][:colors]
    end
  end
end

def team_names()

  data = game_hash
  teamNames = []
  
  data.each do |location|
    teamNames << location[1][:team_name]
  end
  teamNames
end

def player_numbers(team)
  
  data = game_hash
  teamNumbers = []
  data.each do |location|
    if location[1][:team_name] == team
      i = 0
      while i < location[1][:players].length
        teamNumbers << location[1][:players][i][:number]
        i += 1
      end
    end
  end
  teamNumbers
end

def player_stats(name)
  
  data = game_hash
  playerStats = {}
  
  data.each do |location|
    i = 0
    while i < location[1][:players].length
      if location[1][:players][i][:player_name] == name
        playerStats = location[1][:players][i]
      end
      i += 1
    end
  end
  playerStats.delete(:player_name)
  playerStats
end

def big_shoe_rebounds()
  data = game_hash
  shoesize = 0
  numRebounds = 0
  
  data.each do |location|
    location[1][:players].each do |n|
      if shoesize < n[:shoe]
        shoesize = n[:shoe]
        numRebounds = n[:rebounds]
      end
    end
  end
  numRebounds
end




