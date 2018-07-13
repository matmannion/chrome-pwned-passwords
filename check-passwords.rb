#!/usr/bin/env ruby

require 'csv'
require 'pwned'
require 'colorize'

unless ARGV.length == 1
    puts 'Usage: bundle exec ruby check-passwords.rb [filename]'
    exit 128
end

CSV.foreach(ARGV[0], { :headers => true }) do |row|
    password = Pwned::Password.new(row['password'])
    if password.pwned?
        output = "Password for #{row['username']} on #{row['url']} is pwned - #{password.pwned_count} times"

        if password.pwned_count > 10000
            STDERR.puts output.red
        else
            STDERR.puts output.yellow
        end
    end
end