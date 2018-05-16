# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.submitOnCheck = ->
  @find('input[type=checkbox]').click ->
    $(this).closest('form').submit()
    if $(this).is(':checked')
    	$(this).next('label').children('i').removeClass('disabled')
    	$(this).next('label').children('i').addClass('enabled')
    else if not $(this).is(':checked')
    	$(this).next('label').children('i').removeClass('enabled')
    	$(this).next('label').children('i').addClass('disabled')
    
    if $(this).attr('name') == "camp_application[checked_in]"
    	$(this).closest('tr').fadeOut()
    	$(this).closest('dd').find('.count').text (i, txt) ->
      		parseInt(txt, 10) - 1
  this

jQuery(".reports.registration").ready ->
  $('.edit_camp_application').submitOnCheck()
  this