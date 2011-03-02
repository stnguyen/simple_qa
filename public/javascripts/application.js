$('a[data-remote=true]').livequery('click', function() {
    $.ajax({ 
      url: this.href, 
      dataType: "script"
    }); 
    return false; 
});
 

$('form[data-remote=true]').livequery('submit', function() {
  return request({ url : this.action, type : this.method, data : $(this).serialize() });
});

$(function() {
  $(".alert").click(function() {
    alert(this.getAttribute("data-confirm"));
    return false;
  })
})


