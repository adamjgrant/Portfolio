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
    when "home" then $category = undefined
    else $category = 0

  # If this is not the home page...
  if $category != undefined
    # Set active menu item
    for $navitem in k$.$$('.navigation li a')
      if parseInt($navitem.dataset.category) == $category
        $navitem.classList.add 'active'

    # Let's filter out the category entry with that id.
    $category = (A$.categories.filter (v) -> v.id == $category)[0]
    
    # Now that we have the right category, we can bind our header.
    $template.querySelector('.page-details h1').innerHTML = $category.name
    $template.querySelector('.page-details h2').innerHTML = $category.lead
    $template.querySelector('.page-details h3').innerHTML = $category.desc

    # Done, throw that in render.
    k$.$('.render').innerHTML = ''
    render $template.querySelector('.page-details')

    # Let's filter out the projects for this category.
    $projects = A$.projects.filter (v) -> v.category == $category.id

  else
    $projects = A$.projects.filter (v) -> v.showOnHomePage == true
    k$.$('.render').innerHTML = ''

  # Bind project properties to appropriate fields
  for $project in $projects
    $_template = $template.cloneNode true
    $project_title = $_template.querySelector('.page-content h1')
    $project_title.innerHTML = $project.name

    if $project.linkUrl.length
      $project_link = document.createElement('a')
      $project_link.href = $project.linkUrl
      $project_title.parentNode.insertBefore $project_link, $project_title.parentNode.firstChild
      $project_link.appendChild $project_title

    $_template.querySelector('.page-content h2').innerHTML = $project.shortDesc
    $_template.querySelector('.page-content .technologies').innerHTML = $project.technologies

    render $_template.querySelector('.tl-spine')

  # Now that we're done, let's just remove the template div.
  $template.parentNode.removeChild($template)


module.exports = bind
