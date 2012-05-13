# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

deleteLinks = (e)->
    e.preventDefault()
    ids = []
    remove_links = []
    regExp = new RegExp(/youtube_link_(\d*)/)
    all_links = $("#bookmarks tbody tr").map (idx, link_row)-> link_row
    $('#delete_youtube_link', all_links).each (index,check)->
      remove_links.push($(check).parents('tr')) && ids.push( remove_links[remove_links.length - 1].attr('id').match(regExp)[1]) if $(check).attr('checked') isnt undefined
    

    $.ajax({
      type: 'delete'
      data: { ids: ids }
      dataType: 'json'
      url: "/youtube_links/mass_remove"
      success: (result)->
          link.remove() for link in remove_links

    }) if ids.length > 0

nameForLink = (link_id, link_element)->
  url = "http://gdata.youtube.com/feeds/api/videos/#{link_id}?v=2&alt=json"
  $.ajax({
    dataType: 'json'
    url: url
    success: (result)-> 
      title = result.entry.title.$t
      $('a',link_element).html(title)
  })

fetchVideoNames = ()->
  link_elements = $('#bookmarks td:nth-child(2)' )
  names = []
  for link_elem in link_elements
    link_id = $(link_elem).data('id')
    nameForLink(link_id, link_elem)

$ ->
  $('#delete_checked_links').click deleteLinks
  fetchVideoNames()
