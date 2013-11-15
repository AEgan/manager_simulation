# our class for simulating conjoint analysis
# inits manager --> chooses best of 3 --> outputs choices to CSV

require_relative 'engineer.rb'

class Manager

	# v_hash = {x0, y0, z0, w0} -- basically preferences
	# weights_hash = {.55, .15, .15, .15}
	# i -- name or some kind of id
	def initialize(pref_hash, weights_hash, i)
		# where rand() is the tendency of a persons preferenes - the epsilons
		# for each --> eps(x) - returns a value within + or - 10% of x
		@x = weights_hash[:xnot] + eps(weights_hash[:xnot])
		@y = weights_hash[:ynot] + eps(weights_hash[:ynot])
		@z = weights_hash[:znot] + eps(weights_hash[:znot])
		@w = weights_hash[:wnot] + eps(weights_hash[:wnot])
		@prefs = pref_hash
		@name = "M #{i}"
		puts @x, @y, @z, @w
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
	def choose(e1, e2, c3)
		# min sum of squares
		# record to a file
	end

end

# create managers
# mngr = []
# 250.times do |i|
# 		m = Manager.new(values_hash, preferences_hash, name)
# 		mngr << m

# create possibilities to pass in for choose

m = Manager.new({:exp => 10, :prof => 5, :tools => 5, :comm => 5}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, 
				"prof h")

e = Engineer.new({:exp => 10, :prof => 5, :tools => 5, :comm => 5}, 
				"student")






