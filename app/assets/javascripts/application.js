// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
  $('#new_item').on('submit', function(event){
    event.preventDefault();
    var form = $(this);
    var name = $('#item_name').val();
		var listId = $('#item_list_id').val();

    $.ajax({
      url: '/lists',
      method: form.attr('method'),
      data: {
        "item": {
        "name": name,
				"listId": listId,
        }
      },
      dataType: "json",
      success: function(data) {
        console.log(data);
				var div = $('div.items-holder')
			  var title =  '<div class="inner-1">'+data.name+'</div><br>';
        div.append(name);
        $(':text').val('');
      },
      error: function(){
        alert("You made that item already!");
      }
    });
  });


//


	$('#new_list').on('submit', function(event){
		event.preventDefault();
		var form = $(this);
		var title = $('#list_title').val();

		$.ajax({
			url: form.attr('action'),
			method: form.attr('method'),
			data: {
				"list": {
				"title": title,
				}
			},
			dataType: "json",
			success: function(data) {
				console.log(data);
				var div = $('div.titles-holder')
				var title =  '<div class="inner-1">'+data.title+'</div><br>';
				div.append(title);
				$(':text').val('');
			},
			error: function(){
				alert("You made that list already!");
			}
		});
	});






	$(document).ready(function(){
		$(".titles-holder .inner-1").css("cursor","pointer");
		$(".items-holder .inner-1").css("display","none");
		$(".titles-holder .inner-1").click(function(){
		   $(".items-holder .inner-1").css("display","none");
		$(".items-holder .inner-1[list='"+$(this).attr('id')+"']").css("display","block");
		});
	});

});



// Handler for making appropriate items appear by list on click
