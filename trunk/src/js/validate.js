/*-------------------------------------------------------------------------------
	*	FileName ; $common.js
	* Function : validative functions
	* CreatedDate : 01/02/2003
	* LastUpdate : 25/10/2004
-------------------------------------------------------------------------------*/
/*The following functions are described by their names*/

//-------------------------------------------------------------------------------
function isSpaces (Str) {
	if (isEmpty (Str)) return true;
	var i = 0;	
	while (Str.charAt(i)==' ' && i<Str.length) {
		i++;
	}
	if (i== Str.length) return true;
	return false;
}

//-------------------------------------------------------------------------------
function isEmpty(Str) {
	empty = (Str === "") ? true :  false;
	return empty;
}

//-------------------------------------------------------------------------------
function isNumber(Digit) {
	return /^\d+[\.\d*]?$/.test(Digit);
}

//------------------------------------------------------------------------------
function isAlphabet(Digit) {
	return /^[a-zA-Z]$/.test(Digit);
}

//-------------------------------------------------------------------------------
function isInteger(Str) {
	return /^[+-]?\d+$/.test(Str);
}

//-------------------------------------------------------------------------------
function isFloat(Str) {
		return /^[+-]?\d+\.{1}\d*$/.test(Str);
}

//-------------------------------------------------------------------------------
function isCurrency(Str) {
		return /^\d+[.]{1}[0-9]{2,}$/.test(Str);
}

//-------------------------------------------------------------------------------
function isDate(Str) {
	var bool1=/^[0]?\d[\/|-][0-2]\d[\/|-]\d{4}$/.test(Str);		//0x month format 0X-2X date format
	var bool2=/^[1][0-2][\/|-][0-2]\d[\/|-]\d{4}$/.test(Str);	//1x month format 3X date format
	var bool3=/^[1][0-2][\/|-][3][0,1][\/|-]\d{4}$/.test(Str);	
	var bool4=/^[0]?\d[\/|-][3][0,1][\/|-]\d{4}$/.test(Str);
	return ((bool1)||(bool2)||(bool3)||(bool4));
}

//-------------------------------------------------------------------------------
function isValidDate(nDay,nMonth,nYear) {
	if (nMonth==2 && nDay > 29) return false;
	if (nMonth==2 && nDay ==29 && nYear % 4 !=0) return false;
	if (nDay==31 && (nMonth == 4 || nMonth == 6 || nMonth == 9 || nMonth == 11 )) return false;
	return true;
}

//-------------------------------------------------------------------------------
function isTime(Str) {
		var bool1 = /^[0-1]?\d:[0-5]\d(:[0-5]\d)?$/.test(Str);
		var bool2 = /^[2][0-3]:[0-5]\d(:[0-5]\d)?$/.test(Str);
		return ((bool1)||(bool2));
}

//-------------------------------------------------------------------------------
function isDateTime(Str) {
		var str = RemoveSpace(Str).split(' ');
		return isDate(str[0]) && isTime(str[1]);
}

//-------------------------------------------------------------------------------
function isDomain (Str) {
	// The pattern for matching all special characters. 
  	//These characters include ( ) < > [ ] " | \ / ~ ! @ # $ % ^ & ? ` ' : ; , 
	var specialChars="\\(\\)<>#\\$&\\*!`\\^\\?~|/@,;:\\\\\\\"\\.\\[\\]";
	// The range of characters allowed in a username or domainname. 
	// It really states which chars aren't allowed. 
	var validChars="\[^\\s" + specialChars + "\]";
	 // An atom (basically a series of  non-special characters.) 
	var atom=validChars + '+';
	// The structure of a normal domain 
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");
	
	// Check if IP
	var ipDomainPat=/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
	var IPArray=Str.match(ipDomainPat);
	if (IPArray!=null) {
  	// this is an IP address
	 	 for (var i=1;i<=4;i++) {
	    		if (IPArray[i]>255) {
	 			return false
	   		 }
   		 }
	}
	// Check Domain
	var domainArray=Str.match(domainPat)
	if (domainArray==null) {
    		return false;
	}

	/* domain name seems valid, but now make sure that it ends in a
	 three-letter word (like com, edu, gov ... ) or a two-letter word,
   	representing country (uk, vn) or a four-letter word (.info), and that there's a hostname preceding 
   	the domain or country. */

	/* Now we need to break up the domain to get a count of how many atoms
	it consists of. */
	var atomPat=new RegExp(atom,"g")
	var domArr=Str.match(atomPat)
	var len=domArr.length
	if (domArr[domArr.length-1].length<2 || domArr[domArr.length-1].length>4) {
	 // the address must end in a two letter or three letter word or four-letter word.
		return false;
	}

	// Make sure there's a host name preceding the domain.
	if (len<2) {
   		 return false;
	}

	return true;
}

//-------------------------------------------------------------------------------
function isOpenDomain (Str) { // E.g : lengvu.saigonnet.vn:81 or 203.162.6.65:8080
	var pos=Str.indexOf(':');
	if (pos==-1) {
		return (isDomain(Str))
	}
	else {
		domain=Str.substring(0,pos);
		openDomain = Str.substring(pos,Str.length);
	}
		return ((/^[\:]{1}\d+$/.test(openDomain))&&(isDomain(domain)));
}

//-------------------------------------------------------------------------------
function isUser (Str) {
	var specialChars="\\(\\)<>#\\$&\\*!`\\^\\?~|/@,;:\\\\\\\"\\.\\[\\]";
	var validChars="\[^\\s" + specialChars + "\]";
	/* The pattern applies if the "user" is a quoted string (in
   	which case, there are no rules about which characters are allowed
   	and which aren't; anything goes).  E.g. "le nguyen vu"@webtome.com
   	is a valid (legal) e-mail address. */
	var quotedUser="(\"[^\"]*\")";
	var atom=validChars + '+'
	var word="(" + atom + "|" + quotedUser + ")";
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
	// See if "user" is valid 
	if (Str.match(userPat)==null) {
    		return false ;
	}
	return true;
}

//-------------------------------------------------------------------------------
function isURL(Str) { //not include http://
	var pos=Str.indexOf('/');
	var domain = (pos==-1)?Str:Str.substring(0,pos);
	var subURL = (pos==-1)?'':Str.substring(pos,Str.length);
	if (!isOpenDomain(domain)) {
		return false;
	}
	if ((subURL=='')||(subURL.length==1)) {
		return true;
	}
	var subPat = /^\/[^\/\\]+\.?[^\/\\]+(\/[^\/\\]*\.{0,1}[^\/\\]*)*$/;
	var ArrayURL=subURL.match(subPat);
	if (ArrayURL==null) {
		return false;
	}
	return true;
}

//-------------------------------------------------------------------------------
function isEmail (emailStr) {
	/* The pattern for matching fits the user@domain format. */
	var emailPat=/^(.+)@(.+)$/ ;
	var matchArray=emailStr.match(emailPat);
	if (matchArray==null) {
 	 /* Too many/few @'s or something; basically, this address doesn't
    	 even fit the general mould of a valid e-mail address. */
		return false;
	}
	var user=matchArray[1];
	var domain=matchArray[2];

	// See if "user" is valid 
	if (!isUser(user)) {
    	// user is not valid
   		 return false ;
	}

	// Check Domain
	if (!isDomain(domain)) {
   		return false;
	}
	return true;
}
function isUserName(strUserName){
	return /^[a-z0-9_\-]{4,15}$/.test(strUserName);
}
//-------------------------------------------------------------------------------
function isPhone(strPhone) {
	return  /^(\d{6,15})$/.test(strPhone);
	//return  /^[\+\-\(]?(\d*[\.\-\(\)\s\+]*\d*)*$/.test(strPhone);
}

//-------------------------------------------------------------------------------
function checkNumRange (value, nMin,nMax){
	if (!isInteger(value)) return false;
	if (value <nMin || value > nMax ) return false;
	return true;
}

//-------------------------------------------------------------------------------
function isFlash(fileName) {
  if (fileName=='') {
   	return false;   	
  }
  var ext = getExtension(fileName).toLowerCase();
  var e;
for(e in arrFlashFiles){
	if(arrFlashFiles[e]==ext) return true;
}
return false;
}

//-------------------------------------------------------------------------------
function isPix(fileName) {
  if (fileName=='') {
   	return false;   	
  }
  var ext = getExtension(fileName).toLowerCase();
  var e;
for(e in arrPixFiles){
	if(arrPixFiles[e]==ext) return true;
}
return false;
}

//-------------------------------------------------------------------------------
function getExtension(fileName){
		return fileName.substr(fileName.lastIndexOf(".")+1);
}


function checkOrder(f){
			f.institution.value = Trim(f.institution.value);
			f.contact_name.value = Trim(f.contact_name.value);
			f.address.value=Trim(f.address.value); 
			f.phone.value = Trim(f.phone.value);
			f.email.value = Trim(f.email.value);
		/*	f.number.value=Trim(f.number.vulue); 
			f.number_package.value=Trim(f.number_package.value); 
			f.p_doc_no.value = Trim(f.p_doc_no.value);
			
			f.vendor_company.value=Trim(f.vendor_company.value); 
			f.vendor_address.value=Trim(f.vendor_address.value); 
			f.vendor_attn.value=Trim(f.vendor_attn.value);
			
			f.ship_company.value=Trim(f.ship_company.value); 
			f.ship_address.value =Trim(f.ship_address.value); 
			f.ship_attn.value=Trim(f.ship_attn.value); 
			
			f.invoice_company.value = Trim(f.invoice_company.value);
			f.invoice_address.value= Trim(f.invoice_address.value); 
			f.invoice_attn.value= Trim(f.invoice_attn.value); 
			
			f.delivery.value = Trim(f.delivery.value);
			f.fileAttach.value= Trim(f.fileAttach.value); 
			f.fileLogo.value= Trim(f.fileLogo.value); 
		*/	
			
			if(f.institution.value==''){
				alert('please input your institution !');
				f.institution.focus();
				return false;
			}
			if(f.contact_name.value==''){
				alert('please input contact name !');
				f.contact_name.focus();
				return false;
			}
			if(f.address.value==''){
				alert('please input your address !');
				f.address.focus();
				return false;
			}
			
			if(f.email.value==''){
				alert('please input your email !');
				f.email.focus();
				return false;
			}
			
			if(!isEmail(f.email.value)){
				alert('Please input your valid email !');
				f.email.focus();
				return false;
			}
			if(f.phone.value==''){
				alert('please input your phone !');
				f.phone.focus();
				return false;
			}
			if(f.number.value==''){
				alert('please input your number !');
				f.number.focus();
				return false;
			}
			if(f.number_package.value==''){
				alert('please input your number package !');
				f.institution.focus();
				return false;
			}
			if(f.p_doc_no.value==''){
				alert('please input P Doc No. !');
				f.p_doc_no.focus();
				return false;
			}
			if(f.vendor_company.value==''){
				alert('please input vendor company name !');
				f.vendor_company.focus();
				return false;
			}
			if(f.vendor_address.value==''){
				alert('please input vendor company address !');
				f.vendor_address.focus();
				return false;
			}
			if(f.vendor_attn.value==''){
				alert('please input vendor attn !');
				f.vendor_attn.focus();
				return false;
			}
			if(f.ship_company.value==''){
				alert('please input ship company name !');
				f.ship_company.focus();
				return false;
			}
			if(f.ship_address.value==''){
				alert('please input ship address !');
				f.ship_address.focus();
				return false;
			}
			if(f.ship_attn.value==''){
				alert('please input ship attn !');
				f.ship_company.focus();
				return false;
			}
			if(f.invoice_company.value==''){
				alert('please input invoice company name !');
				f.invoice_company.focus();
				return false;
			}
			if(f.invoice_address.value==''){
				alert('please input invoice address !');
				f.invoice_address.focus();
				return false;
			}
			if(f.invoice_attn.value==''){
				alert('please input invoice_attn !');
				f.invoice_attn.focus();
				return false;
			}
			return true;
}

function checkContact(f){
			f.sender.value = Trim(f.sender.value);
			f.address.value = Trim(f.address.value);
			f.phone.value = Trim(f.phone.value);
			f.email.value = Trim(f.email.value);
			f.content.value = Trim(f.content.value);
			f.title.value = Trim(f.title.value);
			
			if(f.sender.value==''){
				alert(msg_pls_yourname);
				f.sender.focus();
				return false;
			}
			if(f.phone.value==''){
				alert(msg_pls_phone);
				f.phone.focus();
				return false;
			}
			if(!isEmail(f.email.value)){
				alert(msg_pls_valild_email);
				f.email.focus();
				return false;
			}
			
			if(f.content.value==''){
				alert(msg_pls_content);
				f.content.focus();
				return false;
			}
			return true;
		}
	
function checkEmail(f){
		f.email.value = Trim(f.email.value)
		f.name.value = Trim(f.name.value)
		if(!isEmail(f.email.value)){
			alert(msg_pls_valild_email);
			f.email.focus();
			return false;
		}
		var vleft = (screen.width - 400)/2;
		var vtop = (screen.height - 400)/2;
		window.open('newsletter.php?name='+f.name.value+'&email='+f.email.value,'','left='+vleft+',top='+vtop+',width=400,height=200');
		return false;
	}

function checkSendMail2Friend(f){
	f.email.value = Trim(f.email.value); 
	if(!isEmail(f.email.value)){
			alert(msg_pls_valild_email);
			f.email.focus();
			return false;
		}
	window.open('send_mail.php?email_to_1='+f.email.value,'','width=400,height=300');
	return false;
}
function AcceptNumbersOnly() {
	switch (event.keyCode) {
		case 48:
		case 49:
		case 50:
		case 51:
		case 52:
		case 53:
		case 54:
		case 55:
		case 56:
		case 57:
		case 8:
		case 9:
		case 35:
		case 36:
		case 37:
		case 39:
		case 46:
		case 96:
		case 97:
		case 98:
		case 99:
		case 100:
		case 101:
		case 102:
		case 103:
		case 104:
		case 105:
			break;
		case 86:
			if (event.ctrlKey) {
				event.returnValue=true;
			}	else {
				event.returnValue=false;
			}
			break;
		case 45:
			event.returnValue=true;
			break;
		default:
			event.returnValue=false;
			break;
	}
}
function AcceptNumbersAndPlus() {
	var compareString = '0123456789+';
		var mainString=String.fromCharCode(window.event.keyCode);
		if(compareString.indexOf(mainString)!=-1)
			return;
		else
			window.event.returnValue=false;
}