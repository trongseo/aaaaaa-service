// JavaScript Document
function tabTrack_nok(click_id,id,lang){	
	for(var i=0; i<arr_introduce.length; i++){
		var introduce= "introduce"+arr_introduce[i][0]; 
		var introduce = document.getElementById(introduce);		
	   if(click_id==arr_introduce[i][0]){
			 introduce.className = 'name_bar_current';
			 introduce.style.cursor = 'default';
	   }else{
		   introduce.className = 'name_bar';
		   introduce.style.cursor = 'hand';  
	   }
	}
	introduces.location.href ='inc_introduce.php?lang='+lang+'&id='+id;
	return;
}


function tabTrack(click_id,id,lang){		
	introduces.location.href ='inc_introduce.php?lang='+lang+'&id='+id;
	return;
}
function tabJob(click_id,id,lang){	
	for(var i=0; i<arr_job.length; i++){
		var job= "job"+arr_job[i][0]; 
		var job = document.getElementById(job);		
	   if(click_id==arr_job[i][0]){
			 job.className = 'name_bar_current';
			 job.style.cursor = 'default';
	   }else{
		   job.className = 'name_bar';
		   job.style.cursor = 'hand';  
	   }
	}
	jobs.location.href ='inc_job.php?lang='+lang+'&id='+id;
	return;
}