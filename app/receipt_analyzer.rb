require 'rubygems'
require 'bundler/setup'
Bundler.require
load 'generator.rb'

INPUT_DIRECTORY = '/scans/TESTRUBY/in'.freeze
EXTENSIONS_REGEX = /\.jpg|\.jpeg|\.png/

def filename(f)
  "#{INPUT_DIRECTORY}/#{f}"
end

Dir.foreach(INPUT_DIRECTORY) do |f|
  Generator.new(filename(f), f).process unless File.extname(f).match(EXTENSIONS_REGEX).nil?
end
