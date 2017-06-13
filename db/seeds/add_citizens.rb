require 'nokogiri'
require 'open-uri'

towns = Town.all

towns.each do |i|
  link = ''
  case i.name
    when "Jelšava", "Svit", "Skalica", "Vysoké Tatry", "Revúca", "Myjava"
      link = 'https://sk.wikipedia.org/wiki/'+i.name+'_(mesto)'
    when "Levice"
      link = 'https://sk.wikipedia.org/wiki/Levice_(Slovensko)'
    when "Martin"
      link = 'https://sk.wikipedia.org/wiki/Martin_(mesto_na_Slovensku)'
    when "Tisovec"
      link = 'https://sk.wikipedia.org/wiki/Tisovec_(okres_Rimavská_Sobota)'
    else
      link = 'https://sk.wikipedia.org/wiki/'+i.name
  end

doc = Nokogiri::HTML(open(URI.escape(link)))
x = doc.css('.geography tr')
@dic = {}
x.each do |i|
  if i.css('th').text != "" then
    @dic[i.css('th').text.gsub(/\n/,' ').squish] = i.css('td').text.gsub(/\n/,' ').squish
  end
end
  i.citizens = @dic['Obyvateľstvo'].split('(').first.gsub(/ /,'').to_i
  i.info = @dic
  i.picture = x.css('img').attr('src').value
  i.save
end
