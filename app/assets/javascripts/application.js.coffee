#= require jquery

jQuery ($) ->

  $('#search_submit').click () ->

    if $('#search_text').prop('value').length == 0
      alert "We can't find things without a keyword!"
      return

    $(this).prop('disabled', true)
    $(this).prop('value', 'wait...')

    $.ajax
      url: '/search',
      data: { search_text: $('#search_text').prop('value') },
      dataType: 'json',
      type: 'get'
      success: (response) ->
        displaySearchResults $('table#results'), response
      complete: () ->
        $('#search_submit').prop('disabled', false)
        $('#search_submit').prop('value', 'Search')


  displaySearchResults = (table, images) ->
    $('.row', table).remove()
    while images.length > 0
      row = $('tr.template').clone()
      row.removeClass('template').addClass('row')
      $('td', row).each () ->
        insertFoundImage $(this), images.pop()
      table.append(row)

  insertFoundImage = (td, img) ->
    if img
      image_el = $("<a href='#{img.big_url}' target='_blank'><img src='#{img.thumbnail_url}'></a>")
      image_el.hide()
      td.append image_el
      image_el.fadeIn(1000)
