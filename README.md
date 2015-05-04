# Deployment

Deployment is activated with codeship by pushing to master. Once the master branch is pushed, the public/img/ directory will also be uploaded to http://cdn.everything.io/portfolio/img.

# Projects

Projects are stored in projects.coffee.
`category` is a deprecated attribute for a project. I'm moving towards `categories` which allows you
to list an item in multiple categories. If the categories attribute is present on the project,
the binding will use that, otherwise, it falls back on `category`.

See categories.coffee to link a number to a category.
