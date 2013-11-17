require_relative 'engineer.rb'
require_relative 'manager.rb'

# create managers
# mngr = []
# 250.times do |i|
# 		m = Manager.new(values_hash, preferences_hash, name)
# 		mngr << m

# create possibilities to pass in for choose

# bare bones test file. Actual tests need to be implemented, this is just a quick test to see if the choose
# methods work the way I expect them to, testing no potential edge cases.

m = Manager.new({:exp => 10, :prof => 5, :tools => 5, :comm => 5}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, 
				"prof h")

e1 = Engineer.new({:exp => 10, :prof => 5, :tools => 5, :comm => 5}, 
				"student 1")
e2 = Engineer.new({:exp => 8, :prof => 2, :tools => 1, :comm => 4}, 
				"student 2")
e3 = Engineer.new({:exp => 6, :prof => 2, :tools => 3, :comm => 3}, 
				"student 3")

puts "testing the choose_engineers method"
puts m.choose_engineers(e1, e2, e3).name

puts "testing the choose method"
puts m.choose(e1.skills, e2.skills, e3.skills)