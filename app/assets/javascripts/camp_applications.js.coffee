# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$('#A').find('input:checkbox').change ->
  if $(this).prop('checked')
    $('#C').find('input:checkbox').prop('disabled', true)
    $("#A").find('input:checkbox').not(this).prop('disabled', true)
  else
    $('#C').find('input:checkbox').prop('disabled', false) unless $("#B").find('input:checkbox').is(':checked')
    $("#A").find('input:checkbox').not(this).prop('disabled', false)

$('#B').find('input:checkbox').change ->
  if $(this).prop('checked')
    $('#C').find('input:checkbox').prop('disabled', true)
    $("#B").find('input:checkbox').not(this).prop('disabled', true)
  else
    $('#C').find('input:checkbox').prop('disabled', false) unless $("#A").find('input:checkbox').is(':checked')
    $("#B").find('input:checkbox').not(this).prop('disabled', false)

$('#C').find('input:checkbox').change ->
  if $(this).prop('checked')
    $('#A').find('input:checkbox').prop('disabled', true)
    $('#B').find('input:checkbox').prop('disabled', true)
    $('#C').find('input:checkbox').not(this).prop('disabled', true)
  else
    $('#A').find('input:checkbox').prop('disabled', false)
    $('#B').find('input:checkbox').prop('disabled', false)
    $('#C').find('input:checkbox').not(this).prop('disabled', false)
