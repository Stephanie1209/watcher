ready = ->

$(".since-date-picker").on "click", (e) ->
	$(this).datepicker({
		dateFormat: "d M y"
		altFormat: "yy-mm-dd"
		altField: ".since_field"
		autoclose: true
		onSelect: (dateText, inst) ->
			date = $(this).val()
			calendarDay = $(this).find(".calendar-day")
			calendarMonth = $(this).find(".calendar-month")
			calendarDay.html(date.split(" ")[0])
			calendarMonth.html(date.split(" ")[1])
	});

$(".until-date-picker").on "click", (e) ->
	$(this).datepicker({
		altField: ".until_field"
		dateFormat: "d M y"
		altFormat: "yy-mm-dd"
		onSelect: (dateText, inst) ->
			date = $(this).val()
			calendarDay = $(this).find(".calendar-day")
			calendarMonth = $(this).find(".calendar-month")
			calendarDay.html(date.split(" ")[0])
			calendarMonth.html(date.split(" ")[1])	
	});


$(document).ready(ready)
$(document).on('page:load', ready)