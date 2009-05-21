# Twitter Tools

Template for config.yaml

    username: <twitter_username>
    password: <twitter_password>

Installing chirpy

    $ git clone git://github.com/ashrewdmint/chirpy.git
    $ cd chirpy
    $ gem build chirpy.gemspec
    $ sudo gem install chirpy-x.x.x.gem

## search-follow.rb

Search and follow users.

Example:

    $ ./search-follow.rb "iphone game development"

    [*] Searching and following
    username: haqu
    search query: "iphone game development"

    targets
    1  oneofus
    2  DistinctiveGame
    3  applesecrets
    4  iPhone_Games
    5  Xgamess
    6  gaming_agg
    7  bernadep
    8  gamesnewsnet
    9  Exiledblog
    10 funkastik
    11 VideoGameFeed
    12 TechnoNews
    13 kotakufeed

    haqu following 48 users (13 added)

## wefollow.rb

Extract and follow users from WeFollow.com directory.

Example:

    $ ./wefollow.rb iphonedev

    [*] Parsing WeFollow and following
    username: haqu
    tag: iphonedev

    targets
    1  148Apps
    2  Touch_Reviews
    3  Peropaal
    4  gogogic
    5  iphonedevsdk
    6  erif
    7  MobileOrchard
    8  jeanmarcgulliet
    9  jamescampbell
    10 LarryRubin
    11 SecretsHQ
    12 pschlup
    13 Superbad24
    14 mdhughes
    15 148apps_newapps
    16 DarinPope
    17 jarinudom
    18 jeff148apps
    19 phatblat
    20 digitalhobbit
    21 mikevpark
    22 EeKayOnline
    23 enormego
    24 jackivers
    25 jdg

    haqu following 47 users (25 added)
