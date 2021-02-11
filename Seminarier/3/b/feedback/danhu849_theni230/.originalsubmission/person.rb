#utökar Hash för att dra nytta av key-value par
class Person < Hash
	
	#lägger in allt i en hash
	def initialize(car_brand, postcode, license_span, sex, age)
		@security_points = 0
		self["car_brand"] = car_brand
		self["postcode"] = postcode
		self["license_span"] = license_span
		self["sex"] = sex
		self["age"] = age
	end
	
	#eval läser igenom hela filen och returnerar slutresultatet
	def evaluate_policy(file)
		instance_eval(File.read(file))
		
		if self["sex"] == "M" && self["license_span"] < 3
			@security_points *= 0.9
		end
		
		if self["car_brand"] == "Volvo" && self["postcode"][0, 2] == "58"
			@security_points *= 1.2
		end
		
		return @security_points
  end
	
	#medan instance_eval() sker läser method_missing in rad för rad
	#om ett värde inte existerar i policy kommer inget att adderas
	def method_missing(name, *args)
		if name.to_s == "car_brand" && args[0] == self["car_brand"]
			@security_points += args[1]
		elsif name.to_s == "postcode" && args[0] == self["postcode"]
			@security_points += args[1]
		elsif name.to_s == "license_span" && args[0] === self["license_span"]
			@security_points += args[1]
		elsif name.to_s == "sex" && args[0] == self["sex"]
			@security_points += args[1]
		elsif name.to_s == "age" && args[0] === self["age"]
			@security_points += args[1]
		end
  end
end

#kalle=Person.new("Volvo", "58435", 2, "M", 32)
#puts kalle.evaluate_policy("policy.rb")

