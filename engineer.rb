# engineer class for simulation
class Engineer

	def initialize(skill_hash, i)
		@a = skill_hash[:exp]
		@b = skill_hash[:prof]
		@c = skill_hash[:tools]
		@d = skill_hash[:comm]
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
