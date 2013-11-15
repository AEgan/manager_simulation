# engineer class for simulation
class Engineer

	def initialize(skill_hash, i)
		@a = skill_hash[:a]
		@b = skill_hash[:b]
		@c = skill_hash[:c]
		@d = skill_hash[:c]
		@name = "E #{i}"
	end

	def years 
		return @a 
	end

	def prog
		return @b
	end

	def tools
		return @c
	end

	def comm
		return @d
	end

end