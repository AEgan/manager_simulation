require_relative 'engineer.rb'
require_relative 'manager.rb'
require 'test/unit'
# create managers
# create sets of engineers for managers to choose from

# bare bones test file. Actual tests need to be implemented, this is just a quick test to see if the choose
# methods work the way I expect them to, testing no potential edge cases.

class ManagerTest < Test::Unit::TestCase
	# manager 1
	@m = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
					{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")

	# engineers
	@e1 =  Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 3},  "1")
	@e2 =  Engineer.new({:exp => 5, :prog => 1, :tools => 4, :comm => 4},  "2")
	@e3 =  Engineer.new({:exp => 5, :prog => 4, :tools => 1, :comm => 5},  "3")

	# engineer choice bundle 1
	eng_bundle_1  = [@e1,	@e2,  @e3]

	# testing the manager was created properly and fields are accessable
	def test_manager
		@m = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
					{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
		assert_equal "M prof h", @m.name
		assert_equal 5, @m.prefs[:exp]
		assert_equal 2, @m.prefs[:prog]
		assert_equal 3, @m.prefs[:tools]
		assert_equal 2, @m.prefs[:comm]
	end

	# tests engineer names
	def test_engineer_names
		@e1 =  Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 3},  "1")
		@e2 =  Engineer.new({:exp => 5, :prog => 1, :tools => 4, :comm => 4},  "2")
		@e3 =  Engineer.new({:exp => 5, :prog => 4, :tools => 1, :comm => 5},  "3")
		assert_equal @e1.name, "1"
		assert_equal @e2.name, "2"
		assert_equal @e3.name, "3"
	end

	# tests engineer attributes
	# experience
	def test_engineer_exp
		@e1 =  Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 3},  "1")
		@e2 =  Engineer.new({:exp => 5, :prog => 1, :tools => 4, :comm => 4},  "2")
		@e3 =  Engineer.new({:exp => 5, :prog => 4, :tools => 1, :comm => 5},  "3")
		assert_equal 1, @e1.skills[:exp]
		assert_equal 5, @e2.skills[:exp]
		assert_equal 5, @e3.skills[:exp]
	end

	# programming proficiency
	def test_engineer_prog
		@e1 =  Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 3},  "1")
		@e2 =  Engineer.new({:exp => 5, :prog => 1, :tools => 4, :comm => 4},  "2")
		@e3 =  Engineer.new({:exp => 5, :prog => 4, :tools => 1, :comm => 5},  "3")
		assert_equal 1, @e1.skills[:prog]
		assert_equal 1, @e2.skills[:prog]
		assert_equal 4, @e3.skills[:prog]
	end

	# tools
	def test_engineer_tools
		@e1 =  Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 3},  "1")
		@e2 =  Engineer.new({:exp => 5, :prog => 1, :tools => 4, :comm => 4},  "2")
		@e3 =  Engineer.new({:exp => 5, :prog => 4, :tools => 1, :comm => 5},  "3")
		assert_equal 5, @e1.skills[:tools]
		assert_equal 4, @e2.skills[:tools]
		assert_equal 1, @e3.skills[:tools]
	end

	# communication
	def test_engineer_comm
		@e1 =  Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 3},  "1")
		@e2 =  Engineer.new({:exp => 5, :prog => 1, :tools => 4, :comm => 4},  "2")
		@e3 =  Engineer.new({:exp => 5, :prog => 4, :tools => 1, :comm => 5},  "3")
		assert_equal 3, @e1.skills[:comm]
		assert_equal 4, @e2.skills[:comm]
		assert_equal 5, @e3.skills[:comm]
	end

	# valid preferences
  	def test_valid_preferences
  		# exp below 1
  		testManager = Manager.new({:exp => 0, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?

  		# prog below 1
  		testManager = Manager.new({:exp => 5, :prog => 0, :tools => 3, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?

  		# tools below 1
  		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 0, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?

  		# comm below 1
  		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 0}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?

  		# exp over 5
  		testManager = Manager.new({:exp => 6, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?

  		# prog over 5
  		testManager = Manager.new({:exp => 5, :prog => 6, :tools => 3, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?

  		# tools over 5
  		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 6, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?

  		# comm over 5
  		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 6}, 
				{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
  		deny testManager.valid?
  	end

  	# tests that a manager has to have a preference hash with exp, prog, tools, and comm values
  	def test_pref_hash_complete
  		# test without exp
			testManager = Manager.new({:prog => 2, :tools => 3, :comm => 2}, 
					{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
			deny testManager.valid?

			# test without prog
			testManager = Manager.new({:exp => 5, :tools => 3, :comm => 2}, 
					{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
			deny testManager.valid?

			# test without tools
			testManager = Manager.new({:exp => 5, :prog => 2, :comm => 2}, 
					{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
			deny testManager.valid?

			# test without comm
			testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3}, 
					{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
			deny testManager.valid?
  	end

  	# tests to ensure that managers have to have all of the required hash keys
  	# [ynot, znot, xnot, wnot]
  	def test_weight_hash_complete
		# xnot must be presenet
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:ynot => 0.3, :znot => 0.3, :wnot => 0.4}, "prof h")
		deny testManager.valid?
		# ynot must be presenet
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.4, :znot => 0.3, :wnot => 0.3}, "prof h")
		deny testManager.valid?
		# znot must be presenet
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.4, :ynot => 0.3, :wnot => 0.3}, "prof h")
		deny testManager.valid?
		# wnot must be presenet
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.4, :ynot => 0.3, :znot => 0.3}, "prof h")
		deny testManager.valid?
	end

	# tests that the weights passed in are greater than 0
	# checking that they are above 1 will violate a check that will be tested next
	def test_valid_weights
		# xnot below zero
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => -0.55, :ynot => 0.55, :znot => 0.5, :wnot => 0.5}, "prof h")
		deny testManager.valid?
	# ynot below 0
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.55, :ynot => -0.55, :znot => 0.5, :wnot => 0.5}, "prof h")
		deny testManager.valid?
	# znot below 0
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
		deny testManager.valid?
	# wnot below 0
		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0.55, :ynot => 0.5, :znot => 0.5, :wnot => -0.55}, "prof h")
		deny testManager.valid?
	end

	# testing that the epsilon function is a + or - 10 % of the passed in value
	# testing many times because of the randomness
	def test_eps
		@m = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
					{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
		eps1 = @m.eps(0.10)
		eps2 = @m.eps(0.20)
		eps3 = @m.eps(0.30)
		eps4 = @m.eps(0.40)
		eps5 = @m.eps(0.50)
		eps6 = @m.eps(0.60)
		eps7 = @m.eps(0.70)
		eps8 = @m.eps(0.80)
		eps9 = @m.eps(0.90)
		assert -0.01 <= eps1 && eps1 <= 0.01, "epsilon function failed, expected to be between -0.01 and 0.01 but was #{eps1}"
		assert -0.02 <= eps2 && eps2 <= 0.02, "epsilon function failed, expected to be between -0.02 and 0.02 but was #{eps2}"
		assert -0.03 <= eps3 && eps3 <= 0.03, "epsilon function failed, expected to be between -0.03 and 0.03 but was #{eps3}"
		assert -0.04 <= eps4 && eps4 <= 0.04, "epsilon function failed, expected to be between -0.04 and 0.04 but was #{eps4}"
		assert -0.05 <= eps5 && eps5 <= 0.05, "epsilon function failed, expected to be between -0.05 and 0.05 but was #{eps5}"
		assert -0.06 <= eps6 && eps6 <= 0.06, "epsilon function failed, expected to be between -0.06 and 0.06 but was #{eps6}"
		assert -0.07 <= eps7 && eps7 <= 0.07, "epsilon function failed, expected to be between -0.07 and 0.07 but was #{eps7}"
		assert -0.08 <= eps8 && eps8 <= 0.08, "epsilon function failed, expected to be between -0.08 and 0.08 but was #{eps8}"
		assert -0.09 <= eps9 && eps9 <= 0.09, "epsilon function failed, expected to be between -0.09 and 0.09 but was #{eps9}"
	end

	# tests to see if weights are positive or zero, can not be negative
	def test_weights_positive_or_zero
		# tests 10 times for each, testing 0 three times each loop as well 
		10.times do
			testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 1, :ynot => 0, :znot => 0, :wnot => 0}, "prof h")
			deny testManager1.pref_weights[:exp] > 1, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
			deny testManager1.pref_weights[:prog] < 0, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
			deny testManager1.pref_weights[:tools] < 0, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
			deny testManager1.pref_weights[:comm] < 0, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
		end
		10.times do
			testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0, :ynot => 1, :znot => 0, :wnot => 0}, "prof h")
			deny testManager1.pref_weights[:exp] < 0, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
			deny testManager1.pref_weights[:prog] > 1, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
			deny testManager1.pref_weights[:tools] < 0, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
			deny testManager1.pref_weights[:comm] < 0, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
		end
		10.times do
			testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0, :ynot => 0, :znot => 1, :wnot => 0}, "prof h")
			deny testManager1.pref_weights[:exp] < 0, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
			deny testManager1.pref_weights[:prog] < 0, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
			deny testManager1.pref_weights[:tools] > 1, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
			deny testManager1.pref_weights[:comm] < 0, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
		end
		10.times do
			testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
				{:xnot => 0, :ynot => 0, :znot => 0, :wnot => 1}, "prof h")
			deny testManager1.pref_weights[:exp] < 0, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
			deny testManager1.pref_weights[:prog] < 0, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
			deny testManager1.pref_weights[:tools] < 0, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
			deny testManager1.pref_weights[:comm] > 1, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
		end
	end

	# tests the default choose method
	def test_choose_default
		@m = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
					{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
		# @m's preferences are :exp => 5, :prog => 2, :tools => 3, :comm => 2
		test_e_1 = Engineer.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2},  "1")
		test_e_2 = Engineer.new({:exp => 1, :prog => 1, :tools => 1, :comm => 1},  "2")
		test_e_3 = Engineer.new({:exp => 2, :prog => 2, :tools => 2, :comm => 2},  "3")
		test_eng_bundle = [test_e_1, test_e_2, test_e_3]
		assert @m.choose_engineers(test_eng_bundle) == test_e_1, "Expected to get #{test_e_1.name} but got #{@m.choose_engineers(test_eng_bundle).name}"
		# for this method, overqualification does not effect choice, should still get 1
		test_e_2 = Engineer.new({:exp => 5, :prog => 5, :tools => 2, :comm => 5},  "2")
		test_eng_bundle = [test_e_1, test_e_2, test_e_3]
		assert @m.choose_engineers(test_eng_bundle) == test_e_1, "Expected to get #{test_e_1.name} but got #{@m.choose_engineers(test_eng_bundle).name}"
		test_e_2 = Engineer.new({:exp => 5, :prog => 5, :tools => 5, :comm => 5},  "2")
		# but if everything is over it will be exact and will be picked
		test_eng_bundle = [test_e_1, test_e_2, test_e_3]
		assert @m.choose_engineers(test_eng_bundle) == test_e_1, "Expected to get #{test_e_2.name} but got #{@m.choose_engineers(test_eng_bundle).name}"
	end


	private
	# Prof. H's deny method to improve readability of tests
  	def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  	end
end


# # poor man's assert method, should probably use unit tests later?
# def assert(exp, message = "assertion failed")
# 	raise Exception.new(message) unless exp
# end

# # deny method for readability
# def deny(exp, message = "assertion failed")
# 	assert !exp, message
# end

# # assert_equal function
# # the assert and assert_equal functions are available in the unit test module, if we want to use that
# def assert_equal(exp1, exp2, message = "assertion failed")
# 	assert exp1.eql?(exp2), "#{exp1} was expected, result was #{exp2}"
# end

# testing for invalid input
# checking manager preferences
#def check_valid_preferences
	# exp below 1
	# begin
	# 	testManager = Manager.new({:exp => 0, :prog => 2, :tools => 3, :comm => 2}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "exp preferences test passed"
	# end

	# # prog below 1
	# begin

	# 	testManager = Manager.new({:exp => 5, :prog => 0, :tools => 3, :comm => 2}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "prog preferences test passed"
	#  end

	# tools below 1
	# begin
	# 	testManager = Manager.new({:exp => 5, :prog => 2, :tools => 0, :comm => 2}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "tools preferences test passed"
	# end

	# comm below 1
	# begin
	# 	testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 0}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "comm preferences test passed"
	# end

	# exp above 5
	# begin
	# 	testManager = Manager.new({:exp => 6, :prog => 2, :tools => 3, :comm => 2}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "exp preferences test passed"
	# end

	# prog above 5
	# begin
	# 	testManager = Manager.new({:exp => 5, :prog => 6, :tools => 3, :comm => 2}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "prog preferences test passed"
	# end

	# tools above 5
	# begin
	# 	testManager = Manager.new({:exp => 5, :prog => 2, :tools => 6, :comm => 2}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "tools preferences test passed"
	# end

	# comm above 5
	# begin
	# 	testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 6}, 
	# 			{:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
	# 	puts "TEST FAILED - the manager's preferences must be between 1 and 5"
	# rescue Exception => e
	# 	puts "comm preferences test passed"
	# end
#end

# def check_sum_add_up
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 					{:xnot => 0.65, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
# 		puts "TEST FAILED - the manager's weights must add up to 1"
# 	rescue Exception => e
# 		puts "sum test passed"
# 	end
# end

# # checking that weights can't be negative. Would check to see if they go above 1 but 
# # that'll be caught by the sum check above. We may need to change this later
# def check_valid_weights
# 	# xnot below 0
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => -0.55, :ynot => 0.55, :znot => 0.5, :wnot => 0.5}, "prof h")
# 		puts "TEST FAILED - the manager's weights must be between 0 and 1 and add to 1"
# 	rescue Exception => e
# 		puts "exp weight test passed"
# 	end
# 	# ynot below 0
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.55, :ynot => -0.55, :znot => 0.5, :wnot => 0.5}, "prof h")
# 		puts "TEST FAILED - the manager's weights must be between 0 and 1 and add to 1"
# 	rescue Exception => e
# 		puts "exp weight test passed"
# 	end
# 	# znot below 0
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
# 		puts "TEST FAILED - the manager's weights must be between 0 and 1 and add to 1"
# 	rescue Exception => e
# 		puts "exp weight test passed"
# 	end
# 	# wnot below 0
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.55, :ynot => 0.5, :znot => 0.5, :wnot => -0.55}, "prof h")
# 		puts "TEST FAILED - the manager's weights must be between 0 and 1 and add to 1"
# 	rescue Exception => e
# 		puts "exp weight test passed"
# 	end
# end

# def check_prefs_hash_complete
# 	# test without exp
# 	begin
# 		testManager = Manager.new({:prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
# 		puts "TEST FAILED - the manager's preferences must include :exp"
# 	rescue Exception => e
# 		puts "exp presence test passed"
# 	end
# 	# test without prog
# 	begin
# 		testManager = Manager.new({:exp => 5, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
# 		puts "TEST FAILED - the manager's preferences must include :prog"
# 	rescue Exception => e
# 		puts "prog presence test passed"
# 	end
# 	# test without tools
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :comm => 2}, 
# 				{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
# 		puts "TEST FAILED - the manager's preferences must include :tools"
# 	rescue Exception => e
# 		puts "tools presence test passed"
# 	end
# 	# test without comm
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3}, 
# 				{:xnot => 0.55, :ynot => 0.5, :znot => -0.55, :wnot => 0.5}, "prof h")
# 		puts "TEST FAILED - the manager's preferences must include :comm"
# 	rescue Exception => e
# 		puts "comm presence test passed"
# 	end
# end

# def check_weight_hash_complete
# 	# xnot must be presenet
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:ynot => 0.3, :znot => 0.3, :wnot => 0.4}, "prof h")
# 		puts "TEST FAILED - the manager's weights must include :xnot"
# 	rescue Exception => e
# 		puts "xnot weight presence test passed"
# 	end
# 	# ynot must be presenet
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.4, :znot => 0.3, :wnot => 0.3}, "prof h")
# 		puts "TEST FAILED - the manager's weights must include :ynot"
# 	rescue Exception => e
# 		puts "ynot weight presence test passed"
# 	end
# 	# znot must be presenet
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.4, :ynot => 0.3, :wnot => 0.3}, "prof h")
# 		puts "TEST FAILED - the manager's weights must include :znot"
# 	rescue Exception => e
# 		puts "znot weight presence test passed"
# 	end
# 	# wnot must be presenet
# 	begin
# 		testManager = Manager.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2}, 
# 				{:xnot => 0.4, :ynot => 0.3, :znot => 0.3}, "prof h")
# 		puts "TEST FAILED - the manager's weights must include :wnot"
# 	rescue Exception => e
# 		puts "wnot weight presence test passed"
# 	end
# end

# def check_engineer_skills_range
# 	# exp not below 1
# 	begin
# 		testEngineer = Engineer.new({:exp => 0, :prog => 1, :tools => 5, :comm => 3},  "1")
# 		puts "TEST FAILED - the engineer must have an :exp skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer exp test passed"
# 	end
# 	# prog not below 1
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 0, :tools => 5, :comm => 3},  "1")
# 		puts "TEST FAILED - the engineer must have a :prog skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer prog test passed"
# 	end
# 	# tools not below 1
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 1, :tools => 0, :comm => 3},  "1")
# 		puts "TEST FAILED - the engineer must have a :tools skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer tools test passed"
# 	end
# 	# comm not below 1
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 0},  "1")
# 		puts "TEST FAILED - the engineer must have a :comm skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer comm test passed"
# 	end
# 		# exp not above 5
# 	begin
# 		testEngineer = Engineer.new({:exp => 6, :prog => 1, :tools => 5, :comm => 3},  "1")
# 		puts "TEST FAILED - the engineer must have an :exp skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer exp test passed"
# 	end
# 	# prog not above 5
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 6, :tools => 5, :comm => 3},  "1")
# 		puts "TEST FAILED - the engineer must have a :prog skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer prog test passed"
# 	end
# 	# tools not above 5
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 1, :tools => 6, :comm => 3},  "1")
# 		puts "TEST FAILED - the engineer must have a :tools skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer tools test passed"
# 	end
# 	# comm not above 5
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 6},  "1")
# 		puts "TEST FAILED - the engineer must have a :comm skill value between 1 and 5"
# 	rescue Exception => e
# 		puts "engineer comm test passed"
# 	end
# end

# def check_engineer_skill_presence
# 	# exp present
# 	begin
# 		testEngineer = Engineer.new({:prog => 1, :tools => 5, :comm => 6},  "1")
# 		puts "TEST FAILED - the engineer must have an :exp skill value present"
# 	rescue Exception => e
# 		puts "engineer exp presence test passed"
# 	end
# 	# prog present
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :tools => 5, :comm => 6},  "1")
# 		puts "TEST FAILED - the engineer must have a :prog skill value present"
# 	rescue Exception => e
# 		puts "engineer prog presence test passed"
# 	end
# 	# tools present
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 1, :comm => 6},  "1")
# 		puts "TEST FAILED - the engineer must have a :tools skill value present"
# 	rescue Exception => e
# 		puts "engineer tools presence test passed"
# 	end
# 	# comm present
# 	begin
# 		testEngineer = Engineer.new({:exp => 1, :prog => 1, :tools => 5},  "1")
# 		puts "TEST FAILED - the engineer must have a :comm skill value present"
# 	rescue Exception => e
# 		puts "engineer comm presence test passed"
# 	end
# end

# def check_eps
# 	eps1 = @m.eps(0.10)
# 	eps2 = @m.eps(0.20)
# 	eps3 = @m.eps(0.30)
# 	eps4 = @m.eps(0.40)
# 	eps5 = @m.eps(0.50)
# 	eps6 = @m.eps(0.60)
# 	eps7 = @m.eps(0.70)
# 	eps8 = @m.eps(0.80)
# 	eps9 = @m.eps(0.90)
# 	assert -0.01 <= eps1 && eps1 <= 0.01, "epsilon function failed, expected to be between -0.01 and 0.01 but was #{eps1}"
# 	assert -0.02 <= eps2 && eps2 <= 0.02, "epsilon function failed, expected to be between -0.02 and 0.02 but was #{eps2}"
# 	assert -0.03 <= eps3 && eps3 <= 0.03, "epsilon function failed, expected to be between -0.03 and 0.03 but was #{eps3}"
# 	assert -0.04 <= eps4 && eps4 <= 0.04, "epsilon function failed, expected to be between -0.04 and 0.04 but was #{eps4}"
# 	assert -0.05 <= eps5 && eps5 <= 0.05, "epsilon function failed, expected to be between -0.05 and 0.05 but was #{eps5}"
# 	assert -0.06 <= eps6 && eps6 <= 0.06, "epsilon function failed, expected to be between -0.06 and 0.06 but was #{eps6}"
# 	assert -0.07 <= eps7 && eps7 <= 0.07, "epsilon function failed, expected to be between -0.07 and 0.07 but was #{eps7}"
# 	assert -0.08 <= eps8 && eps8 <= 0.08, "epsilon function failed, expected to be between -0.08 and 0.08 but was #{eps8}"
# 	assert -0.09 <= eps9 && eps9 <= 0.09, "epsilon function failed, expected to be between -0.09 and 0.09 but was #{eps9}"
# 	puts "eps tests passed"
# end

# checks to see if weights are positive or zero, can not be negative
# def check_weights_positive_or_zero
# 	# tests 10 times for each, testing 0 three times each loop as well 
# 	10.times do
# 		testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
# 			{:xnot => 1, :ynot => 0, :znot => 0, :wnot => 0}, "prof h")
# 		deny testManager1.pref_weights[:exp] > 1, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
# 		deny testManager1.pref_weights[:prog] < 0, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
# 		deny testManager1.pref_weights[:tools] < 0, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
# 		deny testManager1.pref_weights[:comm] < 0, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
# 	end
# 	puts "exp passed"
# 	10.times do
# 		testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
# 			{:xnot => 0, :ynot => 1, :znot => 0, :wnot => 0}, "prof h")
# 		deny testManager1.pref_weights[:exp] < 0, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
# 		deny testManager1.pref_weights[:prog] > 1, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
# 		deny testManager1.pref_weights[:tools] < 0, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
# 		deny testManager1.pref_weights[:comm] < 0, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
# 	end
# 	puts "prog passed"
# 	10.times do
# 		testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
# 			{:xnot => 0, :ynot => 0, :znot => 1, :wnot => 0}, "prof h")
# 		deny testManager1.pref_weights[:exp] < 0, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
# 		deny testManager1.pref_weights[:prog] < 0, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
# 		deny testManager1.pref_weights[:tools] > 1, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
# 		deny testManager1.pref_weights[:comm] < 0, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
# 	end
# 	puts "tools passed"
# 	10.times do
# 		testManager1 = Manager.new({:exp => 1, :prog => 2, :tools => 3, :comm => 2}, 
# 			{:xnot => 0, :ynot => 0, :znot => 0, :wnot => 1}, "prof h")
# 		deny testManager1.pref_weights[:exp] < 0, "exp weight should be between 0 and 1 but is #{testManager1.pref_weights[:exp]} "
# 		deny testManager1.pref_weights[:prog] < 0, "prog weight should be between 0 and 1 but is #{testManager1.pref_weights[:prog]} "
# 		deny testManager1.pref_weights[:tools] < 0, "tools weight should be between 0 and 1 but is #{testManager1.pref_weights[:tools]} "
# 		deny testManager1.pref_weights[:comm] > 1, "comm weight should be between 0 and 1 but is #{testManager1.pref_weights[:comm]} "
# 	end
# 	puts "comm passed"
# end

# def test_choose_default
# 	# @m's preferences are :exp => 5, :prog => 2, :tools => 3, :comm => 2
# 	test_e_1 = Engineer.new({:exp => 5, :prog => 2, :tools => 3, :comm => 2},  "1")
# 	test_e_2 = Engineer.new({:exp => 1, :prog => 1, :tools => 1, :comm => 1},  "2")
# 	test_e_3 = Engineer.new({:exp => 2, :prog => 2, :tools => 2, :comm => 2},  "3")
# 	test_eng_bundle = [test_e_1, test_e_2, test_e_3]
# 	assert @m.choose_engineers(test_eng_bundle) == test_e_1, "Expected to get #{test_e_1.name} but got #{@m.choose_engineers(test_eng_bundle).name}"
# 	# for this method, overqualification does not effect choice, should still get 1
# 	test_e_2 = Engineer.new({:exp => 5, :prog => 5, :tools => 2, :comm => 5},  "2")
# 	test_eng_bundle = [test_e_1, test_e_2, test_e_3]
# 	assert @m.choose_engineers(test_eng_bundle) == test_e_1, "Expected to get #{test_e_1.name} but got #{@m.choose_engineers(test_eng_bundle).name}"
# 	test_e_2 = Engineer.new({:exp => 5, :prog => 5, :tools => 5, :comm => 5},  "2")
# 	# but if everything is over it will be exact and will be picked
# 	test_eng_bundle = [test_e_1, test_e_2, test_e_3]
# 	assert @m.choose_engineers(test_eng_bundle) == test_e_1, "Expected to get #{test_e_2.name} but got #{@m.choose_engineers(test_eng_bundle).name}"
# end

# check_manager
# check_engineer_names
# check_engineer_exp
# check_engineer_prog
# check_engineer_tools
# check_engineer_comm
# check_valid_preferences
# check_sum_add_up
# check_valid_weights
# check_prefs_hash_complete
# check_weight_hash_complete
# check_engineer_skills_range
# check_engineer_skill_presence
# check_eps
# check_weights_positive_or_zero
# test_choose_default

# puts "=============================================="
# puts "looking at choice methods. These are not tests"
# puts "=============================================="

# puts "looking at the choose_engineers method"
# puts @m.choose_engineers(eng_bundle_1).skills

# puts "looking at the choose method"
# puts @m.min_sos(@e1.skills, @e2.skills, @e3.skills)

# puts "looking at the linear difference method"
# puts @m.choose_engineers_linear(eng_bundle_1).skills

# puts "looking at the weighted difference method"
# puts @m.choose_engineers_weighted(eng_bundle_1).skills

# puts "looking at the exponential difference method"
# puts @m.choose_engineers_exponential(eng_bundle_1).skills