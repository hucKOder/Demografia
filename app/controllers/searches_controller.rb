require 'nokogiri'
require 'open-uri'
class SearchesController < ApplicationController
	def index
		@town = Town.find_by name: params[:reason]

		doc = Nokogiri::HTML(open(URI.escape('https://sk.wikipedia.org/wiki/'+params[:reason])))
		x = doc.css('.geography tr')
		@dic = {}
		x.each do |i|
			if i.css('th').text != "" then
			@dic[i.css('th').text.gsub(/\n/,' ').squish] = i.css('td').text.gsub(/\n/,' ').squish
			end
		end

		@picture = x.css('img').attr('src').value
	end

end
