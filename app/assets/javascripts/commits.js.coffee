$ ->
  $(document).on 'change', '#find_by_branch', (evt) ->
    $.ajax 'commits',
      type: 'GET'
      dataType: 'script'
      data: {
        branch_id: $("#find_by_branch option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic branch select OK!")
