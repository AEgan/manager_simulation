require_relative 'engineer.rb'
require_relative 'manager.rb'

# create managers
# create sets of engineers for managers to choose from

# bare bones test file. Actual tests need to be implemented, this is just a quick test to see if the choose
# methods work the way I expect them to, testing no potential edge cases.

# poor man's assert method, should probably use unit tests later?
def assert(exp, message = "assertion failed")
	raise Exception.new(message) unless exp
end

# deny method for readability
def deny(exp, message = "assertion failed")
	assert !exp, message
end

# assert_equal function
# the assert and assert_equal functions are available in the unit test module, if we want to use that
def assert_equal(exp1, exp2, message = "assertion failed")
	assert exp1.eql?(exp2), "#{exp1} was expected, result was #{exp2}"
end

# manager 1
@m = Manager.new({:exp => 10, :prof => 5, :tools => 5, :comm => 5}, 
				{:xnot => 0.45, :ynot => 0.15, :znot => 0.25, :wnot => 0.15}, "prof h")

# engineers
@e1 = Engineer.new({:exp => 8, :prof => 5, :tools => 1, :comm => 5},  "1")
@e2 = Engineer.new({:exp => 8, :prof => 2, :tools => 6, :comm => 4},  "2")
@e3 = Engineer.new({:exp => 6, :prof => 2, :tools => 3, :comm => 3},  "3")

# engineer choice bundle 1
eng_bundle_1 = [@e1, @e2, @e3]

# testing the manager was created properly and fields are accessable
def check_manager
	puts "checking manager properties"
	assert_equal "M prof h", @m.name
	assert_equal 10, @m.prefs[:exp]
	assert_equal 5, @m.prefs[:prof]
	assert_equal 5, @m.prefs[:tools]
	assert_equal 5, @m.prefs[:comm]
end

# tests engineer names
def check_engineer_names
	puts "checking engineer names"
	assert_equal @e1.name, "E 1"
	assert_equal @e2.name, "E 2"
	assert_equal @e3.name, "E 3"
end

# tests engineer attributes
# experience
def check_engineer_exp
	assert_equal 8, @e1.skills[:exp]
	assert_equal 8, @e2.skills[:exp]
	assert_equal 6, @e3.skills[:exp]
end

# programming proficiency
def check_engineer_prof
	assert_equal 5, @e1.skills[:prof]
	assert_equal 2, @e2.skills[:prof]
	assert_equal 2, @e3.skills[:prof]
end

# tools
def check_engineer_tools
	assert_equal 1, @e1.skills[:tools]
	assert_equal 6, @e2.skills[:tools]
	assert_equal 3, @e3.skills[:tools]
end

# communication
def check_engineer_comm
	assert_equal 5, @e1.skills[:comm]
	assert_equal 4, @e2.skills[:comm]
	assert_equal 3, @e3.skills[:comm]
end

check_manager
check_engineer_names
check_engineer_exp
check_engineer_prof
check_engineer_tools
check_engineer_comm

puts "testing the choose_engineers method"
puts @m.choose_engineers(eng_bundle_1).skills

puts "testing the choose method"
puts @m.min_sos(@e1.skills, @e2.skills, @e3.skills)

