# Twitter Tools

Before using these tools please consider reading [Twitter's Terms of Service][1] and [Rate limiting][2].

[1]: http://twitterapi.pbworks.com/Terms-of-Service
[2]: http://twitterapi.pbworks.com/Rate-limiting

Twitter tools requires chirpy:

    $ git clone git://github.com/ashrewdmint/chirpy.git
    $ cd chirpy
    $ gem build chirpy.gemspec
    $ sudo gem install chirpy-<version>.gem

Template for config.yaml

    username: <twitter_username>
    password: <twitter_password>

## Usage Examples

    $ ./post.rb "message"

    $ ./follow-users.rb user1 user2 user3
    $ ./follow-users.rb < userlist.txt
  
    $ ./follow-from-search.rb "search query"

    $ ./follow-from-wefollow.rb tag

    $ ./unfollow-users.rb user1 user3
    $ ./unfollow-users.rb < userlist.txt
    
    ./unfollow-not-followers.rb

More details below.

## post.rb

Example:

    $ ./post.rb "testing post.rb from twitter-tools"
    
    [*] Posting message
    username: exampler
    
    testing post.rb from twitter-tools
    
    done

## follow-users.rb

Example:

    $ ./follow-users.rb prefeed top_soft os555feed

    [*] Following users
    username: exampler
    users count: 3

    1   prefeed
    2   top_soft
    3   os555feed

    exampler follows 47 people (3 added)

## follow-from-search.rb

1. Search latest messages based on query (exact match).
2. Extract authors of these messages.
3. Follow them.

Use [Twitter Search](http://search.twitter.com) to prepare search query.

Example:

    $ ./follow-from-search.rb "iphone game development"

    [*] Following users from twitter search
    username: exampler
    search query: "iphone game development"

    targets
    1   oneofus
    2   DistinctiveGame
    3   applesecrets
        ...
    13  kotakufeed

    exampler follows 48 people (13 added)

## follow-from-wefollow.rb

1. Get [WeFollow](http://wefollow.com) page for specified tag.
2. Parse it and extract users.
3. Follow them.

Example:

    $ ./follow-from-wefollow.rb iphonedev

    [*] Following users from WeFollow directory
    username: exampler
    tag: iphonedev

    targets
    1   148Apps
    2   Touch_Reviews
    3   Peropaal
        ...
    25  jdg

    exampler follows 47 people (25 added)

## unfollow-users.rb

Example:

    $ ./unfollow-users.rb prefeed top_soft os555feed

    [*] Unfollowing users
    username: exampler
    users count: 3

    1   prefeed
    2   top_soft
    3   os555feed

    exampler follows 44 people (3 removed)

## unfollow-not-followers.rb

Unfollowing those who don't follow you back.

Example:

    $ ./unfollow-not-followers.rb 

    [*] Unfollowing those who don't follow you back
    username: exampler
    
    1   prefeed
    2   top_soft
    3   os555feed
        ...
    10  ohfreegames
    
    exampler follows 37 people (10 removed)
