$ ->
  $(".js-submit").click ->
    a = $(".js-agora-vai").filter( (f) ->
      return $(this).val() && $(this).data("user") == parseInt($('#current_user_id').val()))
    if !a
      return
    data = []
    a.each( (f) ->
      data.push({
        "id": $(this).data("id"),
        "user": $(this).data("user")
      })
    )

    header = {
      "X_CSRF_TOKEN": $("meta[name='csrf-token']").attr("content"),
      "Content-Type": "application/json",
    }
    $.ajax({
      type: "POST",
      url: "/evaluate",
      data: JSON.stringify({ data: data }) ,
      headers: header,
      dataType: "json",
      success: (data) ->
        # hide
      })
