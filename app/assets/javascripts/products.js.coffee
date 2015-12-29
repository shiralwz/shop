# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(".editProductLink")
    .on "ajax:success", (e, data, status, xhr) ->
      $('#alert-content').hide()
      $('#editProductFormModal').modal('show')
      $('#editProductName').val(data['name'])
      $('#editProductPrice').val(data['price'])
      $('#editProductDescription').val(data['description'])
      $("#editProductForm").attr('action', '/products/'+data['id'])


  $("#editProductForm")
    .on "ajax:success", (e, data, status, xhr) ->
      $('#editProductFormModal').modal('hide')
      $('#product_'+data['id']+'_name').html(  data['name'] )
      $('#product_'+data['id']+'_price').html(  data['price'] )
      $('#product_'+data['id']+'_description').html(  data['description'] )
    .on "ajax:error", (e, xhr, status, error) ->
      $('#alert-content').show()
      $('#alert-content #msg').html( xhr.responseText )

