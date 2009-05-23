#!/usr/bin/env ruby

require 'rubygems'
require 'yaml'
require 'chirpy'

config = YAML::load(File.open('config.yaml'))
username = config['username']
password = config['password']

puts
puts "[*] Unfollowing"
puts "username: "+username
puts

users = []

chirpy = Chirpy.new(username,password)

followers = []

chirpy.followers.search('user').each do |u|
  name = u.at('screen_name').innerHTML
  followers << name
end

puts "targets"
count = 0
chirpy.friends.search('user').each do |u|
  name = u.at('screen_name').innerHTML
  if not followers.include?(name)
    chirpy.destroy_friendship(name)
    # chirpy.leave(name)
    count += 1
    puts "%-3d %s" % [count,name]
  end
end
puts

num_friends = chirpy.friends.search('user').length
puts "#{username} follows #{num_friends} people (#{count} removed)"
puts
