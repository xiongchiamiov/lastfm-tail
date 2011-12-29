#!/usr/bin/env ruby

# This version does not, of course, respect any of the parameters outlined in
# the README.

require 'open-uri'
require 'optparse'
require 'xmlsimple'

OptionParser.new do |opts|
	opts.banner = "Usage: #{$0} [options] [USER]"
	
	opts.on('-v', '--version') do
		puts 'lastfm-tail 0.1b'
		exit 0
	end
end.parse!

username = ARGV[-1] || 'xiongchiamiov'
rss = open("http://ws.audioscrobbler.com/2.0/user/#{username}/recenttracks.rss").read()
xml = XmlSimple.xml_in rss
items = xml['channel'][0]['item']
items.each do |item|
	puts item['title']
	#puts item['pubDate']
end

