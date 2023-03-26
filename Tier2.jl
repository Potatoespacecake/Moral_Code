#Colour dictionary for Black, Red, Orange, Yellow, White, Green, Blue, Purple
colour_dictTier2 = Dict([("Black", 0), ("Red", 1), ("Yellow", 2), ("White", 3), ("Blue", 4)])

#Inverse colour dictionary for Black, Red, Yellow, White, Blue
invcolour_dictTier2 = Dict(colour_dictTier2[k] => k for k in keys(colour_dictTier2))

#The Table containing colours (from within the colour dictionary), paired with a symbol, and a number (mod(7))
colourtableTier2 = DataFrame(name = ["Black", "Red", "Yellow", "White", "Blue"], sname = ['B', 'R', 'Y', 'W', 'I'],  number = [0, 1, 2, 3, 4])

#Modelling from polar plotting r = Cos(3[theta])
colour_Black = "im axis"
colour_White = "re axis"
colour_Red_clock = ("cos(3*theta)", "(1/3)*pi", "(3/3)*pi")
colour_Blue_clock = ("cos(3*theta)", "(3/3)*pi", "(5/3)*pi")
Colour_Yellow = ("cos(3*theta)", "(5/3)*pi", "(1/3)*pi")

#colourTier2IdealDub_clock

#colourTier2IdealDub_anti

#formation Red, Yellow, Blue
colourTier2IdealTrio_clock = DataFrame(name = ["Black", "Red", "Yellow", "White", "Blue"], relation = ["im", "cos(3*theta)", "cos(3*theta)", "re", "cos(3*theta)"], ang_lower = ["n/a", "(1/3)*pi", "(5/3)*pi", "n/a", "(3/3)*pi"], ang_upper = ["n/a", "(3/3)*pi", "(1/3)*pi", "n/a", "(5/3)*pi"], rotation = ["n/a", "clock", "clock", "n/a", "clock"], argand_rotation = ["n/a", "anti", "anti", "n/a", "anti"])

#formation Red, Yellow, Blue
colourTier2IdealTrio_anti = DataFrame(name = ["Black", "Red", "Yellow", "White", "Blue"], relation = ["im", "cos(3*theta)", "cos(3*theta)", "re", "cos(3*theta)"], ang_lower = ["n/a", "(3/3)*pi", "(5/3)*pi", "n/a", "(1/3)*pi"], ang_upper = ["n/a", "(5/3)*pi", "(1/3)*pi", "n/a", "(3/3)*pi"], rotation = ["n/a", "anti", "anti", "n/a", "anti"], argand_rotation = ["n/a", "clock", "clock","n/a", "clock"])



##---------------------------------------------
#Inversion for colourTier2Ideas
#addressed for introduction of horizontal and vertical polarisations of colour
#map by colourTier2Ideals_clock / colourTier2Ideals_anti via (? ) (rotation of phi = pi/2 argand_rotation clock, reflection along y = -y; or rotation of phi = -pi/2) + tier 1 changes.

invcolour_Black = "re axis"
invcolour_White = "-im axis"
invcolour_Red_anti = ("sin(3*theta)", "(0/3)*pi", "(2/3)*pi")
invColour_Yellow = ("sin(3*theta)", "(4/3)*pi", "(6/3)*pi")
invcolour_Blue_anti = ("sin(3*theta)", "(2/3)*pi", "(4/3)*pi")

#formation Red, Yellow, Blue
invcolourTier2IdealTrio_clock = DataFrame(name = ["Black", "Red", "Yellow", "White", "Blue"], relation = ["-re", "sin(3*theta)", "sin(3*theta)", "-im", "sin(3*theta)"], ang_lower = ["n/a", "(2/3)*pi", "(4/3)*pi", "n/a", "(0/3)*pi"], ang_upper = ["n/a", "(4/3)*pi", "(6/3)*pi", "n/a", "(4/3)*pi"], rotation = ["n/a", "clock", "clock", "n/a", "clock"], argand_rotation = ["n/a", "anti", "anti", "n/a", "anti"])

#formation Red, Yellow, Blue
invcolourTier2IdealTrio_anti = DataFrame(name = ["Black", "Red", "Yellow", "White", "Blue"], relation = ["-re", "sin(3*theta)", "sin(3*theta)", "-im", "sin(3*theta)"], ang_lower = ["n/a", "(0/3)*pi", "(4/3)*pi", "n/a", "(2/3)*pi"], ang_upper = ["n/a", "(2/3)*pi", "(6/3)*pi", "n/a", "(4/3)*pi"], rotation = ["n/a", "anti", "anti", "n/a", "anti"], argand_rotation = ["n/a", "clock", "clock","n/a", "clock"])

##---------------------------------------------

cs2_low = Set(["Black", "Black_Red", "Black_Yellow", "Black_White", "Black_Blue", "Red", "Red_Yellow", "Red_White", "Red_Blue", "Yellow", "Yellow_White", "Yellow_Blue", "White", "White_Blue", "Blue"])

cs2_high = Set(["Blue_White", "Blue_Yellow", "Blue_Red", "Blue_Black", "White_Yellow", "White_Red", "White_Black", "Yellow_Red", "Yellow_Black", "Red_Black"])

Blackbuildset_t2 = Set(["Black", "Black_Red", "Black_Yellow", "Black_White", "Black_Blue", "Blue_Black", "White_Black", "Yellow_Black", "Red_Black"])

Redbuildset_t2 = Set(["Black_Red", "Red", "Red_Yellow", "Red_White", "Red_Blue", "Blue_Red", "White_Red", "Yellow_Red", "Red_Black"])

Yellowbuildset_t2 = Set(["Black_Yellow", "Red_Yellow", "Yellow", "Yellow_White", "Yellow_Blue", "Blue_Yellow", "White_Yellow", "Yellow_Red", "Yellow_Black"])

Whitebuildset_t2 = Set(["Black_White", "Red_White", "Yellow_White", "White", "White_Blue", "Blue_White", "White_Yellow", "White_Red", "White_Black"])

Bluebuildset_t2 = Set(["Black_Blue", "Red_Blue", "Yellow_Blue", "White_Blue", "Blue", "Blue_White", "Blue_Yellow", "Blue_Red", "Blue_Black"])



function chooset2(x, y)
	z = cs2_low #Note we have set this to left,top visually 

	if x == "Black" 
			n = 0
		elseif x == "Red"
			n = 1
		elseif x == "Yellow"
			n = 2
		elseif x == "White"
			n = 3
		elseif x == "Blue"
			n = 4
		end
		
		if y == "Black"
			m = 0
		elseif y == "Red"
			m = 1
		elseif y == "Yellow"
			m = 2
		elseif y == "White"
			m = 3
		elseif y == "Blue"
			m = 4
		end
		
		if n > m
			z = cs2_high
		end
	
	return z
	end

function Groupt2(x::String, y::String)
	return Set([x,y])
	end
	
function pairt2(x,y)
	a = Groupt2(x,y)
	b = chooset2(x,y)
	
	if x == "Black" 
			n = Blackbuildset_t2
		elseif x == "Red"
			n = Redbuildset_t2
		elseif x == "Yellow"
			n = Yellowbuildset_t2
		elseif x == "White"
			n = Whitebuildset_t2
		elseif x == "Blue"
			n = Bluebuildset_t2
		end
		
		if y == "Black"
			m = Blackbuildset_t2
		elseif y == "Red"
			m = Redbuildset_t2
		elseif y == "Yellow"
			m = Yellowbuildset_t2
		elseif y == "White"
			m = Whitebuildset_t2
		elseif y == "Blue"
			m = Bluebuildset_t2
		end
	c = intersect(n, m)
	return Set[Groupt2(x,y), intersect(intersect(n,m), chooset2(x,y))]
	end
	
function directiont2(x,y)
	a = chooset2(x,y)
	if a == cs2_low
		b = "low"
	elseif a == cs2_high
		b = "high"
	end
	return b
end	
	
function Buildtablet2(x,y)
a = pairt2(x,y)
a2 = a[2]
a3 = collect(a[2])
a4 = a3[1]
#Did this originate from low energy or high energy?
b = chooset2(x,y)
	if b == cs2_low
		c = "low"
		f = "clock"
		argf = "anti"
	elseif b == cs2_high
		c = "high"
		f = "anti"
		argf = "clock"
	else  @error "<Invalid Entries>"
	end 

	if x == y
	a4 = x*'_'*y
	end

df = DataFrame(first = [x], second =[y], pair_name = [a4], low_or_high =[c])

adaptor1 = DataFrame(name = [x, y])
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = adaptor2.sname[1]
ys = adaptor2.sname[2]

return DataFrame(first = [x], sname1 = [xs], second =[y], sname2 = [ys], pair_name = [a4], pair_sname = [xs*ys], low_or_high = [c], rotation = [f], argand_rotation = [argf], inversion = ["no"])
end

function Tier2_Buildtable(colourtableTier2)
	a = Vector{String}(undef, 5)
	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], pair_name = [], pair_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
	
		for j in 1:5
		b = colourtableTier2.name[i]
		c = colourtableTier2.name[j]
		d = Buildtablet2(b,c)
		df = append!(df,d)
		end
	end
	return df
end

# Inversion table for pairs:
function invBuildtablet2(x,y)
a = pairt2(x,y)
a2 = a[2]
a3 = collect(a[2])
a4 = a3[1]
#Did this originate from low energy or high energy?
b = chooset2(x,y)
	if b == cs2_low
		c = "high"
		f = "anti"
		argf = "clock"
	elseif b == cs2_high
		c = "low"
		f = "clock"
		argf = "anti"
	else  @error "<Invalid Entries>"
	end 

	if x == y
	a4 = x*'_'*y
	end

df = DataFrame(first = [x], second =[y], pair_name = [a4], low_or_high =[c])

adaptor1 = DataFrame(name = [x, y])
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = adaptor2.sname[1]
ys = adaptor2.sname[2]

return DataFrame(first = [x], sname1 = [xs], second =[y], sname2 = [ys], pair_name = [a4], pair_sname = [xs*ys], low_or_high = [c], rotation = [f], argand_rotation = [argf], inversion = ["yes"])
end

#Build Tier1 DataFrame for components
function Tier2_invBuildtable(colourtableTier2)
	a = Vector{String}(undef, 5)
	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], pair_name = [], pair_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
	
		for j in 1:5
		b = colourtableTier2.name[i]
		c = colourtableTier2.name[j]
		d = invBuildtablet2(b,c)
		df = append!(df,d)
		end
	end
	return df
end


## Trios

function Trio(x,y,z)
	
if x == y
a = Buildtablet2(y,z)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response
	if colour_dictTier2[y] <= colour_dictTier2[z]
		b = "clock"
		argb = "anti"
	elseif colour_dictTier2[y] > colour_dictTier2[z]
		b = "anti"
		argb = "clock"
	end
	
else	
	a = Buildtablet2(x,y)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response
	if colour_dictTier2[x] <= colour_dictTier2[y]
		b = "clock"
		argb = "anti"
	elseif colour_dictTier2[x] > colour_dictTier2[y]
		b = "anti"
		argb = "clock"
	end
end
	
adaptor1 = DataFrame(name = z)
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = a.sname1[1] 
ys = a.sname2[1]
zs = adaptor2.sname[1]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], low_or_high = d, rotation = [b], argand_rotation = [argb], inversion = ["no"])

end

function BuildtableTrio(colourtableTier2)

t1 = colourtableTier2.name 
t2 = colourtableTier2.sname

	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], third = [], sname3 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
		for j in 1:5
			for k in 1:5
			a = colourtableTier2.name[i]
			b = colourtableTier2.name[j]
			c = colourtableTier2.name[k]
			d = Trio(a,b,c)
			df = append!(df,d)
			end
		end
	end
	return df
end

## Inversion
function invTrio(x,y,z)

if x == y
a = Buildtablet2(y,z)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response	

	if colour_dictTier2[y] <= colour_dictTier2[z]
		b = "anti"
		argb = "clock"
		d = "high"
	elseif colour_dictTier2[y] > colour_dictTier2[z]
		b = "clock"
		argb = "anti"
		d = "low"
	end


else
	a = Buildtablet2(x,y)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response	

	if colour_dictTier2[x] <= colour_dictTier2[y]
		b = "anti"
		argb = "clock"
		d = "high"
	elseif colour_dictTier2[x] > colour_dictTier2[y]
		b = "clock"
		argb = "anti"
		d = "low"
	end
end
	
adaptor1 = DataFrame(name = z)
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = a.sname1[1] 
ys = a.sname2[1]
zs = adaptor2.sname[1]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], low_or_high = d, rotation = [b], argand_rotation = [argb], inversion = ["yes"])

end

function invBuildtableTrio(colourtableTier2)

t1 = colourtableTier2.name 
t2 = colourtableTier2.sname

	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], third = [], sname3 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
		for j in 1:5
			for k in 1:5
			a = colourtableTier2.name[i]
			b = colourtableTier2.name[j]
			c = colourtableTier2.name[k]
			d = invTrio(a,b,c)
			df = append!(df,d)
			end
		end
	end
	return df
end


#Quartets
function Quad(x,y,z,w)

if x == y

a = Trio(y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = Trio(x,y,z)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = w)
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = a.sname1[1] 
ys = a.sname2[1]
zs = a.sname3[1]
ws = adaptor2.sname[1]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["no"])

end

function BuildtableQuad(colourtableTier2)

t1 = colourtableTier2.name 
t2 = colourtableTier2.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [] , x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
	for j in 1:5
	for k in 1:5
		for l in 1:5
			a = colourtableTier2.name[i]
			b = colourtableTier2.name[j]
			c = colourtableTier2.name[k]
			d = colourtableTier2.name[l]
			f = Quad(a,b,c,d)
			df = append!(df,f)
			end
	end
	end
	end
	return df
end


## Inversion
function invQuad(x,y,z,w)

if x == y

a = invTrio(y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = invTrio(x,y,z)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = w)
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = a.sname1[1] 
ys = a.sname2[1]
zs = a.sname3[1]
ws = adaptor2.sname[1]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["yes"])

end

function invBuildtableQuad(colourtableTier2)

t1 = colourtableTier2.name 
t2 = colourtableTier2.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [] , x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
	for j in 1:5
	for k in 1:5
		for l in 1:5
			a = colourtableTier2.name[i]
			b = colourtableTier2.name[j]
			c = colourtableTier2.name[k]
			d = colourtableTier2.name[l]
			f = invQuad(a,b,c,d)
			df = append!(df,f)
			end
	end
	end
	end
	return df
end

## Quintet
function Quint(x,y,z,w,q)

if x == y

a = Quad(y,z,w,q)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = Quad(x,y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = q)
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = a.sname1[1] 
ys = a.sname2[1]
zs = a.sname3[1]
ws = a.sname4[1]
qs = adaptor2.sname[1]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["no"])

end

function BuildtableQuint(colourtableTier2)

t1 = colourtableTier2.name 
t2 = colourtableTier2.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
	for j in 1:5
	for k in 1:5
	for l in 1:5
	for m in 1:5
			a = colourtableTier2.name[i]
			b = colourtableTier2.name[j]
			c = colourtableTier2.name[k]
			d = colourtableTier2.name[l]
			f = colourtableTier2.name[m]
			g = Quint(a,b,c,d,f)
			df = append!(df,g)
			end
	end
	end
	end
	end
	return df
end

# Inversion

function invQuint(x,y,z,w,q)

if x == y

a = invQuad(y,z,w,q)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = invQuad(x,y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = q)
adaptor2 = leftjoin(adaptor1, colourtableTier2, on = :name)

xs = a.sname1[1] 
ys = a.sname2[1]
zs = a.sname3[1]
ws = a.sname4[1]
qs = adaptor2.sname[1]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["yes"])

end

function invBuildtableQuint(colourtableTier2)

t1 = colourtableTier2.name 
t2 = colourtableTier2.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:5
	for j in 1:5
	for k in 1:5
	for l in 1:5
	for m in 1:5
			a = colourtableTier2.name[i]
			b = colourtableTier2.name[j]
			c = colourtableTier2.name[k]
			d = colourtableTier2.name[l]
			f = colourtableTier2.name[m]
			g = invQuint(a,b,c,d,f)
			df = append!(df,g)
			end
	end
	end
	end
	end
	return df
end
