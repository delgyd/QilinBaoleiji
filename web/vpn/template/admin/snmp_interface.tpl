<?php
//define("SEPARATE_PAGE",true);
require_once('dataprocess.php');
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>OSSIM框架</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<META content=no-cache http-equiv=Pragma>
<link href="template/admin/all_purpose_style.css" type="text/css" rel="stylesheet">
<STYLE>HTML {
	MARGIN: 0px; HEIGHT: 100%; FONT-SIZE: 12px
}
BODY {
	MARGIN: 0px; HEIGHT: 100%; FONT-SIZE: 12px
}
.mesWindow {
	BORDER-BOTTOM: #666 1px solid; BORDER-LEFT: #666 1px solid; BACKGROUND: #fff; BORDER-TOP: #666 1px solid; BORDER-RIGHT: #666 1px solid
}
.mesWindowTop {
	BORDER-BOTTOM: #eee 1px solid; TEXT-ALIGN: left; PADDING-BOTTOM: 3px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; MARGIN-LEFT: 4px; FONT-SIZE: 12px; FONT-WEIGHT: bold; PADDING-TOP: 3px
}
.mesWindowContent {
	MARGIN: 4px; FONT-SIZE: 12px
}
.mesWindow .close {
	BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; WIDTH: 28px; BACKGROUND: #fff; HEIGHT: 15px; BORDER-TOP: medium none; CURSOR: pointer; BORDER-RIGHT: medium none; TEXT-DECORATION: underline
}
</STYLE>
<script>
function keyup(keycode){
	if(keycode==13){
		searchit();
	}
}
function searchit(){
	document.f1.action = "admin.php?controller=admin_configure&action=snmp_interface";
	document.f1.action += "&ip="+document.f1.ip.value;
	document.location=document.f1.action;
	return true;
}
var isIe=(document.all)?true:false;
//设置select的可见状态
function setSelectState(state)
{
	var objl=document.getElementsByTagName('select');
	for(var i=0;i<objl.length;i++)
	{
		objl[i].style.visibility=state;
	}
}
function mousePosition(ev)
{
	if(ev.pageX || ev.pageY)
	{
		return {x:ev.pageX, y:ev.pageY};
	}
	return {
		x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,y:ev.clientY + document.body.scrollTop - document.body.clientTop
	};
}
//弹出方法
function showImg(wTitle, ev ,id)
{
	closeWindow();
	var pos = mousePosition(ev);
	var wWidth=500;
	var bHeight=600;
	var bWidth=parseInt(document.documentElement.scrollWidth);
	var bHeight=parseInt(document.documentElement.scrollHeight);
	if(isIe){
		setSelectState('hidden');
	}
	var back=document.createElement("div");
	back.id="back";
	var styleStr="top:0px;left:0px;position:absolute;width:"+bWidth+"px;height:"+bHeight+"px;";
	styleStr+=(isIe)?"filter:alpha(opacity=0);":"opacity:0;";
	back.style.cssText=styleStr;
	document.body.appendChild(back);
	var mesW=document.createElement("div");
	mesW.id="mesWindow";
	mesW.className="mesWindow";
	mesW.innerHTML="<div onclick='closeWindow();'><div class='mesWindowTop'><table width='100%' height='100%' ><tr><td>"+wTitle+"</td></tr></table></div><div class='mesWindowContent' id='mesWindowContent'><img src='graph_image.php?graph_width=400&graph_height=100&local_graph_id="+id+"' border=0 ></div><div class='mesWindowBottom'></div></div>";
	styleStr="left:"+(((pos.x-wWidth)>0)?(pos.x-wWidth):pos.x)+"px;top:"+(pos.y)+"px;position:absolute;width:"+wWidth+"px;";
	mesW.style.cssText=styleStr;
	document.body.appendChild(mesW);
	window.parent.document.getElementById("frame_content").height=pos.y+1000;
	window.parent.parent.document.getElementById("main").height=pos.y+1000;	
	return false;
}


//关闭窗口
function closeWindow()
{
	if(document.getElementById('back')!=null)
	{
		document.getElementById('back').parentNode.removeChild(document.getElementById('back'));
	}
	if(document.getElementById('mesWindow')!=null)
	{
		document.getElementById('mesWindow').parentNode.removeChild(document.getElementById('mesWindow'));
	}
	if(isIe){
		setSelectState('');
	}
	window.parent.reinitIframe();
}
document.onclick=function(){
	var pos = mousePosition(event);
	if(event.srcElement['tagName']!='A'&&event.srcElement['tagName']!='IMG'&&event.srcElement['tagName']!='FONT'){
		closeWindow();
	}
}
</script>
</HEAD>
<BODY style="float:center">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >

  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0"  >
             <tr><td valign="middle" class="hui_bj"><div class="menu">
<ul>
<li class="me_b"><img src="{{$template_root}}/images/an11.jpg" align="absmiddle"/><a href="admin.php?controller=admin_thold&action=snmp_alert">告警配置</a><img src="{{$template_root}}/images/an33.jpg" align="absmiddle"/></li>
<li class="me_a"><img src="{{$template_root}}/images/an1.jpg" align="absmiddle"/><a href="admin.php?controller=admin_configure&action=snmp_interface">接口设置</a><img src="{{$template_root}}/images/an3.jpg" align="absmiddle"/></li></ul>
</div></td></tr>
<tr>
	<td align="left" colspan = "7"><table width="100%" border="0" cellspacing="0" cellpadding="0"  class="main_content">

                <TBODY>
				 <TR>
                    <TD >
					<form name ='f1' action='controller=admin_configure&action=snmp_interface' method=post onsubmit="return false;">
					IP<input type="text" class="wbk" name="ip" onkeyup="keyup(event.keyCode);">
					&nbsp;&nbsp;<input  type="submit" value="高级搜索" onclick="return searchit();" class="bnnew2">
					</form>
					</TD>
                  </TR>
				  </table></td></tr>
      <tr  >
        <td class="">

		  <TABLE class=BBtable cellSpacing=0 cellPadding=0 width="100%"             align=center>
              <TBODY>
              <TR>
                <TD width="8%" class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=device_ip&orderby2={{$orderby2}}">IP</a></TD>
				<TD width="8%" class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=port_describe&orderby2={{$orderby2}}">接口名称</a></TD>
                <TD width="8%"  class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=port_type&orderby2={{$orderby2}}">接口类型</a></TD>
                <TD width="8%"  class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=port_speed&orderby2={{$orderby2}}">接口速度</a></TD>
                <TD width="8%"  class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=normal_status&orderby2={{$orderby2}}">默认状态</a></TD>
				<TD width="10%"  class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=cur_status&orderby2={{$orderby2}}">当前状态</a></TD>
				<TD width="10%"  class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=connectdevice&orderby2={{$orderby2}}">对端设备</a></TD>
				<TD width="10%"  class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=connectdeviceport&orderby2={{$orderby2}}">对端设备接口</a></TD>
				<TD width="10%"  class="list_bg"><a href = "admin.php?controller=admin_configure&action=snmp_interface&orderby1=connectport&orderby2={{$orderby2}}">配线架接口</a></TD>
				<TD width=""  class="list_bg">操作</TD>
              </TR>
			<form action="" method="post">
			{{section name=g loop=$tholdlist}}
			<TR bgcolor="f7f7f7">
			<TD class="">{{$tholdlist[g].device_ip}}</TD>
			<TD class="">{{$tholdlist[g].port_describe}}</TD>
			<TD class="">{{$tholdlist[g].port_type}}</TD>
			<TD class="">{{$tholdlist[g].port_speed}}</TD>
			<TD class="">{{$tholdlist[g].normal_status}}</TD>
			<TD class="">{{$tholdlist[g].cur_status}}</TD>
			<TD class="">{{$tholdlist[g].connectdevice}}</TD>
			<TD class="">{{$tholdlist[g].connectdeviceport}}</TD>
			<TD class="">{{$tholdlist[g].connectport}}</TD>
			<td>
			<img src='{{$template_root}}/images/edit_ico.gif' width=16 height='16' hspace='5' border='0' align='absmiddle'><a href='admin.php?controller=admin_configure&action=snmp_interface_edit&id={{$tholdlist[g].id}}'>修改</a> 
			| <img src='{{$template_root}}/images/delete_ico.gif' width=16 height='16' hspace='5' border='0' align='absmiddle'><a href="#" onClick="if(!confirm('您确定要删除？')) {return false;} else { location.href='admin.php?controller=admin_configure&action=snmp_interface_del&id={{$tholdlist[g].id}}';}">删除</a></td>
			</TR>
			{{/section}}
			<tr><td colspan="10" align="right"><input type="button" onclick="location.href='admin.php?controller=admin_configure&action=snmp_interface_edit'" name="edit" value="添加" class="an_02">&nbsp&nbsp;&nbsp;共{{$total}}个记录  {{$page_list}}  页次：{{$curr_page}}/{{$total_page}}页  {{$items_per_page}}个记录/页  转到第<input name="pagenum" type="text" class="wbk" size="2" onKeyPress="if(event.keyCode==13) window.location='admin.php?controller=admin_thold&action=status_thold&page='+this.value;">页&nbsp;&nbsp;&nbsp;{{if $smarty.session.ADMIN_LEVEL eq 3}}<a href="{{$curr_url}}&derive=1" target="hide">{{$language.ExportresulttoExcel}}</a>{{/if}}</td></tr>
			</form>
			</TBODY>
		</TABLE>
  
    
		  </td>
      </tr>
	  <tr><td cellpadding="3" height="15" align="right"></td></tr>
    </table></td>
  </tr>
  <tr><td height="10"></td></tr>
</table>



</BODY></HTML>

