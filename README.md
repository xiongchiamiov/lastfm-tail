A small script, inspired by the Unix `tail` utility, for viewing
recently-scrobbled tracks on [Last.fm](http://last.fm).

# Options

`-f`, `--follow` - Don't exit after retrieving data, but poll Last.fm for new
tracks.  Polling frequency is controlled by the `-F` option.  
`-F [NUM]`, `--frequency=[NUM]` - Poll Last.fm every NUM seconds.  Defaults to 5.  Implies `-f`.  
`-n [NUM]`, `--number=[NUM]` - List NUM tracks.  
`-v`, `--version` - Show the installed version of lastfm-tail.  
`-h`, `--help` - Show this help dialog.  

