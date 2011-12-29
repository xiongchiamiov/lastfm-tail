#!/usr/bin/env ruby

require 'date'
require 'open-uri'
require 'optparse'
require 'xmlsimple'

trackLimit = 10
pollFrequency = nil
reverse = false
OptionParser.new do |opts|
	opts.banner = "Usage: #{$0} [options] [USER]"
	
	opts.on('-f', '--follow', "Don't exit after retrieving data, but poll "\
	                         +"Last.fm for new tracks.  Polling frequency "\
	                         +"is controlled by the `-F` option. Implies -r.") do
		pollFrequency = 5 # Magic number
		reverse = true
	end
	
	opts.on('-F', '--frequency NUM', Integer, 'Poll Last.fm every NUM seconds. '\
	                                +'Defaults to 5.  Implies `-f`. ') do |num|
		pollFrequency = num
	end
	
	opts.on('-n', '--number NUM', Integer, 'List NUM tracks.') do |num|
		if num > 10
			puts 'Last.fm only provides the 10 latest tracks; sorry!'
			exit 1
		end
		
		trackLimit = num
	end
	
	opts.on('-r', '--reverse', 'List tracks from oldest to newest.') do
		reverse = true
	end
	
	opts.on('-v', '--version', 'Show the installed version of lastfm-tail.') do
		puts 'lastfm-tail 0.1b'
		exit 0
	end
	
	opts.on_tail('-h', '--help', 'Show this help dialog.') do
		puts opts
		exit 0
	end
end.parse!

username = ARGV[-1] || 'xiongchiamiov'
lastTimestamp = Time.at(0)

# The logic here dealing with polling is a bit dirty.
begin
	rss = open("http://ws.audioscrobbler.com/2.0/user/#{username}/recenttracks.rss").read()
	xml = XmlSimple.xml_in rss
	items = xml['channel'][0]['item']
	items.reverse! if reverse
	items.each_with_index do |item, i|
		if i == trackLimit
			break
		end
		
		timestamp = Time.parse item['pubDate'][0]
		# Is this an older item that's overlapping?
		if !pollFrequency.nil? && lastTimestamp >= timestamp
			next
		end
		
		puts item['title']
		lastTimestamp = timestamp
	end
end while !pollFrequency.nil? && sleep(pollFrequency)

