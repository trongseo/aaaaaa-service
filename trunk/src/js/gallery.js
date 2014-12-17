	/************************************************************************************************************
	(C) www.dhtmlgoodies.com, November 2005
	
	This is a script from www.dhtmlgoodies.com. You will find this and a lot of other scripts at our website.	
	
	Terms of use:
	You are free to use this script as long as the copyright message is kept intact. However, you may not
	redistribute, sell or repost it without our permission.
	
	Thank you!
	
	www.dhtmlgoodies.com
	Alf Magne Kalleland
	
	************************************************************************************************************/
	var arrowImageHeight = 35;	// Height of arrow image in pixels;
	var displayWaitMessage=true;	// Display a please wait message while images are loading?
	
	var previewImage = false;
	var previewImageParent = false;
	var slideSpeed = 0;
	var previewImagePane = false;
	var slideEndMarker = false;
	var galleryContainer = false;
	var imageGalleryCaptions = new Array();
	function getTopPos(inputObj)
	{		
	
	  var returnValue = inputObj.offsetTop;
	  while((inputObj = inputObj.offsetParent) != null)returnValue += inputObj.offsetTop;
	  return returnValue;
	}
	
	function getLeftPos(inputObj)
	{

	  var returnValue = inputObj.offsetLeft;
	  while((inputObj = inputObj.offsetParent) != null)returnValue += inputObj.offsetLeft;
	  return returnValue;
	}
		
	function showPreview(newSrc,imageIndex,title,code,detail,price,id)
	{
		if(!previewImage){
			var images = document.getElementById('previewPane').getElementsByTagName('IMG');
			if(images.length>0){
				previewImage = images[0];
			}else{
				previewImage = document.createElement('IMG');
				document.getElementById('previewPane').appendChild(previewImage);	
			}
		}
		if(displayWaitMessage){
			document.getElementById('waitMessage').style.display='inline';
		}
		document.getElementById('largeImageCaption').style.display='none';
		//previewImage.onload = function() { hideWaitMessageAndShowCaption(imageIndex-1); };				
		//product_name.firstChild.nodeValue=title;
		previewImage.src = newSrc;
		document.getElementById('product_name').innerHTML=title; 
		document.getElementById('product_code').innerHTML=code; 
		document.getElementById('product_detail').innerHTML=detail; 
		document.getElementById('product_name_1').innerHTML=title; 
		document.getElementById('product_price').innerHTML=price; 
		document.getElementById('product_id').setAttribute("value",id); 
	}
	function hideWaitMessageAndShowCaption(imageIndex)
	{
		document.getElementById('waitMessage').style.display='none';	
		document.getElementById('largeImageCaption').innerHTML = imageGalleryCaptions[imageIndex];
		document.getElementById('largeImageCaption').style.display='block';
		
	}	
	function initSlide(e)
	{
		if(document.all)e = event;
		
		if(this.src.indexOf('over')<0)this.src = this.src.replace('.gif','-over.gif');
		
		slideSpeed = e.clientY + Math.max(document.body.scrollTop,document.documentElement.scrollTop) - getTopPos(this);
		if(this.src.indexOf('down')>=0){
			slideSpeed = (slideSpeed)*-1;	
		}else{
			slideSpeed = arrowImageHeight - slideSpeed;
		}
		slideSpeed = Math.round(slideSpeed * 10 / arrowImageHeight);
	}
	
	function stopSlide()
	{		
		slideSpeed = 0;
		this.src = this.src.replace('-over','');
	}
	
	function slidePreviewPane()
	{
		if(slideSpeed!=0){
			var topPos = previewImagePane.style.top.replace(/[^\-0-9]/g,'')/1;	
		
			if(slideSpeed<0 && slideEndMarker.offsetTop<(previewImageParent.offsetHeight - topPos)){
				slideSpeed=0;
			
			}
			topPos = topPos + slideSpeed;
			if(topPos>0)topPos=0;

		 	previewImagePane.style.top = topPos + 'px';
	 	
		}
	 	setTimeout('slidePreviewPane()',30);		
	}
	
	function revealThumbnail()
	{
		this.style.filter = 'alpha(opacity=100)';
		this.style.opacity = 1;
	}
	
	function hideThumbnail()
	{
		this.style.filter = 'alpha(opacity=50)';
		this.style.opacity = 0.5;
	}
	
	function initGalleryScript()
	{
		previewImageParent = document.getElementById('theImages');
		previewImagePane = document.getElementById('theImages').getElementsByTagName('DIV')[0];
		previewImagePane.style.top = '0px';
		galleryContainer  = document.getElementById('galleryContainer');
		var images = previewImagePane.getElementsByTagName('IMG');
		for(var no=0;no<images.length;no++){
			images[no].onmouseover = revealThumbnail;
			images[no].onmouseout = hideThumbnail;
		}	
		slideEndMarker = document.getElementById('slideEnd');
		
		document.getElementById('arrow_up_image').onmousemove = initSlide;
		document.getElementById('arrow_up_image').onmouseout = stopSlide;
		
		document.getElementById('arrow_down_image').onmousemove = initSlide;
		document.getElementById('arrow_down_image').onmouseout = stopSlide;
		
		document.getElementById('largeImageCaption').style.display='none';	
		slidePreviewPane();
		
	}
	
	
	window.onload = initGalleryScript;