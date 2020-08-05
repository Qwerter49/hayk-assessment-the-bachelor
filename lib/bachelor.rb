require 'pry'

#creates aoh of contestants
def all_contestants data 
  total_contestants = []
  data.each do |season, info|
    info.each do |person|
      total_contestants << person
    end
  end
  total_contestants
end

#based on given season, returns first name of `winner`
def get_first_name_of_season_winner(data, season)
  data[season].find{|person| person["status"] == "Winner"}["name"].split(" ").first   
end

#finds a contestants name given their occupation
def get_contestant_name data, occupation
  all_contestants(data).find{|person| person["occupation"] == occupation}["name"]
end

#returns the number of contestants from a given hometown
def count_contestants_by_hometown data, hometown
  all_contestants(data).count{|person| person["hometown"] == hometown}
end

#returns the occupation of the first contestant fro a given hometown
def get_occupation data, hometown
  all_contestants(data).find{|person| person["hometown"] == hometown}["occupation"]
end

#given a season, finds the average age of all contestants
def get_average_age_for_season data, season 
  (data[season].map{|person| person["age"].to_f}.reduce{|sum, n| sum + n} /data[season].length).round
end


