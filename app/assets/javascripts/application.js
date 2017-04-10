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
//= require turbolinks
//= require_tree .

function onBodyLoad(){
	d = document.getElementsByClassName("follow_question");	
	console.log(d);
	for (i=0; i<d.length;i++){
		click=function(event){
			event.preventDefault();
			$.ajax({
				url: '/question_follow_mapping',
				method: 'POST',
				data:{id: this.id.slice(9)},
				success:function(data){
					id_name="question_"+ data.question_id
					console.log(id_name)
					element=document.getElementById(id_name)
					d=document.getElementsByClassName("question_#{data.question_id}-follow-numbers")
					console.log(id_name)
					d.innerText=""+data.number_of_followers
					if (data["followed"]==true){
						element.innerText="Unfollow";
					}
					else{
						element.innerText="Follow";
					}
				},
				error:function(){
					console.log("not connected to server")
					console.log(this);
				}
			})
			
		}
		d[i].addEventListener("click",click.bind(d[i]));
	}
}
window.addEventListener("load",function(event){
	onBodyLoad();
});