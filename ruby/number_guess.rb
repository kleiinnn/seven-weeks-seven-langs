num = rand(10)
playerNum = num - 1
while num != playerNum
	playerNum = gets.to_i
	if playerNum < num
		puts 'to low'
	else
		puts 'to high'
	end
end
puts 'congrats'
