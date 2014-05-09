#= require jquery

jQuery ($) ->

  $('#search_submit').click () ->
    $(this).prop('disabled', true)
    $(this).prop('value', 'wait...')

    $.ajax
      url: '/search',
      data: { search_text: $('#search_text').prop('value') },
      dataType: 'json',
      type: 'get'
      success: (response) ->
        console.log(response)
      complete: () ->
        $(this).prop('disabled', false)
        $(this).prop('value', 'Search')
