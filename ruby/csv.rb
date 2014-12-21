module ActsAsCsv

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		include Enumerable
	
		def read 
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')
			
			file.each do |row| 
				@csv_contents << row.chomp.split(', ')
			end
		end

		attr_accessor :headers, :csv_contents

		def initialize
			read
		end

		def each(&blk)
			@csv_contents.each do |row| 
				data = { }
				@headers.each_index {|cullumn_index| data[@headers[cullumn_index]] = row[cullumn_index]}
				blk.call(CsvRow.new data)
			end
		end
	end

	class CsvRow
		@data = { }
		
		def initialize(data) 
			@data = data
		end

		def method_missing name, *args
			collumn = name.to_s
			@data[collumn]
		end
	end
end

class RubyCsv 
	include ActsAsCsv
	acts_as_csv
end


csv = RubyCsv.new
csv.each {|row| puts row.one}


