
include("/home/violet/Desktop/Amelie/Morral_Code/Tier1.jl")
include("/home/violet/Desktop/Amelie/Morral_Code/Tier2.jl")

#Colour dictionary for Black, Red, Orange, Yellow, White, Green, Blue, Purple
colour_dictTier3 = Dict([("Black", 0), ("Red", 1), ("Orange", 2), ("Yellow", 3), ("White", 4), ("Green", 5), ("Blue", 6), ("Purple", 7)])

#Inverse colour dictionary for Black, Red, Yellow, White, Blue
invcolour_dictTier3 = Dict(colour_dictTier3[k] => k for k in keys(colour_dictTier3))

#The Table containing colours (from within the colour dictionary), paired with a symbol, and a number (mod(7))
colourtableTier3 = DataFrame(name = ["Black", "Red", "Orange", "Yellow", "White", "Green", "Blue", "Purple"], sname = ['B', 'R', 'O', 'Y', 'W', 'G', 'I', 'P'],  number = [0, 1, 2, 3, 4, 5, 6, 7])

cs3_low = Set(["Black", "Black_Red", "Black_Orange", "Black_Yellow", "Black_White", "Black_Green", "Black_Blue", "Black_Purple", "Red", "Red_Orange", "Red_Yellow", "Red_White", "Red_Green", "Red_Blue", "Red_Purple", "Orange", "Orange_Yellow", "Orange_White", "Orange_Green", "Orange_Blue", "Orange_Purple", "Yellow", "Yellow_White", "Yellow_Green", "Yellow_Blue", "Yellow_Purple", "White", "White_Green", "White_Blue", "White_Purple", "Green", "Green_Blue", "Green_Purple", "Blue", "Blue_Purple", "Purple"])

cs3_high = Set(["Purple_Blue", "Purple_Green", "Purple_White", "Purple_Yellow", "Purple_Orange", "Purple_Red", "Purple_Black", "Blue_Green", "Blue_White", "Blue_Yellow", "Blue_Orange", "Blue_Red", "Blue_Black", "Green_White", "Green_Yellow", "Green_Orange", "Green_Red", "Green_Black", "White_Yellow", "White_Orange", "White_Red", "White_Black", "Yellow_Orange", "Yellow_Red", "Yellow_Black", "Orange_Red", "Orange_Black", "Red_Black", "Black"])

#Buildsets
Blackbuildset_t3 = Set(["Black", "Black_Red", "Black_Orange", "Black_Yellow", "Black_White", "Black_Green", "Black_Blue", "Black_Purple", "Purple_Black", "Blue_Black", "Green_Black", "White_Black", "Yellow_Black", "Orange_Black", "Red_Black"])

Redbuildset_t3 = Set(["Black_Red", "Red", "Red_Orange", "Red_Yellow", "Red_White", "Red_Green", "Red_Blue", "Red_Purple", "Purple_Red", "Blue_Red", "Green_Red", "White_Red", "Yellow_Red",  "Orange_Red", "Red_Black"])

Orangebuildset_t3 = Set(["Black_Orange", "Red_Orange", "Orange", "Orange_Yellow", "Orange_White", "Orange_Green", "Orange_Blue", "Orange_Purple", "Purple_Orange", "Blue_Orange", "Green_Orange", "White_Orange", "Yellow_Orange", "Orange_Red", "Orange_Black"])

Yellowbuildset_t3 = Set(["Black_Yellow", "Red_Yellow", "Orange_Yellow", "Yellow", "Yellow_White", "Yellow_Green", "Yellow_Blue", "Yellow_Purple", "Purple_Yellow", "Blue_Yellow", "Green_Yellow", "White_Yellow", "Yellow_Orange", "Yellow_Red", "Yellow_Black"])

Whitebuildset_t3 = Set(["Black_White", "Red_White", "Orange_White", "Yellow_White", "White", "White_Green", "White_Blue", "White_Purple", "Purple_White", "Blue_White", "Green_White", "White_Yellow", "White_Orange", "White_Red", "White_Black"])

Greenbuildset_t3 = Set(["Black_Green", "Red_Green", "Orange_Green", "Yellow_Green", "White_Green", "Green", "Green_Blue", "Green_Purple", "Purple_Green", "Blue_Green","Green_White", "Green_Yellow", "Green_Orange", "Green_Red", "Green_Black" ])

Bluebuildset_t3 = Set(["Black_Blue", "Red_Blue", "Orange_Blue", "Yellow_Blue", "White_Blue", "Green_Blue", "Blue", "Blue_Purple", "Purple_Blue", "Blue_Green", "Blue_White", "Blue_Yellow", "Blue_Orange", "Blue_Red", "Blue_Black"])

Purplebuildset_t3 = Set(["Black_Purple", "Red_Purple", "Orange_Purple", "Yellow_Purple", "White_Purple", "Green_Purple", "Blue_Purple", "Purple", "Purple_Blue", "Purple_Green", "Purple_White", "Purple_Yellow", "Purple_Orange", "Purple_Red", "Purple_Black"])

function chooset3(x, y)
	z = cs3_low #Note we have set this to left,top visually 

	if x == "Black" 
			n = 0
		elseif x == "Red"
			n = 1
		elseif x == "Orange"
			n = 2
		elseif x == "Yellow"
			n = 3
		elseif x == "White"
			n = 4
		elseif x == "Green"
			n = 5
		elseif x == "Blue"
			n = 6
		elseif x == "Purple"
			n =7
		end
		
		if y == "Black"
			m = 0
		elseif y == "Red"
			m = 1
		elseif y == "Orange"
			m = 2
		elseif y == "Yellow"
			m = 3
		elseif y == "White"
			m = 4
		elseif y == "Green"
			m = 5
		elseif y == "Blue"
			m = 6
		elseif y == "Purple"
			m = 7
		end
		
		if n > m
			z = cs3_high
		end
	return z
	end
	
function Groupt3(x::String, y::String)
	return Set([x,y])
	end
	
function pairt3(x,y)
	a = Groupt3(x,y)
	b = chooset3(x,y)
	
	if x == "Black" 
			n = Blackbuildset_t3
		elseif x == "Red"
			n = Redbuildset_t3
		elseif x == "Orange"
			n = Orangebuildset_t3
		elseif x == "Yellow"
			n = Yellowbuildset_t3
		elseif x == "White"
			n = Whitebuildset_t3
		elseif x == "Green"
			n = Greenbuildset_t3
		elseif x == "Blue"
			n = Bluebuildset_t3
		elseif x == "Purple"
			n = Purplebuildset_t3
		end
		
		if y == "Black"
			m = Blackbuildset_t3
		elseif y == "Red"
			m = Redbuildset_t3
		elseif y == "Orange"
			m = Orangebuildset_t3
		elseif y == "Yellow"
			m = Yellowbuildset_t3
		elseif y == "White"
			m = Whitebuildset_t3
		elseif y == "Green"
			m = Greenbuildset_t3
		elseif y == "Blue"
			m = Bluebuildset_t3
		elseif y == "Purple"
			m = Purplebuildset_t3
		end
	c = intersect(n, m)
	return Set[Groupt3(x,y), intersect(intersect(n,m), chooset3(x,y))]
	end
	
function directiont3(x,y)
	a = chooset3(x,y)
	if a == cs3_low
		b = "low"
	elseif a == cs3_high
		b = "high"
	end
	return b
end	


function Buildtablet3(x,y)
a = pairt3(x,y)
a2 = a[2]
a3 = collect(a[2])
a4 = a3[1]
#Did this originate from low energy or high energy?
b = chooset3(x,y)
	if b == cs3_low
		c = "low"
		f = "clock"
		argf = "anti"
	elseif b == cs3_high
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
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1]
ys = adaptor2.sname[2]

return DataFrame(first = [x], sname1 = [xs], second =[y], sname2 = [ys], pair_name = [a4], pair_sname = [xs*ys], low_or_high = [c], rotation = [f], argand_rotation = [argf], inversion = ["no"])
end

function Tier3_Buildtable(colourtableTier3)
	a = Vector{String}(undef, 8)
	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], pair_name = [], pair_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	
		for j in 1:8
		b = colourtableTier3.name[i]
		c = colourtableTier3.name[j]
		d = Buildtablet3(b,c)
		df = append!(df,d)
		end
	end
	return df
end

# Inversion table for pairs:
function invBuildtablet3(x,y)
a = pairt3(x,y)
a2 = a[2]
a3 = collect(a[2])
a4 = a3[1]
#Did this originate from low energy or high energy?
b = chooset3(x,y)
	if b == cs3_low
		c = "high"
		f = "anti"
		argf = "clock"
	elseif b == cs3_high
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
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1]
ys = adaptor2.sname[2]

return DataFrame(first = [x], sname1 = [xs], second =[y], sname2 = [ys], pair_name = [a4], pair_sname = [xs*ys], low_or_high = [c], rotation = [f], argand_rotation = [argf], inversion = ["yes"])
end

#Build Tier1 DataFrame for components
function Tier3_invBuildtable(colourtableTier3)
	a = Vector{String}(undef, 8)
	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], pair_name = [], pair_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	
		for j in 1:8
		b = colourtableTier3.name[i]
		c = colourtableTier3.name[j]
		d = invBuildtablet3(b,c)
		df = append!(df,d)
		end
	end
	return df
end


## Trios

function Trio3(x,y,z)
	
if x == y
a = Buildtablet3(y,z)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response
	if colour_dictTier3[y] <= colour_dictTier3[z]
		b = "clock"
		argb = "anti"
	elseif colour_dictTier3[y] > colour_dictTier3[z]
		b = "anti"
		argb = "clock"
	end
	
else	
	a = Buildtablet3(x,y)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response
	if colour_dictTier3[x] <= colour_dictTier3[y]
		b = "clock"
		argb = "anti"
	elseif colour_dictTier3[x] > colour_dictTier3[y]
		b = "anti"
		argb = "clock"
	end
end
	
adaptor1 = DataFrame(name = [x,y,z])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], low_or_high = d, rotation = [b], argand_rotation = [argb], inversion = ["no"])

end

function BuildtableTrio(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], third = [], sname3 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
		for j in 1:8
			for k in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = Trio3(a,b,c)
			df = append!(df,d)
			end
		end
	end
	return df
end



## Inversion
function invTrio3(x,y,z)

if x == y
a = Buildtablet3(y,z)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response	

	if colour_dictTier3[y] <= colour_dictTier3[z]
		b = "anti"
		argb = "clock"
		d = "high"
	elseif colour_dictTier3[y] > colour_dictTier3[z]
		b = "clock"
		argb = "anti"
		d = "low"
	end


else
	a = Buildtablet3(x,y)
	c = a.pair_name
	d = a.low_or_high
	#Non-Argand Rotation direction - for Analysis --> Response	

	if colour_dictTier3[x] <= colour_dictTier3[y]
		b = "anti"
		argb = "clock"
		d = "high"
	elseif colour_dictTier3[x] > colour_dictTier3[y]
		b = "clock"
		argb = "anti"
		d = "low"
	end
end
	
adaptor1 = DataFrame(name = [x,y,z])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], low_or_high = d, rotation = [b], argand_rotation = [argb], inversion = ["yes"])

end

function invBuildtableTrio(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second =[], sname2 = [], third = [], sname3 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
		for j in 1:8
			for k in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = invTrio3(a,b,c)
			df = append!(df,d)
			end
		end
	end
	return df
end

#Quartets
function Quad3(x,y,z,w)

if x == y

a = Trio3(y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = Trio3(x,y,z)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = [x,y,z,w])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["no"])

end

function BuildtableQuad3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [] , x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
		for l in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = Quad3(a,b,c,d)
			df = append!(df,f)
			end
	end
	end
	end
	return df
end


## Inversion
function invQuad3(x,y,z,w)

if x == y

a = invTrio3(y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = invTrio3(x,y,z)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = [x,y,z,w])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws] , x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["yes"])

end

function invBuildtableQuad3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [] , x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
		for l in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = invQuad3(a,b,c,d)
			df = append!(df,f)
			end
	end
	end
	end
	return df
end

## Quintet
function Quint3(x,y,z,w,q)

if x == y

a = Quad3(y,z,w,q)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = Quad3(x,y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = [x,y,z,w,q])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]
qs = adaptor2.sname[5]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["no"])

end

function BuildtableQuint3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
	for l in 1:8
	for m in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = colourtableTier3.name[m]
			g = Quint3(a,b,c,d,f)
			df = append!(df,g)
			end
	end
	end
	end
	end
	return df
end

# Inversion
function invQuint3(x,y,z,w,q)

if x == y

a = invQuad3(y,z,w,q)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = invQuad3(x,y,z,w)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = q)
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]
qs = adaptor2.sname[5]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["yes"])

end

function invBuildtableQuint3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
	for l in 1:8
	for m in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = colourtableTier3.name[m]
			g = invQuint3(a,b,c,d,f)
			df = append!(df,g)
			end
	end
	end
	end
	end
	return df
end


## Sixtet
function Sixt3(x,y,z,w,q,l)

if x == y

a = Quint3(y,z,w,q,l)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = Quint3(x,y,z,w,q)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = [x,y,z,w,q,l])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]
qs = adaptor2.sname[5]
ls = adaptor2.sname[6]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], sixth = [l], sname6 = [ls], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], sixt_sname = [xs*ys*zs*ws*qs*ls], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["no"])

end

function BuildtableSixt3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], sixth = [], sname6 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], sixt_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
	for l in 1:8
	for m in 1:8
	for n in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = colourtableTier3.name[m]
			g = colourtableTier3.name[n]
			h = Sixt3(a,b,c,d,f,g)
			df = append!(df,h)
			end
	end
	end
	end
	end
	end
	return df
end

# Inversion
function invSixt3(x,y,z,w,q,l)

if x == y

a = invQuint3(y,z,w,q,l)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = invQuint3(x,y,z,w,q)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = [x,y,z,w,q,l])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]
qs = adaptor2.sname[5]
ls = adaptor2.sname[6]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], sixth = [l], sname6 = [ls], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], sixt_sname = [xs*ys*zs*ws*qs*ls], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["yes"])

end

function invBuildtableSixt3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], sixth = [], sname6 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], sixt_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
	for l in 1:8
	for m in 1:8
	for n in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = colourtableTier3.name[m]
			g = colourtableTier3.name[n]
			h = invSixt3(a,b,c,d,f,g)
			df = append!(df,h)
			end
	end
	end
	end
	end
	end
	return df
end








## Septet
function Sept3(x,y,z,w,q,l,p)

if x == y

	a = Sixt3(y,z,w,q,l,p)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = Sixt3(x,y,z,w,q,l)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = [x,y,z,w,q,l,p])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]
qs = adaptor2.sname[5]
ls = adaptor2.sname[6]
ps = adaptor2.sname[7]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], sixth = [l], sname6 = [ls], seventh = [p], sname7 = [ps], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], sixt_sname = [xs*ys*zs*ws*qs*ls], sept_sname = [xs*ys*zs*ws*qs*ls*ps], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["no"])

end

function BuildtableSept3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], sixth = [], sname6 = [], seventh = [], sname7 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], sixt_sname = [], sept_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
	for l in 1:8
	for m in 1:8
	for n in 1:8
	for o in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = colourtableTier3.name[m]
			g = colourtableTier3.name[n]
			h = colourtableTier3.name[o]
			j1 = Sept3(a,b,c,d,f,g,h)
			df = append!(df,j1)
			end
	end
	end
	end
	end
	end
	end
	return df
end

# Inversion
function invSept3(x,y,z,w,q,l,p)

if x == y

a = invSixt3(y,z,w,q,l,p)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)

else
	a = invSixt3(x,y,z,w,q,l)
	c = a.x_y_pair_name
	d = a.low_or_high
	b = String.(a.rotation)
	argb = String.(a.argand_rotation)
end

adaptor1 = DataFrame(name = [x,y,z,w,q,l,p])
adaptor2 = leftjoin(adaptor1, colourtableTier3, on = :name)

xs = adaptor2.sname[1] 
ys = adaptor2.sname[2]
zs = adaptor2.sname[3]
ws = adaptor2.sname[4]
qs = adaptor2.sname[5]
ls = adaptor2.sname[6]
PS = adaptor2.sname[7]

return DataFrame(first = [x], sname1 = [xs], second = [y], sname2 = [ys], third = [z], sname3 = [zs], fourth = [w], sname4 = [ws], fifth = [q], sname5 = [qs], sixth = [l], sname6 = [ls], seventh = [p], sname7 = [ps], x_y_pair_name = c, pair_sname = [xs*ys], trio_sname = [xs*ys*zs], quad_sname = [xs*ys*zs*ws], quint_sname = [xs*ys*zs*ws*qs], sixt_sname = [xs*ys*zs*ws*qs*ls], sept_sname = [xs*ys*zs*ws*qs*ls*ps], low_or_high = d, rotation = b, argand_rotation = argb, inversion = ["yes"])

end

function invBuildtableSept3(colourtableTier3)

t1 = colourtableTier3.name 
t2 = colourtableTier3.sname

	df = DataFrame(first = [], sname1 = [], second = [], sname2 = [], third = [], sname3 = [], fourth = [], sname4 = [], fifth = [], sname5 = [], sixth = [], sname6 = [], seveth = [], sname7 = [], x_y_pair_name = [], pair_sname = [], trio_sname = [], quad_sname = [], quint_sname = [], sixt_sname = [], sept_sname = [], low_or_high = [], rotation = [], argand_rotation = [], inversion = [])
	
	for i in 1:8
	for j in 1:8
	for k in 1:8
	for l in 1:8
	for m in 1:8
	for n in 1:8
	for o in 1:8
			a = colourtableTier3.name[i]
			b = colourtableTier3.name[j]
			c = colourtableTier3.name[k]
			d = colourtableTier3.name[l]
			f = colourtableTier3.name[m]
			g = colourtableTier3.name[n]
			h = colourtableTier3.name[o]
			j1 = invSept3(a,b,c,d,f,g,h)
			df = append!(df,j1)
			end
	end
	end
	end
	end
	end
	end
	return df
end


