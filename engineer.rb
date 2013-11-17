# engineer class for simulation
class Engineer

	# attr_accessor for a, b, c, and d to get those directly
	# or use the methods with names below
	attr_accessor :a, :b, :c, :d, :name, :skills

	# Hash for all skills and a name
	def initialize(skill_hash, i)
		@a = skill_hash[:exp]
		@b = skill_hash[:prof]
		@c = skill_hash[:tools]
		@d = skill_hash[:comm]
		@name = "E #{i}"
		@skills = skill_hash
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
