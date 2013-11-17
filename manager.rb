# our class for simulating conjoint analysis
# inits manager --> chooses best of 3 --> outputs choices to CSV

require_relative 'engineer.rb'

class Manager

	# attr accessors to make some things easier
	attr_accessor :x, :y, :z, :w, :pref_weights, :prefs, :name

	# pref_hash = {x0, y0, z0, w0} -- basically preferences
	# weights_hash = {.55, .15, .15, .15}
	# i -- name or some kind of id
	def initialize(pref_hash, weights_hash, i)
		# for each --> eps(x) - returns a value within + or - 10% of x
		@x = weights_hash[:xnot] + eps(weights_hash[:xnot])
		@y = weights_hash[:ynot] + eps(weights_hash[:ynot])
		@z = weights_hash[:znot] + eps(weights_hash[:znot])
		@w = weights_hash[:wnot] + eps(weights_hash[:wnot])

		# made them exp prof tools and comm to be able to access them easily
		# in the choose function
		@pref_weights = Hash.new
		@pref_weights[:exp] = @x
		@pref_weights[:prof] = @y
		@pref_weights[:tools] = @z
		@pref_weights[:comm] = @w
		@prefs = pref_hash
		@name = i
	end

	# epsilon function
	def eps(num)
		prng = Random.new
		@change = 0.10 * num
		@negchange = 0.10 * num * -1
		return prng.rand(@negchange..@change)
	end

	# hashes are packages/ what the mangager wants to choose between
	# soo hashes can be passed in or just engineer objects??
	def choose(e1, e2, e3)
		# min sum of squares
		sum1 = sum_of_squares(e1)
		sum2 = sum_of_squares(e2)
		sum3 = sum_of_squares(e3)
		minimum = sum1

		# TO DO ... 
		# record these results to a file

		if(sum1 < sum2 && sum1 < sum3)
			return e1
		elsif sum2 < sum1 && sum2 < sum3
			return e2
		else
			return e3
		end
	end

	# choose method passing in engineer objects
	# just calling the choose method above. If we want
	# to modify it later to print out names to a file as well
	# that shouldn't be a big issue
	def choose_engineers(e1, e2, e3)
		min = choose(e1.skills, e2.skills, e3.skills)
		if(min.eql?(e1.skills))
			return e1
		elsif min.eql?(e2.skills)
			return e2
		else
			return e3
		end
		#write to a file	
	end

	private
	# helper method for choose which gets the sum of squares for the hash passed in
	# for sum of square errors, does it matter of the engineer's skill is greater than 
	# the preference for a manager? engineer with 10 experience would be better in that
	# category than an engineer with 8 experience, but that's not according to this function
	# but that could be easily changed by uncommenting the unless... I think
	def sum_of_squares(e_hash)
		sum = 0
		e_hash.keys.each do |key|
			sum += ((e_hash[key] - @prefs[key]) ** 2) * @pref_weights[key] #unless e_hash[key] > @prefs[key]
		end
		sum
	end

end
