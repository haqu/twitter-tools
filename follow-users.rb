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
puts "[*] Following users"
puts "username : #{username}"
puts "targets  : #{users.count}"
puts

chirpy = Chirpy.new(username,password)

friends = [] # following
chirpy.friends.search('user').each do |u|
  friends << u.at('screen_name').innerHTML
end

users -= friends
users.delete(username)
users.uniq!

count_added = 0
users.each do |u|
  begin
    chirpy.create_friendship(u)
  rescue Exception => e
    next if e.class == Timeout::Error
    exit if e.class == Interrupt
    puts "#{e.class} #{e}"
  end
  count_added += 1
  puts "%-3d %s" % [count_added,u]
end
puts

count_friends = chirpy.friends.search('user').count
puts "#{username} follows #{count_friends} people (#{count_added} added)"

puts
