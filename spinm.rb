@spinm = []

CLOCK_DIRECTION = [:right, :down, :left, :up]
COUNT_CLOCK_DIRECTION = [:down, :right, :up, :left]

STEP_ADDUM = {
	:right => [0,1],
	:left  => [0,-1],
	:up    => [-1,0],
	:down  => [1,0]
}

# init matrix
def init_matrix n
	for i in 0..n-1
		@spinm[i] = [];
		for j in 0..n-1
			(@spinm[i])[j] = 0
		end
	end
end

# print matrix
def print_matrix
	len = @spinm.length
	(5*len + 5).times {print "-"}
	puts
	for ii in 0..len-1
		print "|   "
		for jj in 0..len-1
			if @spinm[ii][jj] <10
				print " "
			end
			print @spinm[ii][jj].to_s + "   "
		end
		print "|"
		puts
	end
	(5*len + 5).times {print "-"}
	puts
end

# spin list
def get_spin_list n
	result = []
	if n==1
		return [1]
	end
	result = result << n
	(n-1).downto 1 do |i|
		result << i
		result << i
	end 
	result
end

#walk the matrix
def walk_matrix
	len = @spinm.length
	currX = 0
	currY = -1
	currNum = 0
	currDirection = 0
	steps = get_spin_list len
	steps.each 	{|e|
		e.times {
			currNum += 1
			currX += STEP_ADDUM[CLOCK_DIRECTION[currDirection]][0]
			currY += STEP_ADDUM[CLOCK_DIRECTION[currDirection]][1]
			(@spinm[currX])[currY] = currNum
		}
		currDirection += 1
		if currDirection == 4
			currDirection = 0
		end
	}
end

#test main begin here.

print "Begin...\n"

count = 5

init_matrix count

walk_matrix

print_matrix

print "End.\n"
