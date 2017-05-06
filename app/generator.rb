# Performs the actual conversions and generates the .txt and .csv files
class Generator
  def initialize(file, filename = nil)
    @file = file
    @filename = filename
    @image = nil
    @out = '/scans/TESTRUBY/out/'.freeze
  end

  def process
    puts "Processing: #{@file}"
    convert
    save
  end

  def convert
    @image = RTesseract.new(@file)
  end

  def save
    File.open("#{@out}#{@filename}.txt", 'w') { |file| file.write(@image.to_s) }
  end
end
