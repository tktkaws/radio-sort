require 'nokogiri'
require 'csv'
require 'open-uri'

CSV.open('FMTweekly2.csv', 'w') do |csv|
  f = File.open('FMTweekly2.xml')
  doc = Nokogiri::XML(f)
  f.close
  csv << %w[title pfm ft to dur image] # csvへの書き込み

  item_nodes = doc.xpath('//progs/prog')
  item_nodes.each do |item|
    title = item.xpath('title').text
    pfm = item.xpath('pfm').text
    ft = item.xpath('@ft').text
    to = item.xpath('@to').text
    dur = item.xpath('@dur').text
    image = item.xpath('img').text

    csv << [title, pfm, ft, to, dur, image] # csvへの書き込み
    p image
  end
end
