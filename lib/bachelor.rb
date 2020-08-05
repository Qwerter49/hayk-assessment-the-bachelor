require 'pry'


#based on given season, returns first name of `winner`
def get_first_name_of_season_winner(data, season)
  data[season].find{|person| person["status"] == "Winner"}["name"].partition(" ").first   
end

#finds person who has certian occupation
def get_contestant_name(data, occupation)
  data.each do |season, info|
    if  info.find{|person| person["occupation"] == occupation}
      return info.find{|person| person["occupation"] == occupation}["name"]
    end
  end
end

#returns a counter of number of contestants from a hometown
def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, info|
    info.each do |person| 
      if person["hometown"] == hometown
        counter += 1
      end 
    end
  end
  counter
end

#Returns first contestant from a given hometown
def get_occupation(data, hometown)
  data.each do |season, info|
    info.find do |person|
      if person["hometown"] == hometown
        return person["occupation"]
      end
    end
  end
end

#given a season, finds the average age of all contestants
def get_average_age_for_season(data, season)
  all_ages = []
  data[season].each do |person|
    all_ages << person["age"].to_f
  end
  average_age = all_ages.reduce(0) {|sum, n| sum + n}.to_f/all_ages.length
  average_age.round
end

