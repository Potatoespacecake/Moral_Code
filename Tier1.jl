#Tier1
using Tables, TypedTables, DataFrames

#Colour dictionary for Black, White
colour_dictTier1 = Dict([("Black", 0), ("White", 1)])

#Inverse colour dictionary for Black, White
invcolour_dictTier1 = Dict(colour_dictTier1[k] => k for k in keys(colour_dictTier1))

#The Table containing colours (from within the colour dictionary), paired with a symbol, and a number (mod(7))
colourtableTier1 = DataFrame(name = ["Black","White"], sname = ['B', 'W'],  number = [0, 1])

#Colour set tier 1 single elements
cs_e1 = Set(["Black", "White"])

# Black = True, Undefined, False
#White = True, subset_Undefined

#Colour set tier 1 double elements
cs_low = Set(["Black", "Black_White", "White"])
cs_high = Set(["White_Black"])
cs_e2 = union(cs_low, cs_high)

#BuildSets
Black_b_t1 = Set(["Black", "Black_White", "White_Black"])
White_b_t1 = Set(["Black_White", "White", "White_Black"])

function chooset1(x, y)
	z = cs_low #Note we have set this to left visually 

		if x == "Black" 
			n = 0
		elseif x == "White"
			n = 1
		end
		
		if y == "Black"
			m = 0
		elseif y == "White"
			m = 1
		end
	
		if n > m
			z = cs_high
		end
	return z
	end

function Groupt1(x::String, y::String)
	return Set([x,y])
	end
	
function pairt1(x,y)
	a = Groupt1(x,y)
	b = chooset1(x,y)
		if x == "Black" 
			n = Black_b_t1
		elseif x == "White"
			n = White_b_t1
		end
		
		if y == "Black"
			m = Black_b_t1
		elseif y == "White"
			m = White_b_t1
		end
	c = intersect(n, m)
	return Set[Groupt1(x,y), intersect(intersect(n,m), chooset1(x,y))]
	end
	
function directiont1(x,y)
	a = chooset1(x,y)
	if a == cs_low
		b = "low"
	elseif a == cs_high
		b = "high"
	end
	return b
end	
	
function Buildtablet1(x,y)
a = pairt1(x,y)
a2 = a[2]
a3 = collect(a[2])
a4 = a3[1]
#Did this originate from low energy or high energy?
b = chooset1(x,y)
	if b == cs_low
		c = "low"
		f = "clock"
		argf = "anti"
	elseif b == cs_high
		c = "high"
		f = "anti"
		argf = "clock"
	else  @error "<Invalid Entries>"
	end 

	if x == y
	a4 = a4*'_'*a4
	end

df = DataFrame(first = [x], second =[y], pair_name = [a4], low_or_high =[c])

adaptor1 = DataFrame(name = [x, y])
adaptor2 = leftjoin(adaptor1, colourtableTier1, on = :name)

xs = adaptor2.sname[1]
ys = adaptor2.sname[2]

return DataFrame(first = [x], sname1 = [xs], second =[y], sname2 = [ys], pair_name = [a4], pair_sname = [xs*ys], low_or_high = [c], rotation = [f], argand_rotation = [argf], inversion = ["no"])
end


#Build Tier1 DataFrame for components
function Tier1_Buildtablet1(colourtableTier1)
	a = Buildtablet1("Black", "Black")
	b = Buildtablet1("Black", "White")
	c = Buildtablet1("White", "White")
	d = Buildtablet1("White", "Black")
	t = append!(a,b)
	t = append!(t,c)
	t = append!(t,d)
	return t
	end
##---------------------------------------------------------------	
#Defining Inversion Tier 1 DataFrame for components - low --> high, high --> low ; anti --> clock, clock --> anti
#***Note; Inversion requires 're-inverting' before response
function invBuildtablet1(x,y)
a = pairt1(x,y)
a2 = a[2]
a3 = collect(a[2])
a4 = a3[1]
#Did this originate from low energy or high energy?
b = chooset1(x,y)
	if b == cs_low
		c = "high"
		f = "anti"
		argf = "clock"
	elseif b == cs_high
		c = "low"
		f = "clock"
		argf = "anti"
	else  @error "<Invalid Entries>"
	end 
	
	if x == y
	a4 = a4*'_'*a4
	end

df = DataFrame(first = [x], second =[y], pair_name = [a4], low_or_high =[c])

adaptor1 = DataFrame(name = [x, y])
adaptor2 = leftjoin(adaptor1, colourtableTier1, on = :name)

xs = adaptor2.sname[1]
ys = adaptor2.sname[2]

return DataFrame(first = [x], sname1 = [xs], second =[y], sname2 = [ys], pair_name = [a4], pair_sname = [xs*ys], low_or_high = [c], rotation = [f], argand_rotation = [argf], inversion = ["yes"])
end

#Build Tier1 DataFrame for components
function Tier1_invBuildtable(colourtableTier1)
	a = invBuildtablet1("Black", "Black")
	b = invBuildtablet1("Black", "White")
	c = invBuildtablet1("White", "White")
	d = invBuildtablet1("White", "Black")
	t = append!(a,b)
	t = append!(t,c)
	t = append!(t,d)
	return t
	end

