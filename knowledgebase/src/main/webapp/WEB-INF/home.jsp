<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
 String ctx=request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>jQuery-EasyUI 1.1 应用实例</title>
		<link href="<%=ctx%>/css/default.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css"
			href="<%=ctx%>/js/jquery/jquery-easyui-1.2.6/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery/jquery-easyui-1.2.6/themes/icon.css" />
		<script type="text/javascript" src="<%=ctx%>/js/jquery/lib/jquery-1.4.2.min.js"></script>
		<script type="text/javascript"
			src="<%=ctx%>/js/jquery/jquery-easyui-1.2.6/jquery.easyui.min-1.2.0.js"></script>
		<script type="text/javascript" src='<%=ctx%>/js/outlook.js'></script>
		<script language="javascript">
		setMenusJson('<%=ctx%>');
		var menus=<%=request.getAttribute("menus")%>;
		
	var _menus = {
    basic: menus,
            point: [{
                "menuid": "20",
                "icon": "icon-sys",
                "menuname": "邮件列表",
                "menus": [{
                    "menuid": "211",
                    "menuname": "邮件用途",
                    "icon": "icon-nav",
                    "url": "#"
                }, {
                    "menuid": "213",
                    "menuname": "邮件调整",
                    "icon": "icon-nav",
                    "url": "#"
}]

}]
                };
                //设置登录窗口
                function openPwd() {
                    $('#w').window({
                        title: '修改密码',
                        width: 300,
                        modal: true,
                        shadow: true,
                        closed: true,
                        height: 160,
                        resizable: false
                    });
                }
                //关闭登录窗口
                function closePwd() {
                    $('#w').window('close');
                }



                //修改密码
                function serverLogin() {
                    var $newpass = $('#txtNewPass');
                    var $rePass = $('#txtRePass');

                    if ($newpass.val() == '') {
                        msgShow('系统提示', '请输入密码！', 'warning');
                        return false;
                    }
                    if ($rePass.val() == '') {
                        msgShow('系统提示', '请在一次输入密码！', 'warning');
                        return false;
                    }

                    if ($newpass.val() != $rePass.val()) {
                        msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                        return false;
                    }

                    $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                        msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                        $newpass.val('');
                        $rePass.val('');
                        close();
                    })

                }
                $(function() {
                    openPwd();

                    $('#editpass').click(function() {
                        $('#w').window('open');
                    });

                    $('#btnEp').click(function() {
                        serverLogin();
                    })

                    $('#btnCancel').click(function() { closePwd(); })

                    $('#loginOut').click(function() {
                        $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                            if (r) {
                                //location.href = '/ajax/loginout.ashx';
                                location.href = "login.html";
                            }
                        });
                    })
                });

              function onReloadCurrTab(){
              alert( $('#tabs').html());
              	//var tab = $('#tabs').tabs('getSelected');
              	//var title = tab.panel('options').title;
              	//$('#tabs').tabs('resize');
              	 //var currTab = $('#tabs').tabs('getTab', title);
             //var iframe = $(currTab.panel('options').content);
             //var src = iframe.attr('src');
             //$('#tabs').tabs('update', { tab: currTab, options: { content: createFrame(src)} });
              	
              }
		 </script>
		<style type="text/css">
#css3menu li {
	float: left;
	list-style-type: none;
}

#css3menu li a {
	color: #fff;
	padding-right: 20px;
}

#css3menu li a.active {
	color: yellow;
}
</style>
	</head>
	<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
		<!--noscript>
        <div style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px;
            width: 100%; background: white; text-align: center;">
            <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript-->
		<div region="north" split="true" border="false"
			style="overflow: hidden; height: 40px; background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 30px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
			<span style="float: right; padding-right: 20px;" class="head">欢迎
				PEPE <a href="#" id="editpass"> 修改密码</a> <a href="#" id="loginOut">安全退出</a>
			</span>
			<span style="padding-left: 10px; font-size: 16px; float: left;">
				<img src="images/blocks.gif" width="20" height="20"
					align="absmiddle" /> PEPE</span>
			<ul id="css3menu"
				style="padding: 0px; margin: 0px; list-type: none; float: left; margin-left: 40px;">
				<li>
					<a class="active" name="basic" href="javascript:;" title="常用菜单">常用菜单</a>
				</li>
				<li>
					<a name="point" href="javascript:;" title="邮件列表">邮件列表</a>
				</li>
			</ul>
		</div>
		<div region="south" split="true"
			style="height: 30px; background: #D2E0F2;">
			<div class="footer">
				By PEPE
			</div>
		</div>
		<div region="west" hide="true" split="true" title="导航菜单"
			style="width: 180px;" id="west">
			<div id='wnav' class="easyui-accordion" fit="true" border="false">
				<!--  导航内容 -->
			</div>
		</div>
		<div id="mainPanle" region="center"
			style="background: #eee; overflow-y: hidden">
			<div id="tabs" class="easyui-tabs" fit="true" border="false">
				<div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">
					<h1>
						Welcome !
					</h1>
				</div>
			</div>
		</div>
		<!--修改密码窗口-->
		<div id="w" class="easyui-window" title="修改密码" collapsible="false"
			minimizable="false" maximizable="false" icon="icon-save"
			style="width: 300px; height: 150px; padding: 5px; background: #fafafa;">
			<div class="easyui-layout" fit="true">
				<div region="center" border="false"
					style="padding: 10px; background: #fff; border: 1px solid #ccc;">
					<table cellpadding="3">
						<tr>
							<td>
								新密码：
							</td>
							<td>
								<input id="txtNewPass" type="Password"
									class="easyui-validatebox" required="true"
									validtype="length[3,10]" />
							</td>
						</tr>
						<tr>
							<td>
								确认密码：
							</td>
							<td>
								<input id="txtRePass" type="Password" class="easyui-validatebox"
									required="true" validtype="length[3,10]" />
								<!-- class="txt01"-->
							</td>
						</tr>
					</table>
				</div>
				<div region="south" border="false"
					style="text-align: right; height: 30px; line-height: 30px;">
					<a id="btnEp" class="easyui-linkbutton" icon="icon-ok"
						href="javascript:void(0)">确定</a>
					<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel"
						href="javascript:void(0)"> 取消</a>
				</div>
			</div>
		</div>
		<div id="mm" class="easyui-menu" style="width: 150px;">
			<div id="mm-tabupdate">
				刷新
			</div>
			<div class="menu-sep">
			</div>
			<div id="mm-tabclose">
				关闭
			</div>
			<div id="mm-tabcloseall">
				全部关闭
			</div>
			<div id="mm-tabcloseother">
				除此之外全部关闭
			</div>
			<div class="menu-sep">
			</div>
			<div id="mm-tabcloseright">
				当前页右侧全部关闭
			</div>
			<div id="mm-tabcloseleft">
				当前页左侧全部关闭
			</div>
			<div class="menu-sep">
			</div>
			<div id="mm-exit">
				退出
			</div>
		</div>
	</body>
</html>
