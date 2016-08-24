ready = ->

  $('.container').on 'click', ".since-date-picker", (e) ->
    $(this).find(".ui-datepicker").show()
    $(this).datepicker({
      dateFormat: "d M y"
      altFormat: "yy-mm-dd"
      altField: ".since_field"
      onSelect: (dateText, inst) ->
        date = $(this).val()
        calendarDay = $(this).find(".calendar-day")
        calendarMonth = $(this).find(".calendar-month")
        calendarDay.html(date.split(" ")[0])
        calendarMonth.html(date.split(" ")[1])
        $(this).find(".ui-datepicker").hide()
    })
  $('.container').on 'click', ".until-date-picker", (e) ->
    $(this).find(".ui-datepicker").show()
    $(this).datepicker({
      dateFormat: "d M y"
      altFormat: "yy-mm-dd"
      altField: ".until_field"
      onSelect: (dateText, inst) ->
        date = $(this).val()
        calendarDay = $(this).find(".calendar-day")
        calendarMonth = $(this).find(".calendar-month")
        calendarDay.html(date.split(" ")[0])
        calendarMonth.html(date.split(" ")[1])
        $(this).find(".ui-datepicker").hide()
    })

$(document).ready(ready)
$(document).on('page:load', ready)
