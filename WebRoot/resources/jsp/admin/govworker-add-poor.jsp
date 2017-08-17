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
			.btn_tj_w{
				width:218px;
			}.ui-selectmenu-button span.ui-selectmenu-text{
			line-height:22px;
			}
		</style>
		<script type="text/javascript">
			
			$(function() {
			    $("select").selectmenu({width:'440px'});

				$("#save").click(function() { 
		               vaildFormSubmit(0);
			    }); 
	
	           	$("#save1").click(function() { 
		               vaildFormSubmit(1);
			    }); 
			    
			    $("#base_frm").validationEngine({
					addPromptClass: 'formError-white formError-small',
					promptPosition: 'centerRight: 10, +1', maxErrorsPerField: true,
					autoHidePrompt:true, autoHideDelay:3000, focusFirstField: false
			     });
			    
	           	function vaildFormSubmit(flag){   
			       if($("#base_frm").validationEngine('validate')){	 
	      			  if(flag == 0){
                         $('#check').val("0");
                      } 	
		              $("#base_frm").submit();		     
	                }
			    }
			    
			 });
		
		</script>
	</head>
	<body>
		<div class="home">
			<img src="resources/images/icon_home.png" width="20" height="20" />困难职工库&nbsp;>&nbsp;困难职工管理&nbsp;>&nbsp;
			 <s:if test="null == worker.id">
		     	新增困难员工
			</s:if>
			<s:else>
			          修改困难职工
			</s:else>
		</div>
		<s:form action="govworker!save_poor" namespace="/admin" method="post" id="base_frm">
		    <s:hidden name="worker.id" />
		    <s:hidden name="workerPoor.id" />
		    <s:hidden id="check" name="workerPoor.checkFlag" />
		    
			<div class="hid_files_div"></div>
		
			<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tab_1" style="margin:40px 0 0 40px;float:left;">
				<tr>
					<td width="16%" align="right">
						客户姓名
					</td>
					<td width="84%">
						<s:textfield name="worker.workerName" cssClass="input_1 input_1_w validate[required,minSize[1],maxSize[100]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>
				<!--
				<tr>
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
					   <s:textfield name="worker.workerAge" cssClass="input_1 input_1_w validate[required,minSize[1],maxSize[16]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						身份证号
					</td>
					<td>
					  <s:if test="null == worker.id">
					     <s:textfield name="worker.workerIdnumber" cssClass="input_1 input_1_w validate[required,minSize[10],maxSize[18]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					  </s:if>
					  <s:else>
					      <s:textfield name="worker.workerIdnumber" cssClass="input_1 input_1_w validate[required,minSize[10],maxSize[18]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					  </s:else>
					</td>
				</tr>

				<tr>
					<td align="right">
						地址
					</td>
					<td>
					   <s:textfield name="worker.workerAddress" cssClass="input_1 input_1_w validate[maxSize[256]"></s:textfield>&nbsp;&nbsp;<span style="color:red">最大250个字</span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						联系方式
					</td>
					<td>
					   <s:textfield name="worker.workerPhone" cssClass="input_1 input_1_w validate[custom[phone]]"></s:textfield>&nbsp;&nbsp;<span style="color:red">*</span>
					</td>
				</tr>
						

           	   <s:if test="null != worker.id">
				  <s:if test="null != workerPoor.checkFlag">
					  <tr>
						<td align="right">
							审核状态
						</td>
						<td>
						     <s:if test="workerPoor.checkFlag == 0">未审核</s:if>
						     <s:if test="workerPoor.checkFlag == 1">审核通过</s:if>
							 <s:if test="workerPoor.checkFlag == 2">审核拒绝</s:if>
						</td>
					  </tr>
				   </s:if>
				
					 <s:if test="null != workerPoor.checkDesc">
						  <tr>
							<td align="right">
								审核意见
							</td>
							<td>
							    <s:property value="workerPoor.checkDesc"/>
							</td>
						  </tr>
					</s:if>
               </s:if>

			 <tr>
			    <td align="right">&nbsp;</td>
			    <td height="60"> 
			       <input type="submit" name="button" id="save" value="提交"  class="btn_tj btn_tj_w"/>
			     
			      <input type="submit" name="button" id="save1" value="保存"  class="btn_tj btn_tj_w"/>
			      <input type="button" name="back" id="back" value="返回"  class="btn_tj btn_tj_w" onclick="history.go(-1)"/></td>
			  </tr>
			</table>

		</s:form>
		
	</body>
</html>