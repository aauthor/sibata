# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.amount_fast_fill').click (e)->
    fast_amount = parseFloat $(this).data('amount')
    current_amount = parseFloat $('#line_item_amount').val() || 0
    $('#line_item_amount').val(current_amount + fast_amount)
    true

