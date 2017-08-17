(function($){
	// \u9a8c\u8bc1\u89c4\u5219
	$.fn.validationEngineLanguage = function(){};
	$.validationEngineLanguage = {
		pushData:function(role_key,key,value){
			var role = $.validationEngineLanguage.allRules[role_key];
			if(!role){
				return;
			}
			role.extraData = null == role.extraData ? '' : (role.extraData.length > 0 ? role.extraData + '&' : '');
			role.extraData += key + '=' + value;
		},
		newLang:function(){
			$.validationEngineLanguage.allRules = {
				"required":{ 
					"regex":"none",
					"alertText":"* \u6b64\u5904\u4e0d\u53ef\u7a7a\u767d",
					"alertTextCheckboxMultiple":"* \u8bf7\u9009\u62e9\u4e00\u4e2a\u9879\u76ee",
					"alertTextCheckboxe":"* \u8be5\u9009\u9879\u4e3a\u5fc5\u9009",
					"alertTextDateRange":"* \u65e5\u671f\u8303\u56f4\u4e0d\u53ef\u7a7a\u767d"
				},
				"dateRange":{
					"regex":"none",
					"alertText":"* \u65e0\u6548\u7684 ",
					"alertText2":" \u65e5\u671f\u8303\u56f4"
				},
				"dateTimeRange":{
					"regex":"none",
					"alertText":"* \u65e0\u6548\u7684 ",
					"alertText2":" \u65f6\u95f4\u8303\u56f4"
				},
				"minSize":{
					"regex":"none",
					"alertText":"* \u6700\u5c11 ",
					"alertText2":" \u4e2a\u5b57\u7b26"
				},
				"maxSize":{
					"regex":"none",
					"alertText":"* \u6700\u591a ",
					"alertText2":" \u4e2a\u5b57\u7b26"
				},
				"groupRequired":{
					"regex":"none",
					"alertText":"* \u81f3\u5c11\u586b\u5199\u5176\u4e2d\u4e00\u9879"
				},
				"min":{
					"regex":"none",
					"alertText":"* \u6700\u5c0f\u503c\u4e3a "
				},
				"max":{
					"regex":"none",
					"alertText":"* \u6700\u5927\u503c\u4e3a "
				},
				"past":{
					"regex":"none",
					"alertText":"* \u65e5\u671f\u9700\u5728 ",
					"alertText2":" \u4e4b\u524d"
				},
				"future":{
					"regex":"none",
					"alertText":"* \u65e5\u671f\u9700\u5728 ",
					"alertText2":" \u4e4b\u540e"
				},	
				"maxCheckbox":{
					"regex":"none",
					"alertText":"* \u6700\u591a\u9009\u62e9 ",
					"alertText2":" \u4e2a\u9879\u76ee"
				},
				"minCheckbox":{
					"regex":"none",
					"alertText":"* \u6700\u5c11\u9009\u62e9 ",
					"alertText2":" \u4e2a\u9879\u76ee"
				},
				"equals":{
					"regex":"none",
					"alertText":"* \u4e24\u6b21\u8f93\u5165\u7684\u5bc6\u7801\u4e0d\u4e00\u81f4"
				},
                "creditCard": {
                    "regex": "none",
                    "alertText": "* \u65e0\u6548\u7684\u4fe1\u7528\u5361\u53f7\u7801"
                },
				"phone":{
					// credit:jquery.h5validate.js / orefalo
					// "regex":/^([\+][0-9]{1,3}[
					// \.\-])?([\(]{1}[0-9]{2,6}[\)])?([0-9
					// \.\-\/]{3,20})((x|ext|extension)[ ]?[0-9]{1,4})?$/,
                	"regex":/^1[34589]\d{9}$/ ,
					"alertText":"* \u65e0\u6548\u7684\u7535\u8bdd\u53f7\u7801"
				},
				"email":{
					// Shamelessly lifted from Scott Gonzalez via the
					// Bassistance Validation plugin
					// http://projects.scottsplayground.com/email_address_validation/
					"regex":/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
					"alertText":"* \u65e0\u6548\u7684\u90ae\u4ef6\u5730\u5740"
				},
				"integer":{
					"regex":/^[\-\+]?\d+$/,
					"alertText":"* \u65e0\u6548\u7684\u6574\u6570"
				},
				"number":{
					// Number, including positive, negative, and floating
					// decimal. credit:orefalo
                    "regex": /^[\-\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]+))?$/,
					"alertText":"* \u65e0\u6548\u7684\u6570\u503c"
				},
				"date":{
					"regex":/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/,
					"alertText":"* \u65e0\u6548\u7684\u65e5\u671f\uff0c\u683c\u5f0f\u5fc5\u9700\u4e3a YYYY-MM-DD"
				},
				"ipv4":{
					"regex":/^((([01]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))[.]){3}(([0-1]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))$/,
					"alertText":"* \u65e0\u6548\u7684 IP \u5730\u5740"
				},
				"url":{
					"regex":/^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
					"alertText":"* \u65e0\u6548\u7684\u7f51\u5740"
				},
				"onlyNumberSp":{
					"regex":/^[0-9\ ]+$/,
					"alertText":"* \u53ea\u80fd\u586b\u5199\u6570\u5b57"
				},
				"onlyLetterSp":{
					"regex":/^[a-zA-Z\ \']+$/,
					"alertText":"* \u53ea\u80fd\u586b\u5199\u82f1\u6587\u5b57\u6bcd"
				},
				"onlyLetterNumber":{
					"regex":/^[0-9a-zA-Z]+$/,
					"alertText":"* \u53ea\u80fd\u586b\u5199\u6570\u5b57\u4e0e\u82f1\u6587\u5b57\u6bcd"
				},
				// tls warning:homegrown not fielded
				"dateFormat":{
					"regex":/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/,
					"alertText":"* \u65e0\u6548\u7684\u65e5\u671f\u683c\u5f0f"
				},
				"dateFormatNoSecond":{
					"regex":/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2})$/,
					"alertText":"* \u683c\u5f0f\u4e0d\u6b63\u786e\uff0c\u683c\u5f0f\u4e3e\u4f8b\uff1a2015-01-02 03:04"
				},
				// tls warning:homegrown not fielded
				"dateTimeFormat":{
					"regex":/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/,
					"alertText":"* \u65e0\u6548\u7684\u65e5\u671f\u6216\u65f6\u95f4\u683c\u5f0f",
					"alertText2":"\u53ef\u63a5\u53d7\u7684\u683c\u5f0f\uff1a ",
					"alertText3":"mm/dd/yyyy hh:mm:ss AM|PM \u6216 ", 
					"alertText4":"yyyy-mm-dd hh:mm:ss AM|PM"
				},
				
				/**
				 * \u6b63\u5219\u9a8c\u8bc1\u89c4\u5219\u8865\u5145 Author: ciaoca@gmail.com Date: 2013-10-12
				 */
				"chinese":{
					"regex":/^[\u4E00-\u9FA5]+$/,
					"alertText":"* \u53ea\u80fd\u586b\u5199\u4e2d\u6587\u6c49\u5b57"
				},
				"chinaId":{
					/**
					 * 2013\u5e741\u67081\u65e5\u8d77\u7b2c\u4e00\u4ee3\u8eab\u4efd\u8bc1\u5df2\u505c\u7528\uff0c\u6b64\u5904\u4ec5\u9a8c\u8bc1 18 \u4f4d\u7684\u8eab\u4efd\u8bc1\u53f7\u7801 \u5982\u9700\u517c\u5bb9 15
					 * \u4f4d\u7684\u8eab\u4efd\u8bc1\u53f7\u7801\uff0c\u8bf7\u4f7f\u7528\u5bbd\u677e\u7684 chinaIdLoose \u89c4\u5219 /^[1-9]\d{5}[1-9]\d{3}( (
					 * (0[13578]|1[02]) (0[1-9]|[12]\d|3[01]) )|( (0[469]|11)
					 * (0[1-9]|[12]\d|30) )|( 02 (0[1-9]|[12]\d) )
					 * )(\d{4}|\d{3}[xX])$/i
					 */
					"regex":/^[1-9]\d{5}[1-9]\d{3}(((0[13578]|1[02])(0[1-9]|[12]\d|3[0-1]))|((0[469]|11)(0[1-9]|[12]\d|30))|(02(0[1-9]|[12]\d)))(\d{4}|\d{3}[xX])$/,
					"alertText":"* \u65e0\u6548\u7684\u8eab\u4efd\u8bc1\u53f7\u7801"
				},
				"chinaIdLoose":{
					"regex":/^(\d{18}|\d{15}|\d{17}[xX])$/,
					"alertText":"* \u65e0\u6548\u7684\u8eab\u4efd\u8bc1\u53f7\u7801"
				},
				"chinaZip":{
					"regex":/^\d{6}$/,
					"alertText":"* \u65e0\u6548\u7684\u90ae\u653f\u7f16\u7801"
				},
				"qq":{
					"regex":/^[1-9]\d{4,10}$/,
					"alertText":"* \u65e0\u6548\u7684 QQ \u53f7\u7801"
				},
				"_ajax_login_name":{
					"url": "system/user!checkLoginName", 
				    "alertTextOk": "\u7528\u6237\u540d\u9a8c\u8bc1\u901a\u8fc7", 
				    "alertText":"\u7528\u6237\u540d\u5df2\u7ecf\u88ab\u5360\u7528",
				    "alertTextLoad":"\u6b63\u5728\u9a8c\u8bc1\u7528\u6237\u540d\u662f\u5426\u88ab\u5360\u7528"
				},
				"_ajax_phone_number":{
					"url": "system/user!checkPhoneNumber", 
				    "alertTextOk": "\u624b\u673a\u53f7\u7801\u9a8c\u8bc1\u901a\u8fc7", 
				    "alertText":"\u624b\u673a\u53f7\u7801\u5df2\u7ecf\u88ab\u5360\u7528",
				    "alertTextLoad":"\u6b63\u5728\u9a8c\u8bc1\u624b\u673a\u53f7\u7801"
				},
				"_ajax_email": {
					"url": "system/user!checkEmail", 
				    "alertTextOk": "\u7535\u5b50\u90ae\u7bb1\u9a8c\u8bc1\u901a\u8fc7", 
				    "alertText":"\u90ae\u7bb1\u5730\u5740\u5df2\u7ecf\u88ab\u5360\u7528",
				    "alertTextLoad":"\u6b63\u5728\u9a8c\u8bc1\u90ae\u7bb1\u5730\u5740"
				},
				"_ajax_house_name" : {
						"url": "admin/house!check_name",
						"alertTextOk": "\u697c\u76d8\u540d\u79f0\u53ef\u4ee5\u4f7f\u7528", 
						"alertText":"\u697c\u76d8\u540d\u79f0\u5df2\u5b58\u5728",
						"alertTextLoad":"\u6b63\u5728\u9a8c\u8bc1\u697c\u76d8\u540d\u79f0"
				},
				"_ajax_unit_name" : {
					"url": "admin/govunit!check_name",
					"alertTextOk": "\u5355\u4F4D\u540D\u79F0\u53EF\u4EE5\u4F7F\u7528", 
					"alertText":"\u5355\u4F4D\u540D\u79F0\u5DF2\u5B58\u5728",
					"alertTextLoad":"\u6B63\u5728\u9A8C\u8BC1\u5355\u4F4D\u540D\u79F0"
			    },
			    "_ajax_login_name" : {
					"url": "admin/user!check_name",
					"alertTextOk": "\u767B\u5F55\u540D\u53EF\u4EE5\u4F7F\u7528", 
					"alertText":"\u767B\u5F55\u540D\u5DF2\u5B58\u5728",
					"alertTextLoad":"\u6B63\u5728\u9A8C\u8BC1\u767B\u5F55\u540D"
			    },
			    "_ajax_id_card" : {
					"url": "admin/govworker!check_card",
					"alertTextOk": "\u8EAB\u4EFD\u8BC1\u53F7\u53EF\u4EE5\u4F7F\u7528", 
					"alertText":"\u8EAB\u4EFD\u8BC1\u53F7\u5DF2\u5B58\u5728",
					"alertTextLoad":"\u6B63\u5728\u9A8C\u8BC1\u8EAB\u4EFD\u8BC1\u53F7"
			    },
				"_ajax_store_name" : {
					"url": "admin/agent!check_storename",
					"alertTextOk": "\u95E8\u5E97\u540D\u79F0\u53EF\u4EE5\u4F7F\u7528", 
					"alertText":"\u95E8\u5E97\u540D\u79F0\u5DF2\u5B58\u5728",
					"alertTextLoad":"\u6B63\u5728\u9A8C\u8BC1\u95E8\u5E97\u540D\u79F0"
		     	}
				/**
				 * \u81ea\u5b9a\u4e49\u516c\u7528\u63d0\u793a\u4fe1\u606f\uff1a \u5916\u90e8\u901a\u8fc7
				 * $.validationEngineLanguage.allRules.validate2fields.alertText
				 * \u53ef\u83b7\u53d6
				 * 
				 * "validate2fields": { "alertText": "* \u8bf7\u8f93\u5165 HELLO" },
				 * 
				 * 
				 * \u81ea\u5b9a\u4e49\u89c4\u5219\u793a\u4f8b\uff1a "requiredInFunction": { "func":
				 * function(field,rules,i,options){ return (field.val()=="test") ?
				 * true : false; }, "alertText": "* Field must equal test" },
				 * 
				 * 
				 * Ajax PHP \u9a8c\u8bc1\u793a\u4f8b "ajaxUserCallPhp": { "url":
				 * "phpajax/ajaxValidateFieldUser.php", // you may want to pass
				 * extra data on the ajax call "extraData": "name=eric", // if
				 * you provide an "alertTextOk", it will show as a green prompt
				 * when the field validates "alertTextOk": "* \u6b64\u5e10\u53f7\u540d\u79f0\u53ef\u4ee5\u4f7f\u7528",
				 * "alertText": "* \u6b64\u540d\u79f0\u5df2\u88ab\u5176\u4ed6\u4eba\u4f7f\u7528", "alertTextLoad": "*
				 * \u6b63\u5728\u786e\u8ba4\u5e10\u53f7\u540d\u79f0\u662f\u5426\u6709\u5176\u4ed6\u4eba\u4f7f\u7528\uff0c\u8bf7\u7a0d\u7b49\u3002" }, "ajaxNameCallPhp": { // remote json
				 * service location "url": "phpajax/ajaxValidateFieldName.php", //
				 * error "alertText": "* \u6b64\u540d\u79f0\u5df2\u88ab\u5176\u4ed6\u4eba\u4f7f\u7528", // speaks by itself
				 * "alertTextLoad": "* \u6b63\u5728\u786e\u8ba4\u540d\u79f0\u662f\u5426\u6709\u5176\u4ed6\u4eba\u4f7f\u7528\uff0c\u8bf7\u7a0d\u7b49\u3002" }
				 */
			};
			
		}
	};
	$.validationEngineLanguage.newLang();
})(jQuery);
