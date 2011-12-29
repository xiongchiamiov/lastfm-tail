#!/usr/bin/env ruby

# This version does not, of course, respect any of the parameters outlined in
# the README.

require 'open-uri'
require 'optparse'
require 'xmlsimple'

trackLimit = 10
OptionParser.new do |opts|
	opts.banner = "Usage: #{$0} [options] [USER]"
	
	opts.on('-n', '--number NUM', 'List NUM tracks.') do |num|
		num = num.to_i
		if num > 10
			puts 'Last.fm only provides the 10 latest tracks; sorry!'
			exit 1
		end
		
		trackLimit = num
	end
	
	opts.on('-v', '--version', 'Show the installed version of lastfm-tail.') do
		puts 'lastfm-tail 0.1b'
		exit 0
	end
end.parse!

username = ARGV[-1] || 'xiongchiamiov'
rss = open("http://ws.audioscrobbler.com/2.0/user/#{username}/recenttracks.rss").read()
xml = XmlSimple.xml_in rss
items = xml['channel'][0]['item']
items.each_with_index do |item, i|
	if i == trackLimit
		break
	end
	
	puts item['title']
	#puts item['pubDate']
end

