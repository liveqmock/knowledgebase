﻿<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/dtree/dtree.css"  type="text/css"/>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/dtree/dtree.js"></script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="con">  
  <tr>
  	 <td width="5%" align="top">&nbsp;</td>
  	 <td width="80%" align="top">    	
		 	  <div id="leftdtree" name="leftdtree" class="dtree"></div>
					 <script>
						var sPath="<%=request.getContextPath()%>";
					   	var tree=new dTree(document.getElementById("leftdtree"),sPath,1); 		
					   	var rootcode='${sysmark}';			   
					   	tree.add(rootcode,-1,'系统菜单','#','系统菜单');
					   	tree.data="${item1}";
					   	tree.initDTreeNode();
					</script> 
     </td>
  </tr>  
</table>
</body>
</html>