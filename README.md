g
=

Really simple bash scripts to work with go projects. Using basecamp/subs to create simple scripts https://github.com/basecamp/sub


# Usage

cd into the folder you want your project to use and run
```

# Start a project
$ mkdir ~/myproject
$ cd ~/myproject

# g start will create a _vendor folder where deps will go and a golangdeps textfile were we keep track of deps
# you can commit this file to source control
$ g start

# add a dependency
$ g get github.com/crowdmob/goamz/s3

# add a dependency with a specific commit
$ g get github.com/garyburd/redigo/redis e30d52b4c93dfe487c

# run main.go ... it automatically finds your go project by going up until it finds a golangdeps 
# and sets that as your GOPATH
$ g run main.go

# if you clone your project somewhere else just run 'g resolve'
$ g resolve 
Resolving github.com/crowdmob/goamz/s3
Resolving github.com/garyburd/redigo/redis e30d52b4c93dfe487c

```

