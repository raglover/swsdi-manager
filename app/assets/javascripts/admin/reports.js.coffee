# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.submitOnCheck = ->
  @find('input[type=checkbox]').click ->
    $(this).parents('form').submit()
    $(this).parents('tr').hide()
    $(this).parents('dd').find('.count').text (i, txt) ->
      parseInt(txt, 10) - 1
  this

jQuery ->
  $('.edit_camp_application').submitOnCheck()
  this