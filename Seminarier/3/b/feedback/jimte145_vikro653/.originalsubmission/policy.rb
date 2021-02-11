# coding: utf-8
# Data 
# In order for easier control but can be in any order.
Bilmärke  "BMW" => 5 
Bilmärke  "Citroen" => 4 
Bilmärke  "Fiat" => 3 
Bilmärke  "Ford" => 4 
Bilmärke  "Mercedes" => 5 
Bilmärke  "Nissan" => 4 
Bilmärke  "Opel" => 4 
Bilmärke  "Volvo" => 5 
Bilmärke  "Ferrari" => 8
Bilmärke  "" => 7
Postnummer  "58647" => 3 
Postnummer  "58726" => 5 
Postnummer  "58937" => 9
Postnummer  "43529" => 1
Postnummer  "46286" => 7
Postnummer  "32845" => 4
Postnummer  "0" => 0
Körkort  "0-1" => 3
Körkort  "2-3" => 4
Körkort  "4-15" => 4.5
Körkort  "16-99" => 5
Kön  "" => 1
Kön  "Kvinna" => 1
Kön  "Man" => 1
Ålder  "18-20" => 2.5
Ålder  "21-23" => 3
Ålder  "24-26" => 3.5
Ålder  "27-29" => 4
Ålder  "30-39" => 4.5
Ålder  "40-64" => 5
Ålder  "65-70" => 4
Ålder  "71-99" => 3
Ålder  "100-120" => 1
Barn  "0-1" => 5
Barn  "2-3" => 4
Barn  "4-5" => 3
Barn  "5-10" => 2

# @sum modifiers
mod  "Körkort", "< 3", "* 0.9"
mod  "Ålder", "> 80", "* 0.5"
mod_if  "Postnummer", "starts_with", "58", "* 1.2"
mod_if  "Postnummer", "starts_with", "435", "* 0.8"
