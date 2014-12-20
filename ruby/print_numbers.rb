array = [16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

i = 1
array.each do |item| 
	print "#{item} "
	print "\n" if i % 4 == 0
	i += 1 
end 

array.each_slice(4) do |slice|
	slice.map() {|item| print "#{item} "}
	puts
end
