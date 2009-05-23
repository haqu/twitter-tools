# Twitter Tools

Before using these tools please consider reading [Twitter's Terms of Service](http://twitterapi.pbworks.com/Terms-of-Service) and [Rate limiting](http://twitterapi.pbworks.com/Rate-limiting).

Template for config.yaml

    username: <twitter_username>
    password: <twitter_password>

Installing chirpy

    $ git clone git://github.com/ashrewdmint/chirpy.git
    $ cd chirpy
    $ gem build chirpy.gemspec
    $ sudo gem install chirpy-x.x.x.gem

## post.rb

Post message.

Example:

    $ ./post.rb "testing post.rb from twitter-tools"
    
    [*] Posting message
    username: haqu
    message: testing post.rb from twitter-tools
    done
    
## search-follow.rb

1. Search latest messages based on query (exact match).
2. Extract authors of these messages.
3. Follow them.

Use [Twitter Search](http://search.twitter.com) to prepare search query.

Example:

    $ ./search-follow.rb "iphone game development"

    [*] Searching and following
    username: haqu
    search query: "iphone game development"

    targets
    1   oneofus
    2   DistinctiveGame
    3   applesecrets
    4   iPhone_Games
    5   Xgamess
    6   gaming_agg
    7   bernadep
    8   gamesnewsnet
    9   Exiledblog
    10  funkastik
    11  VideoGameFeed
    12  TechnoNews
    13  kotakufeed

    haqu follows 48 people (13 added)

## wefollow.rb

1. Get [WeFollow](http://wefollow.com) page for specified tag.
2. Parse it and extract users.
3. Follow them.

Example:

    $ ./wefollow.rb iphonedev

    [*] Parsing WeFollow and following
    username: haqu
    tag: iphonedev

    targets
    1   148Apps
    2   Touch_Reviews
    3   Peropaal
    4   gogogic
    5   iphonedevsdk
    6   erif
    7   MobileOrchard
    8   jeanmarcgulliet
    9   jamescampbell
    10  LarryRubin
    11  SecretsHQ
    12  pschlup
    13  Superbad24
    14  mdhughes
    15  148apps_newapps
    16  DarinPope
    17  jarinudom
    18  jeff148apps
    19  phatblat
    20  digitalhobbit
    21  mikevpark
    22  EeKayOnline
    23  enormego
    24  jackivers
    25  jdg

    haqu follows 47 people (25 added)

## unfollow.rb

Unfollow users who don't follow you back.

Example:

    $ ./unfollow.rb 

    [*] Unfollowing
    username: games_mix
    
    1   prefeed
    2   top_soft
    3   os555feed
    4   fashionpoint
    5   cavalliblog
    6   fashiondelicio
    7   fashion_retweet
    8   WordPuzzlesRock
    9   blaineglobal
    10  ohfreegames
    
    haqu follows 37 people (10 removed)
