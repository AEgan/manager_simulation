# engineer class for simulation
class Engineer

	# attr_accessor for a, b, c, and d to get those directly
	# or use the methods with names below
	attr_accessor :exp, :prof, :tools, :comm, :name, :skills

	# Hash for all skills and a name
	def initialize(skill_hash, i)
		@exp = skill_hash[:exp]
		@prof = skill_hash[:prof]
		@tools = skill_hash[:tools]
		@comm = skill_hash[:comm]
		@name = "E #{i}"
		@skills = skill_hash
	end

end