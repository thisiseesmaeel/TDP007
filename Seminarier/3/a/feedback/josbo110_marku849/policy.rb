car_model "BMW","5"
car_model "Citroen","4"
car_model "Fiat","3"
car_model "Ford","4"
car_model "Mercedes","5"
car_model "Nissan","4"
car_model "Opel","4"
car_model "Volvo","5"

zip_code "58937","9"
zip_code "58726","5"
zip_code "58647","3"

years_with_license 0..1,"+3"
years_with_license 2..3,"+4"
years_with_license 4..15,"+4.5"
years_with_license 16..99,"+5"

gender "M","+1"
gender "F","+1"

age 18..20,"+2.5"
age 21..23,"+3"
age 24..26,"+3.5"
age 27..29,"+4"
age 30..39,"+4.5"
age 40..64,"+5"
age 65..70,"+4"
age 71..99,"+3"

#Specialfall för män som haft körkort mindre än tre år multipliceras säkerhetspoängen med 0.9.
calc @gender == "M",@years_with_license < 3,"*0.9"
#Specialfall för personer som äger Volvo och som bor i ett postnummerområde 
#som börjar med 58 multipliceras säkerhetspoängen med 1.2
calc @car_model == "Volvo",@zip_code.start_with?("58"),"*1.2"
