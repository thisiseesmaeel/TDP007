car_model ["BMW", 5], ["Citroen", 4], ["Fiat", 3], ["Ford", 4],
 ["Mercedes", 5], ["Nissan", 4], ["Opel", 4], ["Volvo", 5]
post_number ["58937", 9], ["58726", 5], ["58647", 3]
license_year [0, 1, 3], [2, 3, 4], [4, 15, 4.5], [16, 99, 5]
sex ["M", 1], ["W", 1]
age [18, 20, 2.5], [21, 23, 3], [24, 26, 3.5], [27, 29, 4],
 [30, 39, 4.5], [40, 64, 5], [65, 70, 4], [71, 99, 3]
special_rule "if @sex == 'M' and @license_year < 3 
then @result *= 0.9 end"
special_rule "if @car_model == 'Volvo' and @post_number.start_with?('58')
 then @result *= 1.2 end"