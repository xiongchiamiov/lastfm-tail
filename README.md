A small script, inspired by the Unix `tail` utility, for viewing
recently-scrobbled tracks on [Last.fm](http://last.fm).

# Installation

    gem install lastfm-tail

or

    curl -s https://raw.github.com/xiongchiamiov/lastfm-tail/master/bin/lastfm-tail > ~/bin/lastfm-tail
	chmod +x ~/bin/lastfm-tail

# Options

    Usage: lastfm-tail [options] [USER]
        -f, --follow                     Don't exit after retrieving data, but
                                         poll Last.fm for new tracks.  Polling
                                         frequency is controlled by the `-F`
                                         option. Implies -r.
        -F, --frequency NUM              Poll Last.fm every NUM seconds. Defaults
                                         to 5.  Implies `-f`. 
        -n, --number NUM                 List NUM tracks.
        -r, --reverse                    List tracks from oldest to newest.
        -v, --version                    Show the installed version of lastfm-tail.
        -h, --help                       Show this help dialog.

