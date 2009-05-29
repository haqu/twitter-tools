#!/usr/bin/env ruby

users = []

if not ARGV.length.zero?
  ARGV.each do |u|
    users << u
  end
end

if not STDIN.tty?
  STDIN.read.split("\n").each do |u|
    users << u
  end
end

users.empty? && exit

require 'rubygems'
require 'yaml'
require 'chirpy'

config = YAML::load(File.open('config.yaml'))
username = config['username']
password = config['password']

puts
puts "[*] Unfollowing users"
puts "username: #{username}"
puts "users count: #{users.length}"
puts

chirpy = Chirpy.new(username,password)

users.delete(username)
users.uniq!

puts "targets"

count = 0
users.each do |u|
  begin
    chirpy.destroy_friendship(u)
  rescue Exception => e
    next if e.class == Timeout::Error
    exit if e.class == Interrupt
    puts "#{e.class} #{e}"
  end
  count += 1
  puts "%-3d %s" % [count,u]
end
puts

count_friends = chirpy.friends.search('user').count
puts "#{username} follows #{count_friends} people (#{count} removed)"

puts
