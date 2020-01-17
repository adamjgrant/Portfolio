# Installation

`make`

# Preview

`make watch`

# Deployment

Deployment is activated with codeship by pushing to master. Once the master branch is pushed, the public/img/ directory will also be uploaded to http://cdn.everything.io/portfolio/img.

# Projects

Projects are stored in projects.coffee.
`category` is a deprecated attribute for a project. I'm moving towards `categories` which allows you
to list an item in multiple categories. If the categories attribute is present on the project,
the binding will use that, otherwise, it falls back on `category`.

See categories.coffee to link a number to a category.

# Troubleshooting

## TypeError: require.extensions.hasOwnProperty is not a function

You need an older version of node. So [nvm is required](https://github.com/nvm-sh/nvm/blob/master/README.md).

1. `make install_nvm`
2. `rm -rf package-lock.json`
3. `nvm install v6.11.2 && nvm use --delete-prefix v6.11.2 && rm -rf node_modules && make`

Using https://github.com/tjunnone/npm-check-updates/issues/367 I just uninstalled gulp with `npm uninstall -g gulp` and then run `make` again.

After this, you'll still get errors, but I at least got gulp watch to work.

## linker command failed with exit code 1 (use -v to see invocation) 

https://github.com/Blizzard/node-rdkafka/issues/419

`CFLAGS=-I/usr/local/opt/openssl/include LDFLAGS=-L/usr/local/opt/openssl/lib npm install -g gulp`

(Haven't resolved this one yet)

## gulp docs:test[94619]: ../src/node_contextify.cc:635:static

1. `rm -rf node_modules`
2. `npm i natives`
