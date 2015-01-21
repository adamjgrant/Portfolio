bind = ->
  # Let's set the template area as our paintbucket for drawing in .render
  $template = k$.$('main.main .template')
  # By default, we'll set our category as "delights"
  $category = 0
  # We'll use the render function to throw things in the view
  render = ($html) ->
    k$.$('.render').appendChild $html

  # But let's read the page to see what the title actually is.
  switch k$.$('.render').dataset.page
    when "mobile" then $category = 1
    when "development" then $category = 2
    when "design" then $category = 3

  # Let's filter out the category entry with that id.
  $category = (A$.categories.filter (v) -> v.id == $category)[0]

  # Now that we have the right category, we can bind our header.
  $template.querySelector('.page-details h1').innerHTML = $category.name
  $template.querySelector('.page-details h2').innerHTML = $category.lead
  $template.querySelector('.page-details h3').innerHTML = $category.desc

  # Done, throw that in render.
  render($template.querySelector('.page-details'))

  console.log $category

module.exports = bind
