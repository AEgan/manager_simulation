# our class for simulating conjoint analysis 
class Manager

	# v_hash = {x0, y0, z0, w0} -- basically preferences
	# pref_hash = {.55, .15, .15, .15}
	# i -- id
	def init(v_hash, pref_hash, i)
		# where rand() is the tendency of a persons preferenes - the epsilons
		# for each --> eps(x) - returns a value within + or - 10% of x
		@x = x + rand()
		@y = y + rand()
		@z = x + rand()
		@w = w + rand()
		@name = "M #{i}"
	end

	 # hashes are packages/ what the mangager wants to choose between
	def choose(c1_hash, c2_hash, c3_hash)
		# magic?

		# min sum of squares
		# record to a file
	end

	# epsilon function
	# other things lol?

end

# mngr = []
# 250.times do |i|
# 		m = Manager.new(value, value, value, value)
# 		mngr << m