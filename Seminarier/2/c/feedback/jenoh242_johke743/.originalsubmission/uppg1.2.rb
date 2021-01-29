require "./uppg1.rb"


def create_weather(array)

    re = /^\s+\d{1,2}\s+\d+/

    weather_array = []

    array.each do | item |
        if item.match?(re)
            
            item = item.split
            day = item[0]
            value_1 = item[1].to_i
            value_2 =  item[2].to_i

            day_object = Component.new(day, value_1, value_2)
            weather_array << day_object
        end
    end

    return weather_array
end

