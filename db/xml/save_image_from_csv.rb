require "csv"
require "open-uri"
require "FileUtils"

def save_image(url,fileName)
  dirName = "/Users/takayukitakahashi/RubymineProjects/radio-sort/app/assets/images/LFR/"
  filePath = dirName + fileName

  FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)

  open(filePath, 'wb') do |output|
    open(url) do |data|
      output.write(data.read)
    end
  end
end

CSV.foreach('/Users/takayukitakahashi/RubymineProjects/radio-sort/db/xml/LFRnotnill.csv', headers: true) do |row|
  img = row['image']
  filename = row['filename']
  p filename
  save_image(img,filename)
end