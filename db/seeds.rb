# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

#require 'nokogiri'
#require "FileUtils"
#
#f = File.open("/Users/takayukitakahashi/RubymineProjects/radio-sort/db/xml/TBS.xml")
#doc = Nokogiri::XML(f)
#f.close
#
#dirName = "/Users/takayukitakahashi/RubymineProjects/radio-sort/app/assets/images/"
#
#item_nodes = doc.xpath('//progs/prog')
#item_nodes.each do |item|
#  img = item.xpath('img').text
#  fileName = File.basename(img)
#  filePath = dirName + fileName
#
#  Radio.create(
#    title: item.xpath('title').text,
#    personality: item.xpath('pfm').text,
#    image: fileName,
#    station: "TBS",
#    start_time: item.xpath('@ft').text,
#    end_time: item.xpath('@to').text,
#    length: item.xpath('@dur').text,
#    )
#end
