#!/usr/bin/env ruby

require 'rubygems'
require 'benchmark'

Dir.glob(File.join(File.dirname(__FILE__), 'lib/**')) do |file|
  require file
end

to_match = ARGV[0] or raise "no word!"

words = []

File.open('/usr/share/dict/words').each do |line|
    words << line.strip.downcase
end

def get_mem
  `ps -o rss= -p #{Process.pid}`.to_i
end

[FerretSearch, LinearSearch, TrieSearch].each do |search_class|
  puts search_class

  instance = ''
  matches = []

  Benchmark.bm do |bm|
    before = get_mem
    puts "Memory Before: #{before}"
    bm.report('init') { instance = search_class.new(words) }
    bm.report('search') { matches = instance.search(to_match) }
    after = get_mem
    puts "Memory After: #{after}"
    puts "Memory Delta: #{after - before}"
  end

  puts "\n"

  p matches

  puts "\n\n"
end
