<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>会话列表</title>
<meta name="generator" content="editplus">
<meta name="author" content="nuttycoder">
<link href="{{$template_root}}/all_purpose_style.css" rel="stylesheet" type="text/css" />
</head>

<body>


	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td  class="hui_bj">命令管理——详细信息</td>
  </tr>
  <tr>
	<td class=""><table bordercolor="white" cellspacing="1" cellpadding="5" border="0" width="100%" class="BBtable">
			<tr>
				<th class="list_bg"  width="55%">文件路径</th>
				<th class="list_bg"  width="10%">操作</th>
			</tr>
			{{section name=t loop=$allfile}}
			<tr {{if $smarty.section.t.index % 2 == 0}}bgcolor="f7f7f7"{{/if}}>
				<td>{{$allfile[t].fpath}}</td>
				<td><img src="{{$template_root}}/images/scico.gif" width="16" height="16" align="absmiddle"><a href="admin.php?controller=admin_compare&action=file_del&fid={{$allfile[t].fid}}&tid={{$tid}}&ttype={{$ttype}}">删除</a></td>
			</tr>
			{{/section}}
			<tr>
				<td colspan="4" align="left">
					共{{$command_num}}执行命令  {{$page_list}}  页次：{{$curr_page}}/{{$total_page}}页  {{$items_per_page}}条日志/页  转到第<input name="pagenum" type="text" size="2" onKeyPress="if(event.keyCode==13) window.location='admin.php?controller=admin_session&action=dangerlist&page='+this.value;">页
				</td>
			</tr>
			<tr>
				<td>增加需要监控的文件</td>
				<td colspan="3">
				<form action="admin.php?controller=admin_compare&action=file_add&tid={{$tid}}&fid={{$max_num+1}}&ttype={{$ttype}}" name="f" method="post">
					文件名 <input type="text" name="filename" size="50">
					<input type="submit"  value="增加">
				</form>
				</td>
			</tr>
		</table>
	</td>
  </tr>
</table>


</body>
<iframe name="hide" height="0" frameborder="0" scrolling="no"></iframe>
</html>



