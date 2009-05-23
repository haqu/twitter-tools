#!/usr/bin/env ruby

message = ARGV[0] || exit

require 'rubygems'
require 'yaml'
require 'chirpy'

config = YAML::load(File.open('config.yaml'))
username = config['username']
password = config['password']

puts
puts "[*] Posting message"
puts "username: "+username
puts "message: "+message

users = []

chirpy = Chirpy.new(username,password)
chirpy.update_status(message)

puts "done"
puts
