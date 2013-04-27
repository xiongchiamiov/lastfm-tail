# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'lastfm-tail'
  s.version = "1.0.2"
  s.date = Time.now.strftime('%Y-%m-%d')

  s.authors = ["xiongchiamiov"]
  s.email = ['xiong.chiamiov@gmail.com']
  
  s.add_dependency 'englify'
  s.add_dependency 'inifile', '~> 1.1.0'
  s.add_dependency 'nice-sigint'
  s.add_dependency 'xml-simple'
  
  s.files = %w( COPYING Rakefile README.md )
  s.files += Dir.glob "bin/*"
  
  s.executables = 'lastfm-tail'
  s.extra_rdoc_files = ['README.md']
  
  s.summary = %q{View recently-scrobbled tracks from Last.fm.}
  s.homepage = 'https://github.com/xiongchiamiov/lastfm-tail/'
  s.description = %q{A small script, inspired by the Unix tail utility, for viewing recently-scrobbled tracks on Last.fm.}
end
