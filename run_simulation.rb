require_relative 'engineer.rb'
require_relative 'manager.rb'

# managers
@m1 = Manager.new({:exp => 5, :prog => 3, :tools => 3, :comm => 3}, 
				  {:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof h")
@m2 = Manager.new({:exp => 5, :prog => 4, :tools => 1, :comm => 1}, 
				  {:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof i")
@m3 = Manager.new({:exp => 4, :prog => 4, :tools => 4, :comm => 5}, 
				  {:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof j")
@m4 = Manager.new({:exp => 4, :prog => 2, :tools => 2, :comm => 1}, 
				  {:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof k")
@m5 = Manager.new({:exp => 5, :prog => 3, :tools => 1, :comm => 1}, 
				  {:xnot => 0.55, :ynot => 0.15, :znot => 0.15, :wnot => 0.15}, "prof l")

man_arr = [@m1, @m2, @m3, @m4, @m5]

# engineers
@e1 =  Engineer.new({:exp => 1, :prog => 1, :tools => 5, :comm => 3},  "1")
@e2 =  Engineer.new({:exp => 5, :prog => 1, :tools => 4, :comm => 4},  "2")
@e3 =  Engineer.new({:exp => 5, :prog => 4, :tools => 1, :comm => 5},  "3")
@e4 =  Engineer.new({:exp => 2, :prog => 2, :tools => 1, :comm => 4},  "4")
@e5 =  Engineer.new({:exp => 1, :prog => 2, :tools => 4, :comm => 5},  "5")
@e6 =  Engineer.new({:exp => 5, :prog => 3, :tools => 3, :comm => 3},  "6")
@e7 =  Engineer.new({:exp => 3, :prog => 4, :tools => 5, :comm => 4},  "7")
@e8 =  Engineer.new({:exp => 4, :prog => 4, :tools => 3, :comm => 1},  "8")
@e9 =  Engineer.new({:exp => 5, :prog => 5, :tools => 5, :comm => 1},  "9")
@e10 = Engineer.new({:exp => 1, :prog => 3, :tools => 3, :comm => 4},  "10")
@e11 = Engineer.new({:exp => 4, :prog => 5, :tools => 2, :comm => 5},  "11")
@e12 = Engineer.new({:exp => 2, :prog => 3, :tools => 5, :comm => 5},  "12")
@e13 = Engineer.new({:exp => 2, :prog => 4, :tools => 2, :comm => 2},  "13")
@e14 = Engineer.new({:exp => 3, :prog => 3, :tools => 2, :comm => 1},  "14")
@e15 = Engineer.new({:exp => 2, :prog => 5, :tools => 4, :comm => 3},  "15")
@e16 = Engineer.new({:exp => 3, :prog => 1, :tools => 3, :comm => 2},  "16")
@e17 = Engineer.new({:exp => 4, :prog => 3, :tools => 1, :comm => 2},  "17")

# bundles
eng_bundle_1  = [@e11,	@e12,  @e10]
eng_bundle_2  = [@e3,	@e2,  @e1]
eng_bundle_3  = [@e15,	@e14,  @e13]
eng_bundle_4  = [@e9,	@e7,  @e8]
eng_bundle_5  = [@e6,	@e5,  @e4]
eng_bundle_6  = [@e1,	@e10,  @e6]
eng_bundle_7  = [@e4,	@e3,  @e7]
eng_bundle_8  = [@e11,	@e13,  @e17]
eng_bundle_9  = [@e2,	@e9,  @e5]
eng_bundle_10 = [@e14,	@e15,  @e16]
eng_bundle_11 = [@e9,	@e6,  @e12]
eng_bundle_12 = [@e10,	@e7,  @e2]
eng_bundle_13 = [@e5,	@e8,  @e3]
eng_bundle_14 = [@e16,	@e11,  @e15]
eng_bundle_15 = [@e13,	@e1,  @e4]
eng_bundle_16 = [@e12,	@e17,  @e14]
eng_bundle_17 = [@e8,	@e2,  @e6]
eng_bundle_18 = [@e7,	@e1,  @e5]
eng_bundle_19 = [@e10,	@e4,  @e9]
eng_bundle_20 = [@e17,	@e16,  @e3]

choice_arr =[ eng_bundle_1,
			 eng_bundle_2,
			 eng_bundle_3,
			 eng_bundle_4,
			 eng_bundle_5,
			 eng_bundle_6,
			 eng_bundle_7,
			 eng_bundle_8,
			 eng_bundle_9,
			 eng_bundle_10,
			 eng_bundle_11,
			 eng_bundle_12,
			 eng_bundle_13,
			 eng_bundle_14,
			 eng_bundle_15,
			 eng_bundle_16,
			 eng_bundle_17,
			 eng_bundle_18,
			 eng_bundle_19,
			 eng_bundle_20 ]

choice_arr.each do |choice|
	man_arr.each do |manager|
		manager.choose_engineers(choice)
	end
	output = File.open('output.csv', 'a')
	output.write "\n"
	output.close
end



