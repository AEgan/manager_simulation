# our class for simulating conjoint analysis
# inits manager --> chooses best of 3 --> outputs choices to CSV

require_relative 'engineer.rb'

class Manager

	# attr accessors to make some things easier
	attr_accessor :x, :y, :z, :w, :pref_weights, :prefs, :name

	# pref_hash	   -- concrete preferences of manager within inclusive (1..10) ex {1,2,3,10}
	# weights_hash -- weights of each preference the manager has, sums to 1, ex {:xnot => 0.45, :ynot => 0.15, :znot => 0.25, :wnot => 0.15}
	# i -- name or some kind of unique id
	def initialize(pref_hash, weights_hash, i)
		# for each --> eps(x) - returns a value within + or - 10% of x

		# weights must be between 0 and 1, checking here unless there is a better
		# way to do it. Also checking that they add to 1
		# sum = 0
		# weights_hash.keys.each do |key|
		# 	if(weights_hash[key] < 0 || weights_hash[key] > 1)
		# 		raise Exception.new("Manager weights must be between 0 and 1")
		# 	else
		# 		sum += weights_hash[key]
		# 	end
		# end

		# # make sure the sum adds to 1
		# if sum != 1
		# 	raise Exception.new("Manager weights must add up to 1")
		# end

		# # preferences have to be on a 1 to 5 scale, so I'm checking them here
		# pref_hash.keys.each do |key|
		# 	if(pref_hash[key] < 1 || pref_hash[key] > 5)
		# 		raise Exception.new("Manager preferences must be on a scale from 1 to 5")
		# 	end
		# end

		# # make sure pref hash has all the keys we need it to
		# [:exp, :prog, :tools, :comm].each do |key|
		# 	raise Exception.new("Manager must have :exp, :prog, :tools, and :comm for preferences") if pref_hash[key].nil?
		# end

		# # make sure the weight hash has all the keys we need it to
		# [:xnot, :ynot, :znot, :wnot].each do |key|
		# 	raise Exception.new("Manager must have :xnot, :ynot, :znot, :wnot as keys for weights") if weights_hash[key].nil?
		# end

		# applies weights
		# sets weights to 0 if epsilon makes them negative
		# sets weights to 1 if epsilon makes them greater than 1
		@pref_weights = Hash.new
		if(key_check([:xnot, :ynot, :znot, :wnot], weights_hash))
			@x = weights_hash[:xnot] + eps(weights_hash[:xnot])
			@x = 0 if @x < 0
			@x = 1 if @x > 1
			@y = weights_hash[:ynot] + eps(weights_hash[:ynot])
			@y = 0 if @y < 0
			@y = 1 if @y > 1
			@z = weights_hash[:znot] + eps(weights_hash[:znot])
			@z = 0 if @z < 0
			@z = 1 if @z > 1
			@w = weights_hash[:wnot] + eps(weights_hash[:wnot])
			@w = 0 if @w < 0
			@w = 1 if @w > 1
			@pref_weights[:exp] = @x
			@pref_weights[:prog] = @y
			@pref_weights[:tools] = @z
			@pref_weights[:comm] = @w
		end
		@name = "M #{i}"
		# made them exp prof tools and comm to be able to access them easily
		# in the choose function
		@prefs = pref_hash
	end

	# epsilon function
	def eps(num)
		if num < 0
			0
		else
			prng = Random.new
			change = 0.10 * num
			negchange = 0.10 * num * -1
			return prng.rand(negchange.round(4)..change.round(4))
		end
	end

	# choose method passing in engineer objects
	def choose_engineers(eng_array)

		min = min_sos(eng_array[0].skills, eng_array[1].skills, eng_array[2].skills)

		output = File.open('output.csv', 'a')

		# output.write "#{@name},"

		if(min.eql?(eng_array[0].skills))
			output.write "1," #"Choosing #{e1.name},"
			output.close
			return eng_array[0]
		elsif min.eql?(eng_array[1].skills)
			output.write "2," #"Choosing #{e2.name},"
			output.close
			return eng_array[1]
		else
			output.write "3," #"Choosing #{e3.name},"
			output.close
			return eng_array[2]
		end

	end

  # choose function using the linear difference
	def choose_engineers_linear(eng_array)
		min = min_linaer_dif(eng_array[0].skills, eng_array[1].skills, eng_array[2].skills)

		output = File.open('output.csv', 'a')

		if(min.eql?(eng_array[0].skills))
			output.write "1,"
			output.close
			return eng_array[0]
		elsif min.eql?(eng_array[1].skills)
			output.write "2,"
			output.close
			return eng_array[1]
		else
			output.write "3,"
			output.close
			return eng_array[2]
		end
	end

	# choose engineers function using the weighted linear method
	def choose_engineers_weighted(eng_array)
		min = min_weighted_linear_dif(eng_array[0].skills, eng_array[1].skills, eng_array[2].skills)

		output = File.open('output.csv', 'a')

		if(min.eql?(eng_array[0].skills))
			output.write "1,"
			output.close
			return eng_array[0]
		elsif min.eql?(eng_array[1].skills)
			output.write "2,"
			output.close
			return eng_array[1]
		else
			output.write "3,"
			output.close
			return eng_array[2]
		end
	end

	# chooses engineers based on the exponential choice function
	def choose_engineers_exponential(eng_array)
		min = min_exponential_dif(eng_array[0].skills, eng_array[1].skills, eng_array[2].skills)

		output = File.open('output.csv', 'a')

		if(min.eql?(eng_array[0].skills))
			output.write "1,"
			output.close
			return eng_array[0]
		elsif min.eql?(eng_array[1].skills)
			output.write "2,"
			output.close
			return eng_array[1]
		else
			output.write "3,"
			output.close
			return eng_array[2]
		end
	end

	# method for choosing the minimum difference in expectation for engineers 
	# using the linear difference function described in the linear_dif method
	def min_linaer_dif(e1, e2, e3)
		result1 = linear_dif(e1)
		result2 = linear_dif(e2)
		result3 = linear_dif(e3)

		if(result1 <= result2 && result1 <= result3)
			return e1
		elsif result2 <= result1 && result2 <= result3
			return e2
		else
			return e3
		end		
	end

	# method for choosing the minimum difference in expectation for engineers
	# using the weighted linear difference function below
	def min_weighted_linear_dif(e1, e2, e3)
		result1 = weighted_linear_dif(e1)
		result2 = weighted_linear_dif(e2)
		result3 = weighted_linear_dif(e3)

		if(result1 <= result2 && result1 <= result3)
			return e1
		elsif result2 <= result1 && result2 <= result3
			return e2
		else
			return e3
		end		
	end

	# method for choosing the minimum difference in expectation for engineers
	# using the exponential difference function below
	def min_exponential_dif(e1, e2, e3)
		result1 = exponential_dif(e1)
		result2 = exponential_dif(e2)
		result3 = exponential_dif(e3)

		if(result1 <= result2 && result1 <= result3)
			return e1
		elsif result2 <= result1 && result2 <= result3
			return e2
		else
			return e3
		end	
	end

	# e#s are hashes / this fcn takes the min of the calculated sos
	def min_sos(e1, e2, e3)
		# min sum of squares
		result1 = sum_of_squares(e1)
		result2 = sum_of_squares(e2)
		result3 = sum_of_squares(e3)
		# minimum = result1

		# record to a file
		# output = File.open('output.csv', 'a')
		# output.write "========================================\n"
		# output.write "#{@name},"
		# output.write "e1's sum of squares is #{result1}\n"
		# output.write "e2's sum of squares is #{result2}\n"
		# output.write "e3's sum of squares is #{result3}\n"

		if(result1 <= result2 && result1 <= result3)
			# output.write "Choosing e1 with sos result :: #{result1}\n"
			# output.close
			return e1
		elsif result2 <= result1 && result2 <= result3
			# output.write "Choosing e2 with sos result :: #{result2}\n"
			# output.close
			return e2
		else
			# output.write "Choosing e3 with sos result #{result3}\n"
			# output.close
			return e3
		end
	end

	# a valid method to check to make sure the managers that are created are valid
	def valid?
		return validate_weight_hash && validate_pref_hash && key_check([:exp, :prog, :tools, :comm], @prefs) && key_check([:xnot, :ynot, :znot, :wnot], @pref_weights)
	end

	private

	# VALIDATION HELPERS

	# validates that the weight hash sums to 1, none of the individual keys are below zero or above 1
	# this is for validation on create, because randomness of epsilon will not sum up to one. For validation
	# in the 'valid?' method use the one below
	def validate_weight_hash_on_create
		sum = 0
		@pref_weights.keys.each do |key|
			if(0 < @pref_weights[key] || @pref_weights[key] < 1)
				return false
			else
				sum += @pref_weights[key]
			end
		end
		sum == 1
	end

	# validates each key in the weight hash maps to a value between 0 and 1. This one is for the valid? method, not
	# the creation checks becuase randomness of epsilon will make it so that values will not sum to 1
	def validate_weight_hash
		@pref_weights.keys.each do |key|
			return false if(0 < @pref_weights[key] || @pref_weights[key] < 1)
		end
		true
	end

	# validates that the preferences in the pref hash are between 1 and 5. This can be used in the initialize method as well as the
	# valid? method
	def validate_pref_hash
		@prefs.keys.each do |key|
			return false if (1 < @prefs[key] || @prefs[key] < 5)
		end
		true
	end

	# a method to check that all the keys are in the hash
	def key_check(keys, hash)
		keys.each do |key|
			return false if hash[key].nil?
		end
	end

	# helper method for choose which gets the sum of squares for the hash passed in
	# for sum of square errors, does it matter of the engineer's skill is greater than 
	# the preference for a manager? engineer with 10 experience would be better in that
	# category than an engineer with 8 experience, but that's not according to this function
	# but that could be easily changed by uncommenting the unless... I think

	# linear increase for over
	# exponential decrease for under
	def sum_of_squares(e_hash)
		sum = 0
		e_hash.keys.each do |key|
			sum += (((e_hash[key] - @prefs[key]) ** 2) * @pref_weights[key]) unless e_hash[key] > @prefs[key]
		end
		sum
	end

	# helper method to get a linear difference between a manager's preference and an engineer's skills
	# this private method has the same slope for someone above a managers preferences (a bonus) as it does
	# to someone below a manager's preferences (penalty). So if the preference is a 4 for skill x, a stronger 
	# candidate with an x value of 5 will get a bonus of 1, while a weaker candidate with an x value of 3 
	# will get a penalty of 1. Because the sum_of_squres method is returning a value that represents a
	# the distance between preferences and skill levels so that the LOWEST value represents the best candidate,
	# this method will return a value, and the LOWEST value will once again represent the best candidate
	# therefore a candidate with -2 is better than a candidate with +2.
	def linear_dif(e_hash)
		val = 0
		e_hash.keys.each do |key|
			val += (@prefs[key] - e_hash[key]) * @pref_weights[key]
		end
		val
	end

	# helper method that gets a linear difference between a manager's preference and an engineer's skills.
	# An engineer who has a skill value greater than the manager's preferences will get a bonus, but an engineer
	# whose skill values are lower than a manager's preferences will recieve a penalty that will carry more weight
	# than the engineer who outpreforms the preferences. For example: preference is 3, engineer 1 has a value of 4,
	# and will get a "bonus" of 1. Engineer 2 has a value of 2, and will have a "penalty" of 1.5. The change will be
	# linear, but different slope depending on if you are up to the preferences of the manager or not
	def weighted_linear_dif(e_hash)
		val = 0
		e_hash.keys.each do |key|
			if e_hash[key] > @prefs[key]
				val -= ((e_hash[key] - @prefs[key]) * @pref_weights[key])
			elsif @prefs[key] > e_hash[key]
				val += ((@prefs[key] - e_hash[key]) * @pref_weights[key]) * 1.5
			end
		end
		val
	end

	# helper method that gets an exponential difference between a manager's preference and an engineer's skills.
	# this method is similar to the one above, where penalties and bonuses carry different weights, but in this case
	# a bonus is a linear function of it's distance from the preference, so a if a preference is for a 3, and a 
	# candidate has a 4, the bonus will be 1. If the candidate has a 5, the bonus will be 2. However for penalties the
	# amount is an exponential function, so a candidate with a value of 2 will have a penalty of 1 [(3-2) * (3-2)]
	# multiplied by a weight, while a candidate with a value of 1 will have a penalty of 4 [(3-1) * (3-1)] times a weight
	def exponential_dif(e_hash)
		val = 0
		e_hash.keys.each do |key|
			if e_hash[key] > @prefs[key]
				val -= ((e_hash[key] - @prefs[key]) * @pref_weights[key])
			elsif @prefs[key] > e_hash[key]
				val += ((2 ** (e_hash[key] - @prefs[key]) ) * @pref_weights[key])
			end
		end
		val
	end

end




