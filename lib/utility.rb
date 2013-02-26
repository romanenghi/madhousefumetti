require 'mechanize'
module Utility

class FumettiImport 
	
	@url =""
	@links = Array.new

	def urlSearch=(t)
		@urlSearch = t
	end
	
	def links=(t)
		@links = t
	end
	
	
	
	def doSearch
		@links = ['1','2']
	end
	
end


end