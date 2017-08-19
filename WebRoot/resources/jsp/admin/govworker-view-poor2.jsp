<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			.tab1 td{font-family: "Courier New","微软雅黑"}
			#base_frm_project_area-button{height: 30px;margin-left: 15px;}
			.input_1{width:160px;}
			.hasDatepicker{font-family:'Courier New','微软雅黑'}
			.ui-datepicker-calendar * {font-family:'Courier New','微软雅黑'}
			.tab1 td{font-family:'Courier New','微软雅黑'}
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
				$("select").selectmenu({width:"172px"});
			});
			
			function _forward_page(page){
			    $("#base_frm").attr('action','admin/govworker!view_poor2');
				$("#page_current").val(page);
				$("#base_frm").submit();
			}
			
			function exportData(){
				$("#base_frm").attr('action','admin/govworker!export?checkFlag=2');
				$("#base_frm").submit();
			}
			
			function exportTotalData(){
				$("#base_frm").attr('action','admin/govworker!exportTotal');
				$("#base_frm").submit();
			}
			function delete_worker_poor(poorid,name,id){
			    $.dialog.confirm("你确定要删除客户[" + name + "]吗？<br /><br />删除后，将不再显示此客户，请谨慎操作。", function(){
				   $.get("admin/govworker!delete_poor",{"workerPoor.id":poorid,"worker.id":id},function(data){
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
			
			function checkWorkerPoor(poorid,name,flag){
			     var tip = "你确定要审核";
			     var checkflag = "";
			     if(flag == "pass"){
			        tip += "通过";
			        checkflag = "1";
			     }else{
			        tip += "拒绝";
			        checkflag = "2";
			     }
			     tip += " 客户[" + name + "]吗？<br /><br />";
			     
			     
			     $.dialog.confirm(tip, function(){
				   $.get("admin/govworker!check",{"workerPoor.id":poorid,"workerPoor.checkFlag":checkflag},function(data){
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
		<div class="home" >
			<img src="resources/images/icon_home.png" width="20" height="20" />
			客户库&nbsp;>&nbsp;客户统计
		</div>
		<div class="m_w">
<!-- 		    <div class="p_tpc" onclick="showSearch();" style="cursor: pointer;">搜索条件:</div>	 -->
			<!--检索部分-->
			<s:form action="govworker!view_poor2" namespace="/admin" id="base_frm">
				<s:hidden name="page.current" id="page_current"/>
				<div class="tab_check"  id="search" >

					<table class="tab11" width="100%">
						<tr>
							<td align="right">请输入搜索关键字:</td>
							<td colspan="3">
								<s:textfield name="query.keyword" cssClass="auto_tips input_1" alt="客户姓名、生日、身份证号码、联系方式"
											 style="margin-top:-2px;width:300px;border:1px solid #aaa;height:29px;line-height:29px;padding:1px 5px;">
								</s:textfield>

								<span>&nbsp;</span> <span>&nbsp;</span>
								<input  type="button" value="搜索" class="btn_search" style="margin-left:10px;margin-top:-3px;" onclick="_forward_page(1)"/>
								<input  type="button" value="导出" class="btn_search" style="margin-left:10px;margin-top:-3px;" onclick="exportData();"/>
								<input  type="button" value="导出汇总表" class="btn_search importexcel" style="margin-left:10px;margin-top:-3px;" onclick="exportTotalData();"/>
							</td>
						</tr>

						<tr>
							<td align="right">&nbsp;</td>
							<td colspan="3">
								<span>&nbsp;</span><span>&nbsp;</span>
								<s:select cssStyle="margin-top:-3px;height:29px;line-height:29px;" name="query.checkflag" list="#{'':'审核状态','0':'未审核',1:'审核通过',2:'审核拒绝'}" ></s:select>
							</td>
						</tr>

					</table>

					</div>

			</s:form>
			<!--表格-->
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab1">
				<tr>
					<th width="5%">
						序号
					</th>
					<th width="10%">
						客户姓名
					</th>
					<th width="10%">
						生日
					</th>
					<th width="5%">
						身份证号
					</th>
					<th width="10%">
						联系方式
					</th>
					<th width="10%">
						审核状态
					</th>
					<th width="15%">
						操作
					</th>
					<s:if test="null != page.beans && page.beans.size()>0">
						<s:iterator value="page.beans" var="item" status="status">
					    <tr <s:if test="#status.odd != true">class="inter"</s:if>>
				<td align="center" valign="top">
					<s:property value="%{page.offset * (page.current - 1) + #status.count}" />
				</td>
				<td align="center" valign="top">
					<s:property value="#item.workerInfo.workerName" />
				</td>
				<td align="center" valign="top">
					<s:property value="#item.workerInfo.workerAge" />
				</td>
				<td align="center" valign="top">
					<s:property value="#item.workerInfo.workerIdnumber" />
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
                             <a href="admin/govworker!detail_poor?workerPoor.secId=<s:property value="#item.secId" />&worker.secId=<s:property value="#item.workerInfo.secId" />">详情</a>
                             <!--|  <a href="admin/record!view?query.workPoorId=<s:property value="#item.id" />">发放记录</a>-->
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
				</tbody>
			</table>
			<!--页码-->
			<div class="page">
				<s:include value="../common/page.jsp" />
			</div>
		</div>
	</body>
	
	
</html>
