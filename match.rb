#!/usr/bin/env ruby

require 'rubygems'
require 'benchmark'
require 'json'

Dir.glob(File.join(File.dirname(__FILE__), 'lib/**')) do |file|
  require file
end

ARGV[0] or raise "no word!"

to_match = ARGV[0].strip.gsub(/\W+/, '').downcase
    
test_data = File.open('./test_data.txt').read

def get_mem
  `ps -o rss= -p #{Process.pid}`.to_i
end

puts "Results from \"#{__FILE__} #{to_match}\"...\n\n"

[RegexpSearch, FerretSearch, LinearSearch, TrieSearch].each do |search_class|
  puts search_class

  instance = ''
  matches = []

  Benchmark.bm do |bm|
    before = get_mem
    puts "Memory Before: #{before}"
    bm.report('init') { instance = search_class.new(test_data.dup) }
    bm.report('search') { matches = instance.search(to_match) }
    after = get_mem
    puts "Memory After: #{after}"
    puts "Memory Delta: #{after - before}"
  end

  puts "\n"

  p matches

  puts "\n\n"
end
