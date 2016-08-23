// $(".menu").click(function(){
//   $(".menu .dropdown").toggle();
// });
// $(".user").click(function(){
//   $(".user .dropdown").toggle();
// });

// $("html:not(.since-date-picker), body:not(.until-date-picker)").click(function(e) {
// 	$(".ui-datepicker").hide();
// 	console.log("hola")
// });

// $(".since-date-picker, .until-date-picker").click(function(e) {
//     e.stopPropagation();
// });

$(document).click(function(event) { 
    if(!$(event.target).closest('.since-date-picker').length) {
        if($(".ui-datepicker").is(":visible")) {
            $(".ui-datepicker").hide();
        }
    }        
})