# table (String|Symbol), {(String|Symbol|Range) => (Integer|Float), ...}
# rule [String, ...], (:*|:+), (Integer|Float)


table :car_brand, {"BMW" => 5, "Citroen" => 4, "Fiat" => 3, "Ford" => 4, "Mercedes" => 5, "Nissen" => 4, "Opel" => 4, "Volvo" => 5}
table :area_code, {"58937" => 9, "58726" => 5, "58647" => 3}
table :license_age, {0..1 => 3, 2..3 => 4, 4..15 => 4.5, 16..99 => 5}
table :sex, {"K" => 1, "M" => 1}
table :age, {18..20 => 2.5, 21..23 => 3, 24..26 => 3.5, 27..29 => 4, 30..39 => 4.5, 40..64 => 5, 65..70 => 4, 71..99 => 3}

rule ["sex == 'M'", "license_age < 3"], :*, 0.9
rule ["car_brand == 'Volvo'", "area_code[0..1] == '58'"], :*, 1.2 