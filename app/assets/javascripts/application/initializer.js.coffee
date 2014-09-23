$ ->

  $('.modal-overlay').on 'click', ->
    $('#cart-modal').hide()
    $('#filter-modal').hide()
    $('#article-modal').hide()
    $('#get-call-modal').hide()
    $('.modal-overlay').hide()

  $('.order-call').on 'click', ->
    $('.modal-overlay').show()

    $('.modal-overlay').on 'click', ->
      $('#get-call-modal').hide()

    $('#get-call-modal').show()