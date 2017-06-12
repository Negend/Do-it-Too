$(loaded)
function loaded (){
console.log('jimini cricket')

prettyStars()







// function prettyStar (){
// 	$('.rate').each(function(i,event){		
// 		for(var x = 0; x = i; x++){
// 		$($('.rate')[x]).hover(
									
// 				function () {
// 				  $(this).css({"color":"red"})
// 				}, 	
// 				function () {
// 				  $(this).css({"color":"blue"})
// 				}
// 			)
// 		}		
// 	})
// }


// function prettyStar (){
// 	$('.rate').each(function(i,event){				
// 		$(this).hover(
									
// 				function () {

// 				  $(this).css({"color":"red"})
// 				}, 	
// 				function () {
// 				  $(this).css({"color":"blue"})
// 				}
// 			)
// 		}		
// 	})
// }

function prettyStars (){
	$('.rate').each(function(index,event){				
		$(this).click(function(event){
			$('.rate').each(function(index,event){
				this.css({'display':'inline-block'})
			})
		}) 											
	})
}


function prettyStar (){
	$('.rate').each(function(index,event){				
		$(this).hover(									
			function(){
			},
			function(){} 					
		)				
	})
}








function starChange(color,i){
	for(var x = 0; x = 3; x++){
		$($('.rate')[x]).css({"color" : color})	
	}
}	
















}



















