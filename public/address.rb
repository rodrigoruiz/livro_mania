class Address

require 'hpricot'
require 'open-uri'

	def initialize(url)
		@url = url
		@hp = Hpricot(open(@url))
	end

	def localizate
		@local = @hp.at("")
	end
end