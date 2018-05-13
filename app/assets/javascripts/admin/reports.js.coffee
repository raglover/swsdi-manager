# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.submitOnCheck = ->
  @find('input[type=checkbox]').click ->
    $(this).parents('form').submit()
    if $(this).is(':checked')
    	$(this).siblings('label').children('i').removeClass('disabled')
    	$(this).siblings('label').children('i').addClass('enabled')
    else if not $(this).is(':checked')
    	$(this).siblings('label').children('i').removeClass('enabled')
    	$(this).siblings('label').children('i').addClass('disabled')
  this

jQuery(".reports.registration").ready ->
  $('.edit_camp_application').submitOnCheck()
  this