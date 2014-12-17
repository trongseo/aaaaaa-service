// JavaScript Document
var ppimgNW;
function popupImage(src, note, title, css, border) {
  if (border==null) border = 0;
  if (note==null) note = '';
  if (ppimgNW != null) ppimgNW.close();

  ppimgNW = window.open('','POPUPIMAGE','width=1,height=1');
  var doc = ppimgNW.document;
  doc.write('<html>');
  doc.write('<head>');

  if (title!=null) doc.write('<title>'+ title +'</title>');
  doc.write('<style> body {'+css+'} #ppImgText{'+ css +'} #ppImg{cursor:hand}</style></head>');
  doc.write('<body leftmargin="0" topmargin="' + border + '">');
  doc.write('<div align="center">');
  doc.write('<img src="' + src + '" id="ppImg" onclick="window.close();" title="Close">');
  doc.write('</div>');
  doc.write('<div style="height:1; width:' + border + '; font-size:4pt;">');
  doc.write('</div>');
  doc.write('<div id="ppImgText" align="center">');
  doc.write(note);
  doc.write('</div>');
  doc.write('</body>');
  doc.write('</html>');

  doc.write('<' + 'script>');
  doc.write('var resized = false;');
  doc.write('function doResize() {');
  doc.write('  var imgW = ppImg.width, imgH = ppImg.height;');     
  doc.write('  window.resizeTo(imgW + 20 +' + border*2 +', imgH + ppImgText.offsetHeight + 40 + '+ border*2 +');');
  doc.write('  setTimeout("doResize()",1000);');

  doc.write('}');
  doc.write('doResize(); ');
  doc.write('</' + 'script>');

}

function popupFlash(src, sWidth, sHeight,border) {
  if ((src==null)||(src=='')) return ;
  if ((border==null)||(border=='')) border = 0;
  if (ppimgNW != null) ppimgNW.close();
  var w = ((sWidth==null)||(sWidth==''))?200:parseInt(sWidth);
  var h = ((sHeight==null)||(sHeight==''))?200:parseInt(sHeight);
  ppimgNW = window.open('','POPUPFLASH','width='+w+',height='+(h+30));
  var doc = ppimgNW.document;
  doc.write('<html>');
  doc.write('<head>');
  doc.write('<title>'+ src +'</title>');
  doc.write('</head>');
  doc.write('<body leftmargin="0" topmargin="' + border + '">');
  doc.write('<div align="center">');
   var objTag = '<OBJECT id="popFlash" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" WIDTH="' + w + '" HEIGHT="' + h + '"'
	   objTag +=' codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" id="flashOnly" >'
	   objTag +='  <PARAM NAME=movie VALUE="' + src + '"><PARAM NAME=menu VALUE=false> <PARAM NAME=quality VALUE=high>'
	   objTag +='  <param name="AllowScriptAccess" value="always"> '
	   objTag +='  <EMBED src="" menu=false quality=high wmode=transparent bgcolor=#FFFFFF NAME="flashOnly" ALIGN="" ' 
	   objTag +='  TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED></OBJECT> ' 
  doc.write(objTag);
  doc.write('</div>');
  doc.write('<div align="center"><a href="" onclick="window.close();" title="Close">Close</a></div>');

  doc.write('</body>');
  doc.write('</html>');
}

function popupMovie(src, sWidth, sHeight) {
  if ((src==null)||(src=='')) return ;
  if (ppimgNW != null) ppimgNW.close();
  var w = ((sWidth==null)||(sWidth==''))?200:parseInt(sWidth);
  var h = ((sHeight==null)||(sHeight==''))?200:parseInt(sHeight);
  ppimgNW = window.open('','POPUPMOVIE','width='+w+',height='+(h+30));
  var doc = ppimgNW.document;
  doc.write('<html>');
  doc.write('<head>');
  doc.write('<title>'+ src +'</title>');
  doc.write('</head>');
  doc.write('<body leftmargin="0" topmargin="0">');
  doc.write('<div align="center">');
   var objTag = '<object ID="popMediaPlayer" classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715" standby="Loading Microsoft Windows Media Player components..." type="application/x-oleobject"  width="'+w+'" height="'+h+'">'
	   objTag +='  <param NAME="FileName" VALUE="'+src+'"><param NAME="AutoStart" VALUE="true">'
	   objTag +='  <embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" SRC="" name="popMediaPlayer" AutoStart="true">'
	   objTag +='  </OBJECT> ' 
  doc.write(objTag);
  doc.write('</div>');
  doc.write('<div align="center"><a href="" onclick="window.close();" title="Close">Close</a></div>');

  doc.write('</body>');
  doc.write('</html>');
}
