


class Person

	def initialize(car_brand, area_code, license_age, sex, age)
		@car_brand = car_brand      # string
		@area_code = area_code      # string
		@license_age = license_age  # integer
		@sex = sex  				# string
		@age = age                  # integer
		@insurance_score = 0
	end

	def evaluate_policy(filename)
		instance_eval(File.read(filename))
		@insurance_score 
	end

	# evaluate table
	def table(name, data)
		if data.keys[0].class == Range
			key = instance_eval("@#{name}")
			# check what range key is part of, if any
			value = (data.select {|data_key| data_key === key}.values)[0]
			if value
				@insurance_score += value
			end	
		else 
			key = instance_eval("@#{name}")
			if data[key]
				@insurance_score += data[key]
			end
		end
	end

	# evaluate rule
	def rule(conditions, operator, value)
		apply_rule = true
		# if every condition in the rule is true...
		for condition in conditions
			apply_rule = false if not instance_eval("@#{condition}")
		end

		# ... then apply the rule
		if apply_rule
			instance_eval("@insurance_score #{operator}= #{value}")
		end
	end


end

