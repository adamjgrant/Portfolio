bind = ->
  # Let's set the template area as our paintbucket for drawing in .render
  $template = k$.$('main.main .template')
  # By default, we'll set our category as "delights"
  $category = 0
  # We'll use the render function to throw things in the view
  render = ($html) ->
    k$.$('.render').appendChild $html


  if typeof(k$.$('.render').dataset.page) == "string"
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

    # If that is the home page
    else
      $projects = A$.projects.filter (v) -> v.showOnHomePage == true
      k$.$('.render').innerHTML = ''

    # Bind project properties to appropriate fields
    for $project in $projects
      $_template = $template.cloneNode true
      $project_title = $_template.querySelector('.page-content h1 a')
      $project_title.innerHTML = $project.name
      $category_name = (A$.categories.filter (v) -> v.id == $project.category)[0].slug
      $project_slug = `$project.name.toLowerCase().replace(/ /g,'-').replace(/[^\w-]+/g,'')`
      $project_title.href = "/#{$category_name}/#{$project_slug}"

      if $project.linkUrl.length
        $link = $_template.querySelector('p.link')
        $link.classList.add 'show'
        $link.innerHTML = "<a href='#{$project.linkUrl}'>#{$project.linkLabel}</a>"

      $_template.querySelector('.page-content h2').innerHTML = $project.shortDesc
      $_template.querySelector('.page-content .technologies span').innerHTML = $project.technologies
      $_template.querySelector('.page-content .tl-spine-dot-marker-yearFlag').innerHTML = $project.year


      render $_template.querySelector('.tl-spine')

  if typeof(k$.$('.render').dataset.pageId) == "string"
    $project = (A$.projects.filter (v) -> v.id == parseInt(k$.$('.render').dataset.pageId))[0]

    $template.querySelector('.page-details h1').innerHTML = $project.name
    $template.querySelector('.page-details h2').innerHTML = $project.shortDesc
    $template.querySelector('.page-details h3').innerHTML = $project.year

    render $template.querySelector('.page-details')


  # Now that we're done, let's just remove the template div.
  $template.parentNode.removeChild($template)

  # supportsTouch = 'ontouchstart' in window || navigator.msMaxTouchPoints
  # if not supportsTouch
  #   for $spine in k$.$$('.tl-spine')
  #     $spine.classList.add 'hoverable'

module.exports = bind
