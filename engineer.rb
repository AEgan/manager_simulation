# engineer class for simulation
class Engineer

	# attr_accessor for a, b, c, and d to get those directly
	# or use the methods with names below
	attr_accessor :exp, :prog, :tools, :comm, :name, :skills

	# Hash for all skills and a name
	def initialize(skill_hash, i)
		[:exp, :prog, :tools, :comm].each do |key|
			if(skill_hash[key].nil? || skill_hash[key] > 5 || skill_hash[key] < 1)
				raise Exception.new("Engineers must have a hash with :exp, :prof, :tools, and :comm with a value between 1 and 5")
			end
		end
		@exp = skill_hash[:exp]
		@prof = skill_hash[:prog]
		@tools = skill_hash[:tools]
		@comm = skill_hash[:comm]
		@name = "#{i}"
		@skills = skill_hash
	end

end