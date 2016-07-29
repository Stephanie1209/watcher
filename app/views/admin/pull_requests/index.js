$(".open").click(function() {
  $(".pull_requests_section").html("<%= escape_javascript(render 'pull_requests_section', pull_requests: @pull_requests.where(status: "open")) %>")
});

$(".closed").click(function() {
  $(".pull_requests_section").html("<%= escape_javascript(render 'pull_requests_section', pull_requests: @pull_requests.where(status: "closed")) %>")
});

$(".all").click(function() {
  $(".pull_requests_section").html("<%= escape_javascript(render 'pull_requests_section', pull_requests: @pull_requests) %>")
});
