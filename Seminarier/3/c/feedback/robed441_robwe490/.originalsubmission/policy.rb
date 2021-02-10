make "BMW", 5
make "Citroen", 4
make "Fiat", 3
make "Ford", 4
make "Mercedes", 5
make "Nissan", 4
make "Opel", 4
make "Volvo", 5

postal_code "58937", 9
postal_code "58726", 5
postal_code "58647", 3

license_age 0..1, 3
license_age 2..3, 4
license_age 4..15, 4.5
license_age 16..99, 5

gender "F", 1
gender "M", 1

age 18..20, 2.5
age 21..23, 3
age 24..26, 3.5
age 27..29, 4
age 30..39, 4.5
age 40..64, 5
age 65..70, 4
age 71..99, 3

if (@gender == "M" && @license_age < 3) then multiply(0.9) end

if (@postal_code.start_with?("58") && @make == "Volvo") then multiply(1.2) end

#if @gender == "M" && @license_age < 3 then @score = @score * 0.9 end
#if f(@gender == "M" && @license_age < 3) then multiply(0.9) end
#condition(gender == "M", license_age < 3, multiply(0.9))