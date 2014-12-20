regex = Regexp.new(ARGV[1])
file = File.new(ARGV[0])
file.each_line do |line|
	puts "#{file.lineno}: #{line}" if regex.match(line)
end
