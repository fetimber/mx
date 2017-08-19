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
			* {font-family:"Courier New","微软雅黑"}
			
			.ui-selectmenu-button span.ui-selectmenu-text{
			line-height:22px;
			}
		</style>
		<script type="text/javascript">
			
			$(function() {
			    $("select").selectmenu({width:'440px'});

				$('#base_frm').validationEngine({
					addPromptClass: 'formError-white formError-small',
					promptPosition: 'centerRight: 10, +1',
					maxErrorsPerField: true,
					autoHideDelay: 3000
				});
	
			});
			
		</script>
	</head>
	<body>
		<div class="home">
			<img src="resources/images/icon_home.png" width="20" height="20" />客户库&nbsp;>&nbsp;客户管理&nbsp;>&nbsp;客户详情
		</div>
		<s:form action="govworker!save_poor" namespace="/admin" method="post" id="base_frm">
		    <s:hidden name="worker.id" />
		    <s:hidden name="workerPoor.id" />
		    
			<div class="hid_files_div"></div>
		
			<table width="60%" border="0" cellspacing="0" cellpadding="0" class="tab_1" style="margin:40px 0 0 40px;float:left;">
				<tr>
					<td width="16%" align="right">
						姓名
					</td>
					<td width="84%">
						<s:textfield name="worker.workerName" cssClass="input_1 input_1_w validate[required,minSize[1],maxSize[100]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
					<td width="16%" align="right">
						开户公司
					</td>
					<td width="84%">
						<s:if test="null == #session.userinfo_in_session.unitInfo">
						   <label for="number"></label>
						   <s:select id="unitList"  name="worker.unitId"  list="#request.units" headerKey="" headerValue="请选择开户公司" listKey="id" listValue="unitName" ></s:select>
						</s:if>
					   <s:else>
					      <s:property value="#session.userinfo_in_session.unitInfo.unitName"/>
					   </s:else>
					</td>
				</tr>
				
				<!--<tr>
					<td align="right">
						性别
					</td>
                    <td>
					    <label for="number"></label>
						<s:select  name="worker.workerSex"  list="#{'男':'男','女':'女'}"></s:select>
					  </td>
				      </tr>-->

			     <tr>
					<td align="right">
						生日
					</td>
					<td>
					   <s:textfield name="worker.workerAge" cssClass="input_1 input_1_w validate[required,custom[number],min[16],max[100]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						身份证号
					</td>
					<td>
					   <s:textfield name="worker.workerIdnumber" cssClass="input_1 input_1_w"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						地址
					</td>
					<td>
					   <s:textfield name="worker.workerAddress" cssClass="input_1 input_1_w validate[required,maxSize[256]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						联系电话
					</td>
					<td>
					   <s:textfield name="worker.workerPhone" cssClass="input_1 input_1_w validate[custom[number]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>


			 <tr>
			    <td align="right">&nbsp;</td>
			    <td height="60"> 
			    <input type="button" name="back" id="back" value="返回"  class="btn_tj btn_tj_w" onclick="history.go(-1)"/></td>
			  </tr>
			</table>

		</s:form>
		
	</body>
</html>