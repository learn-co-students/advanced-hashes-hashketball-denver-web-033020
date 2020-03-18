# Write your code here!
def game_hash
  
  gamehash={
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors =>["Black","White"],
      :players =>[
        {
        :player_name =>"Alan Anderson",
        :number => 0,
        :shoe => 16, 
        :points => 22, 
        :rebounds => 12,
        :assists => 12,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 1
        },
        {
        :player_name =>"Reggie Evans",
        :number => 30,
        :shoe => 14, 
        :points => 12, 
        :rebounds => 12,
        :assists => 12,
        :steals => 12, 
        :blocks => 12,
        :slam_dunks => 7
        },
        {
        :player_name =>"Brook Lopez",
        :number => 11,
        :shoe => 17, 
        :points => 17, 
        :rebounds => 19,
        :assists => 10,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 15
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
        :slam_dunks => 5
        },
        {
        :player_name => "Jason Terry" ,
        :number => 31,
        :shoe => 15, 
        :points => 19, 
        :rebounds => 2,
        :assists => 2,
        :steals => 4, 
        :blocks => 11,
        :slam_dunks => 1
        },
        ]
    },
    :away =>{
      :team_name => "Charlotte Hornets",
      :colors =>["Turquoise","Purple"],
      :players =>[
        {
        :player_name =>"Jeff Adrien",
        :number => 4,
        :shoe => 18, 
        :points => 10, 
        :rebounds => 1,
        :assists => 1,
        :steals => 2, 
        :blocks => 7,
        :slam_dunks => 2
        },
        {
        :player_name =>"Bismack Biyombo",
        :number => 0,
        :shoe => 16, 
        :points => 12, 
        :rebounds => 4,
        :assists => 7,
        :steals => 22, 
        :blocks => 15,
        :slam_dunks => 10
        },
        {
        :player_name =>"DeSagna Diop",
        :number => 2,
        :shoe => 14, 
        :points => 24, 
        :rebounds => 12,
        :assists => 12,
        :steals => 4, 
        :blocks => 5,
        :slam_dunks => 5
        },
        {
        :player_name =>"Ben Gordon",
        :number => 8,
        :shoe => 15, 
        :points => 33, 
        :rebounds => 3,
        :assists => 2,
        :steals => 1, 
        :blocks => 1,
        :slam_dunks => 0
        },
        {
        :player_name =>"Kemba Walker",
        :number => 33,
        :shoe => 15, 
        :points => 6, 
        :rebounds => 12,
        :assists => 12,
        :steals => 7, 
        :blocks => 5,
        :slam_dunks => 12
        },
        ]
    }
  }
end

def num_points_scored(name)
  hash = game_hash
  result=nil
  hash.each{|team,attributes|
    players=attributes[:players]
    players.each{|player_hash|
      if player_hash[:player_name] == name
        result = player_hash[:points]
      end
    }
  }
  result
end

def shoe_size(name)
  hash = game_hash
  result=nil
  hash.each{|team,attributes|
    players=attributes[:players]
    players.each{|player_hash|
      if player_hash[:player_name] == name
        result = player_hash[:shoe]
      end
    }
  }
  result
end

def team_colors(name)
  hash = game_hash
  result=[]
  hash.each{|team,attributes|
      if attributes[:team_name] == name
        result = attributes[:colors]
      end
    }
  result
end

def team_names
  hash = game_hash
  result=[]
  
  hash.each{|team,attributes|
    result << attributes[:team_name]
  }
  result
end

def player_numbers(name)
  hash = game_hash
  result=[]
  hash.each{|team,attributes|
    if attributes[:team_name] == name
      players=attributes[:players]
      players.each{|player_hash,value|
          result << player_hash[:number]
      }
    end
  }
  result
end

def player_stats(name)
  hash = game_hash
  result={}
  hash.each{|team,attributes|
    players=attributes[:players]
    players.each{|player_hash|
      if player_hash[:player_name] == name
        result = player_hash
        result.delete(:player_name)
      end
    }
  }
  result
end

def big_shoe_rebounds
  hash = game_hash
  biggest_shoe=0
  result=nil
  hash.each{|team,attributes|
    players=attributes[:players]
    players.each{|player_hash|
      if player_hash[:shoe] > biggest_shoe
        biggest_shoe=player_hash[:shoe]
        result = player_hash[:rebounds]
      end
    }
  }
  result
end

def most_points_scored
  hash = game_hash
  most_points=0
  result=nil
  hash.each{|team,attributes|
    players=attributes[:players]
    players.each{|player_hash|
      if player_hash[:points] > most_points
        most_points=player_hash[:points]
        result = player_hash[:player_name]
      end
    }
  }
  result
end

def total_team_points(name)
  hash = game_hash
  total=0
  hash.each{|team,attributes|
    if attributes[:team_name] == name
      players=attributes[:players]
      players.each{|player_hash|
          total += player_hash[:points]
    }
    end
  }
  total
end

def winning_team
  teams_array=team_names
  first_team=teams_array[0]
  second_team=teams_array[1]
  first_team_points=total_team_points(first_team)
  second_team_points=total_team_points(second_team)
  victor=nil
  
  if first_team_points > second_team_points
    victor=first_team
  elsif first_team_points < second_team_points
    victor=second_team
  else
    victor="Tie Game"
  end
  
  victor
end

def player_with_longest_name
  hash = game_hash
  longest_name_length=0
  result=nil
  hash.each{|team,attributes|
    players=attributes[:players]
    players.each{|player_hash|
    player_name=player_hash[:player_name]
      if player_name.length > longest_name_length
        longest_name_length=player_name.length
        result = player_hash[:player_name]
      end
    }
  }
  result
end

def most_steals_player
  hash = game_hash
  most_steals=0
  result=nil
  hash.each{|team,attributes|
    players=attributes[:players]
    players.each{|player_hash|
      if player_hash[:steals] > most_steals
        most_steals=player_hash[:steals]
        result = player_hash[:player_name]
      end
    }
  }
  result
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals_name = most_steals_player
  
  if longest_name == most_steals_player
    return true
  else
    return false
  end
end