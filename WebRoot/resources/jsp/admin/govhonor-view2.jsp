﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:include value="../common/meta.jsp" />
		<script type="text/javascript" src="resources/js/ajaxfileupload.js"></script>
		<style type="text/css">
		     .input_1{width:160px;}
			.tab1 td{font-family: "Courier New","微软雅黑"}
			#base_frm_project_area-button{height: 30px;margin-left: 15px;}
			.ui-selectmenu-button span.ui-selectmenu-text{
			line-height:22px;
			}
		</style>
		<script type="text/javascript">
		    var flag = false;
			$(function(){
					$(".timer").datepicker({
					showSecond: true,
					timeFormat: 'hh:mm:ss',
					separator: ' ',
					autoSize: true
				});
				$("select").selectmenu({width:'172px'});
			});
			
			function _forward_page(page){
			    $("#base_frm").attr('action','admin/govhonor!view2');
				$("#page_current").val(page);
				$("#base_frm").submit();
			}
			
			function exportData(){
				$("#base_frm").attr('action','admin/govhonor!export?checkFlag=2');
				$("#base_frm").submit();
			}
			function exportTotalData(){
				$("#base_frm").attr('action','admin/govhonor!exportTotal');
				$("#base_frm").submit();
			}
			function delete_honor(id,name){
			    $.dialog.confirm("你确定要删除此获奖信息[" + name + "]吗？<br /><br />删除后，将不再显示此信息，请谨慎操作。", function(){
				   $.get("admin/govhonor!delete",{"honor.id":id},function(data){
					   eval("data=" + data);
					   if(data.result){
						   $.dialog.tips("数据操作成功",2,'success.gif',function(){
							   window.location.reload(true);
						   });
					   } else {
						   $.dialog.tips("服务器繁忙，数据操作失败，请稍后再试",2,'error.gif');
					   }
				   });
				});
			}
			
			function checkHonor(honorrid,name,flag){
			     var tip = "你确定要审核";
			     var checkflag = "";
			     if(flag == "pass"){
			        tip += "通过";
			        checkflag = "1";
			     }else{
			        tip += "拒绝";
			        checkflag = "2";
			     }
			     tip += " 获奖荣誉 [" + name + "]吗？<br /><br />";
			     
			     
			     $.dialog.confirm(tip, function(){
				   $.get("admin/govhonor!check",{"honor.id":honorrid,"honor.checkFlag":checkflag},function(data){
					   eval("data=" + data);
					   if(data.result){
						        $.dialog.tips("审核操作成功",2,'success.gif',function(){
							    window.location.reload(true);
						   });
					   } else {
						   $.dialog.tips("服务器繁忙，数据操作失败，请稍后再试",2,'error.gif');
					   }
				   });
				});
			}
		</script>
	</head>
	<body>
		<div class="home">
			<img src="resources/images/icon_home.png" width="20" height="20" />合同库&nbsp;>&nbsp;合同统计
		</div>
		<div class="m_w">
			<!--检索部分-->
			<s:form action="govhonor!view2" namespace="/admin" id="base_frm">
			<s:hidden name="page.current" id="page_current"></s:hidden>
			<div class="tab_check" id="search" >
				<table class="tab11" width="100%">
					<tr>
						<td align="right">请输入搜索关键字:</td>
						<td colspan="4">
							<s:textfield name="query.keyword" cssStyle="width:75%"  cssClass="auto_tips input_1" alt="客户姓名、生日、身份证号码、联系方式" style="margin-top:-2px;width:300px;border:1px solid #aaa;height:29px;line-height:29px;padding:1px 5px;margin-left:0px;"></s:textfield>

							<input  type="button" value="搜索" class="btn_search" style="margin-left:10px;margin-top:-3px;align:left" onclick="_forward_page(1)"/>
							<input  type="button" value="导出" class="btn_search" style="margin-left:10px;margin-top:-3px;align:left" onclick="exportData();"/>
							<input  type="button" value="导出汇总表" class="btn_search importexcel" style="margin-left:10px;margin-top:-3px;" onclick="exportTotalData();"/>
						</td>
					</tr>

					<tr>
						<td align="right">合同开始时间:</td>
						<td><input name="query.honorTimeStart" type="text" class="input_1 timer" value="<s:date name="%{query.lastProcessTimeStart}" format="yyyy-MM-dd" />" /></td>
						<td align="right"> 合同结束时间:</td>
						<td><input name="query.honorTimeEnd" type="text" class="input_1 timer" value="<s:date name="%{query.lastProcessTimeEnd}" format="yyyy-MM-dd" />" /></td>
						<td>  <span>&nbsp;</span> <span>&nbsp;</span><s:select name="query.checkflag" list="#{'':'审核状态','0':'未审核',1:'审核通过',2:'审核拒绝'}" ></s:select> <span>&nbsp;</span> <span>&nbsp;</span>
						</td>
					</tr>
				</table>
			 </div>
			</s:form>
			
<!-- 				<input type="button" value="搜索" class="btn_search" style="margin-left:10px;margin-top:-3px;" onclick="_forward_page(1)" /> -->
<!-- 				<input type="button" value="新增获奖职工" class="btn_search" style="margin-left:10px;margin-top:-3px;" onclick="location.href='admin/govhonor!add'" /> -->
			
			<!--表格-->
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab1">
				<tr>
					<th width="5%">
						序号
					</th>
					<th width="8%">
						合同种类
					</th>
					<th width="10%">
						合同编号
					</th>
					<th width="10%">
						合同额
					</th>
					<th width="10%">
						预期收益
					</th>
					<th width="8%">
						开始日期
					</th>
					<th width="8%">
						结束日期
					</th>
					<th width="10%">
						客户姓名
					</th>
					<th width="8%">
						联系方式
					</th>
					<th width="8%">
						审核状态
					</th>
					<th width="20%">
						操作
					</th>
				</tr>
				<s:if test="null != page.beans && page.beans.size()>0">
				<s:iterator value="#request.page.beans" var="item" status="st">
					<tr <s:if test="#st.even">class="inter"</s:if>>
						<td align="center" valign="top">
							<s:property value="%{#request.page.start + #st.count}" />
						</td>
						<td align="center" valign="top">
							<s:property value="#item.honorType" />
						</td>
						<td align="center" valign="top">
							<s:property value="#item.honorLevel" />
						</td>
						<td align="center" valign="top">
							<s:property value="#item.honorDesc" /> 万元
						</td>
						<td align="center" valign="top">
							<s:property value="#item.unitHonorDesc" /> 万元
						</td>
						<td align="center" valign="top">
							<s:property value="#item.honorTime" />
						</td>
						<td align="center" valign="top">
							<s:property value="#item.joinTime" />
						</td>
						<td align="center" valign="top">
							<s:property value="#item.workerInfo.workerName" />
						</td>
						<td align="center" valign="top">
							<s:property value="#item.workerInfo.workerPhone" />
						</td>
						<td align="center" valign="top">
							<s:if test="#item.checkFlag == null || #item.checkFlag == ''">未提交</s:if>
							<s:elseif test="#item.checkFlag == 0">未审核</s:elseif>
							<s:elseif test="#item.checkFlag == 1">审核通过</s:elseif>
							<s:elseif test="#item.checkFlag == 2">审核拒绝</s:elseif>
						</td>
						<td align="center" valign="top">
                              <a href="admin/govhonor!detail?honor.secId=<s:property value="#item.secId" />">详情</a>
						</td>

					</tr>
				</s:iterator>
				</s:if>
					<s:else>
						<tr>
							<td colspan="11" align="center">
								<font style="color:#ff671c;">
									没查询到您想要的数据信息！！
								</font>
							</td>
						</tr>
					</s:else>
			</table>
			<!--页码-->
			<div class="page">
			<s:include value="../common/page.jsp"></s:include>
			</div>
		</div>
	</body>
</html>
