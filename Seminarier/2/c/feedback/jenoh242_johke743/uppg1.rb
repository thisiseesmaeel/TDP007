# coding: utf-8


#Läs in fil

#Läs in namn, värde 1 och värde 2

#Funktion för att jämför värde 1 och värde 2 av alla namn, retunera namn med minst skillnad

#Funktion för att retunera array med störst skillnad för ragordning

#Skapa en klass som innehåller namnet och behåller värdena. FÖr att spara objekten iterar vi över filen. Placeras i en array. 

def read_file(filename)
  file = File.open(filename)
  file_data = file.readlines
  file.close
  file_data
end


class Component
    attr_accessor :name, :value_1, :value_2, :diff
    def initialize(name, value_1, value_2)
    @name = name
    @value_1 = value_1
    @value_2 = value_2
    @diff = (value_1 - value_2).abs
    end
end

def create_teams(array)
    re_name = /\b[a-zA-z]+\b/
    re_num = /(\b\d+\b)\s+-\s+(\b\d+\b)/
    team_array = []

    array.each do | item |
        if item.match?(re_name) && item.match?(re_num)
          #team = re_name.match(item)
          team_name = re_name.match(item)[0]
          f_score = re_num.match(item)[1].to_i
          p_score =  re_num.match(item)[2].to_i
          team = Component.new(team_name, f_score, p_score)
          team_array << team
        end
    end

    return team_array
end


def sort_by_diff(array)
  array.sort { |team1, team2| team1.diff <=> team2.diff }
end


def get_lowest_diff(array)
  array = sort_by_diff(array)
  array[0]
end

