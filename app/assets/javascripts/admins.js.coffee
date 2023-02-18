# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/

# $ ->
#   $('select#admin_role').on 'change', ->
#     form = $(this).closest('form')
#     url = form.attr('action')
#     data = form.serialize()
#     console.log form
#     console.log url
#     console.log data
#     $.ajax
#       url: url
#       type: "PATCH"
#       dataType: "json"
#       data: data
#       success: (data) ->
#         console.log "Administrator Role updated successfully"
#       error: (jqXHR, textStatus, errorThrown) ->
#         console.log "Error updating admin"