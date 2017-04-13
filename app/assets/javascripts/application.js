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
	for (i=0; i<d.length;i++){
		click=function(event){
			event.preventDefault();
			console.log("ajax");
			$.ajax({
				url: '/question_follow_mapping',
				method: 'POST',
				data:{id: this.id.slice(9)},
				success:function(data){
					console.log("ajax called sucess")
					console.log(this);
					id_name="question_"+ data.question_id
					element=document.getElementById(id_name)
					d=document.getElementById(id_name+"-followers-numbers")
					d.innerText=""+data.number_of_followers
					if (data.followed==true){
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
	questionUpvoteElements=document.getElementsByClassName("upvote-question")
questionUpvoteElementsLength=questionUpvoteElements.length
for (i=0;i<questionUpvoteElementsLength;i++){
	upvoteClick=function(event){
		event.preventDefault();
		questionId=this.id.slice(16);
		$.ajax({
			url:'/question_upvote_mapping',
			method:'POST',
			data:{id: questionId},
			success: function(data){
				element=document.getElementById("upvote_question_"+questionId)
				if (data["upvote"]==true){	
					element.innerText="Upvoted"
				}	
				else{
					element.innerText="Upvote"
					}	
				},
			error:function(){
				console.log("connection error");
			}
		})


	}
	questionUpvoteElements[i].addEventListener("click",upvoteClick.bind(questionUpvoteElements[i]));
}

questionDownvoteElements=document.getElementsByClassName("downvote-question")
questionDownvoteElementsLength=questionDownvoteElements.length
for (i=0;i<questionDownvoteElementsLength;i++){
	downvoteClick=function(data){
		event.preventDefault();
		questionId=this.id.slice(18)
		$.ajax({
			url:'/question_downvote_mapping',
			method:'POST',
			data:{id:questionId},
			success:function(data){
				element=document.getElementById("downvote_question_"+questionId);
				if (data.downvote==true){
					element.innerText="Downvoted"
				}
				else{
					element.innerText="Downvote"
				}

			},
			error:function(){
				console.log("connection error");
			}
		})
	}
	questionDownvoteElements[i].addEventListener("click",downvoteClick.bind(questionDownvoteElements[i]))
}

elements=document.getElementsByClassName("answer-button")
	for(i=0;i<elements.length;i++){
		elements[i].addEventListener("click",function(){
			console.log("asd");
			location.reload();
		})
	}
}
window.addEventListener("load",function(event){
	onBodyLoad();
}
);