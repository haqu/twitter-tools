#!/usr/bin/env ruby

targets = []

if not ARGV.length.zero?
  ARGV.each do |t|
    targets << t
  end
end

if not STDIN.tty?
  STDIN.read.split("\n").each do |t|
    targets << t
  end
end

targets.empty? && exit

require 'rubygems'
require 'yaml'
require 'chirpy'

config = YAML::load(File.open('config.yaml'))
username = config['username']
password = config['password']

puts
puts "[*] Unfollowing users"
puts "username : #{username}"
puts "targets  : #{targets.length}"
puts

chirpy = Chirpy.new(username,password)

targets.delete(username)
targets.uniq!

count_removed = 0
targets.each do |t|
  begin
    chirpy.destroy_friendship(t)
  rescue Exception => e
    next if e.class == Timeout::Error
    exit if e.class == Interrupt
    puts "#{e.class} #{e}"
  end
  count_removed += 1
  puts "%-3d %s" % [count_removed,t]
end
puts

count_friends = chirpy.friends.search('user').count
puts "#{username} follows #{count_friends} people (#{count_removed} removed)"

puts
