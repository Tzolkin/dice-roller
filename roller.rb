#!/usr/bar/env ruby
require 'optparse'
require 'json'
require './dice'

options = {}

OptionParser.new do |parser|
  parser.banner = 'Usage: home.rb [options]'

  parser.on('-d', '--dices DICES', 'How many dices are to be rolled?') do |dices|
    options[:dices] = dices.to_i
  end

  parser.on('-s', '--sides SIDES', 'How many sides each dice has. Example: "[6, 8, 20]"') do |sides|
    options[:sides] = JSON[sides]
  end

  parser.on('-h', '--help', 'Prints this help') do
    puts parser
    exit
  end
end.parse!

raise StandardError.new "Gived sides doesn't match with the dices number" unless options[:dices].eql?(options[:sides].count)

# puts options
dice = Dice.new(options)
dice.roll
