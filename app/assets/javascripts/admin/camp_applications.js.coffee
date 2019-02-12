jQuery.fn.submitAppOnCheck = ->
  @find('input[type=checkbox]').click ->
    $(this).closest('form').submit()
    if $(this).is(':checked')
      $(this).next('label').children('i').removeClass('disabled')
      $(this).next('label').children('i').addClass('enabled')
    else if not $(this).is(':checked')
      $(this).next('label').children('i').removeClass('enabled')
      $(this).next('label').children('i').addClass('disabled')
    
    console.log $(this).attr('name')

    if $(this).attr('name') == 'camp_application[incomplete]'
      $(this).closest('div').find('.infotext').slideToggle()
      $(this).closest('div').find('.button').click ->
        $(this).closest('form').submit()
        $(this).closest('div').slideToggle()
        this

  this

jQuery(".camp_applications.index").ready ->
  $('.edit_camp_application').submitAppOnCheck()
  this