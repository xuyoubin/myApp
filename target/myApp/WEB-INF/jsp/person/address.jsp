<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>地址管理</title>
	</head>
	<body>
		<div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
							<c:forEach items="${addressList }" var="address" varStatus="i">
								<li class="user-addresslist ${address.state eq 1 ? 'defaultAddr':'' }">
									<span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
									<p class="new-tit new-p-re">
										<span class="new-txt" id="name">${address.name }</span>
										<span class="new-txt-rd2" id="phone">${address.phone }</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">地址：</span>
											<span class="province">${address.province }</span>
											<span class="city">${address.city }</span>
											<span class="dist">${address.area }</span>
											<span class="street">${address.detail }</span>
										</p>
									</div>
									<div class="new-addr-btn">
										<a href="javascript:void(0);" addressid="${address.id }"  onclick="updateAddress(this);"><i class="am-icon-edit"></i>编辑</a>
										<span class="new-addr-bar">|</span>
										<a href="javascript:void(0);" addressid="${address.id }" onclick="jqComfirn(this);"><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
							</c:forEach>
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" id="user-name" name="name" value="" placeholder="收货人必填" placeholder="收货人">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="user-phone" name="phone" value="" placeholder="手机号必填" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<div class="am-form-content address">
												<select data-am-selected id="province">
													<option value="" select="selected">请选择</option>
													<c:forEach items="${provinceList }" var="province" varStatus="i">
														<option value="${province.id }" >${province.name }</option>
													</c:forEach>
												</select>
												<select data-am-selected id="city">
												<option value="" select="selected">请选择</option>
												</select>
												<select data-am-selected id="area">
												<option value="" select="selected">请选择</option>
												</select>
											</div>
											
										</div>
										<div style="margin-top:-35px;"><text style="font-size:3px;color:red">*先选择省份</text></div>
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="user-intro" name="detail" placeholder="输入详细地址" ></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a class="am-btn am-btn-danger" style="color:#fff;" href="javascript:void(0)" onclick="save();">保存</a>
												<!-- <a href="javascript:void(0)" onclick="clearVal();" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a> -->
											</div>
										</div>
										
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

				</div>
				<!--底部-->
				<%@ include file="/WEB-INF/jsp/person/footer.jsp" %>
			</div>
			<!-- 左边菜单 -->
			<%@ include file="/WEB-INF/jsp/person/leftmenu.jsp" %>
		</div>
	</body>
</html>
<script type="text/javascript">
//var imageright = '../images/alert/right.png';
//var imageerror = '../images/alert/error.png';
//var imagewarn = '../images/alert/warning.png';
var addresskey="";

$(document).ready(function() {
	//默认地址选择样式变化
							
	$(".new-option-r").click(function() {
		$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
	});
	
	var $ww = $(window).width();
	if($ww>640) {
		$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
	}
	//根据选择的省获取相对应的市级城市
	$("#province").on("change",function(){
		var provinceid = $("#province").val();
		if(!provinceid){
			$("#city").html("<option value=''>"+"请选择"+"</option>");
			return;
		}
		$.ajax({
			type:"post",
			url:"../person/getCity.do",
			data:{
				provinceid:provinceid,
			},
			dataType: 'json',
			success:function(result){
				if(result.success){
					var str = "<option value=''>"+"请选择"+"</option>";
					if(result.cityList != null && result.cityList.length>0){
						$.each(result.cityList,function(i,item){
							str = str+"<option value='"+item.id+"'>"+item.name+"</option>";
							$("#city").html(str);
						});
					}else{
						$("#city").html(str);
					}
				}else{
					$("#city").html("<option value=''>"+"请选择"+"</option>");
					jqAlaert(result.note,imageerror);
				}
			},
		});
	});
	//根据选择市级城市获取相对应的区县
	$("#city").on("change",function(){
		var cityid = $("#city").val();
		if(!cityid){
			$("#area").html("<option value=''>"+"请选择"+"</option>");
			return;
		}
		$.ajax({
			type:"post",
			url:"../person/getArea.do",
			data:{
				cityid:cityid,
			},
			dataType: 'json',
			success:function(result){
				if(result.success){
					var str = "<option value=''>"+"请选择"+"</option>";
					if(result.areaList != null && result.areaList.length>0){
						$.each(result.areaList,function(i,item){
							str = str+"<option value='"+item.id+"'>"+item.name+"</option>";
							$("#area").html(str);
						});
					}else{
						$("#area").html(str);
					}
				}else{
					$("#area").html("<option value=''>"+"请选择"+"</option>");
					jqAlaert(result.note,imageerror);
				}
			},
		});
	});
})

//弹窗
/* function jqAlaert(msg , image){
	 // 判断是否已存在，如果已存在则直接显示
	 var M = {}
	if(M.dialog11){
	    return M.dialog11.show();
	}
	M.dialog11 = jqueryAlert({
	    'icon'    : image,
	    'content' : msg,
	    'closeTime' : 2000,
	}) 
}*/
function jqComfirn(obj){
 	var M = {}
	// 判断是否已存在，如果已存在则直接显示
	if(M.dialog9){
	    return M.dialog9.show();
	}
	M.dialog9 = jqueryAlert({
	    'style'   : 'pc',
	    'title'   : '      ',
	    'content' :  '    确定删除该收货地址？     ',
	    'modal'   : true,
	    'contentTextAlign' : 'left',
	    'animateType': 'scale',
	    'bodyScroll' : 'true',
	    'buttons' : {
	        '取消' : function(){
	            M.dialog9.close();
	        },
	        '确定' : function(){
	        	 M.dialog9.close();
	            var addressid = $(obj).attr("addressid");
				if(addressid){
					$.ajax({
						type:"post",
						url:"../person/delAddress.do",
						data:{
							addressid:addressid,
						},
						dataType:'json',
						success:function(result){
							if(result.success){
								jqAlaert("删除成功",imageright);
								
							}else{
								jqAlaert(result.note,imageerror);
							}
						},
						complete : function(){
						   setTimeout('reloadpage()',1000);   
		                },
					});
				}else{
					jqAlaert("无法获取地址该地址id",imageerror);
				}
	        }
	    }
	})
}

//添加一个收货地址
function save(){
	var key = addresskey ;
	var name = $.trim($("#user-name").val());
	var phone = $.trim($("#user-phone").val());
	//var perince = $("#province").find("option:selected").text();
	//var city = $("#city").find("option:selected").text();
	//var area = $("#area").find("option:selected").text();
	var perince = $("#province").next().find("button").find("span").text(); //省级输入框赋值
	var city = $("#city").next().find("button").find("span").text(); //城市输入框赋值 
	var area = $("#area").next().find("button").find("span").text(); //区县输入框赋值 
	var areaVal = area.indexOf("点击选择")>=0?"":area;
	var detail = $.trim($("#user-intro").val());
	var result = checkForm(name,phone,perince,city,detail);
	if(!result.success){
		jqAlaert(result.msg,imagewarn);
		return;
	}
	//提交数据
	$.ajax({
		type:"post",
		url:"../person/addAddress.do",
		data:{
			addressid:key,
			name:name,
			phone:phone,
			perince:perince,
			city:city,
			area:areaVal,
			detail:detail,
		},
		dataType:"json",
		success:function(result){
			if(result.success){
				jqAlaert("保存成功",imageright);
			}else{
				jqAlaert(result.note,imageerror);
			}
		},
		complete:function(){
			setTimeout('reloadpage()', 1000);
		},
	});
	

}

function checkForm(name,phone,perince,city,detail){
	var result = {success:true,msg:""};
	var phoneReg = /^(13\d|14[57]|15[012356789]|18\d|17[013678])\d{8}$/;
	if(!name){
		result.success = false;
		result.msg = "收件人不能为空";
		return result;
	}
	if(!phone){
		result.success = false;
		result.msg = "手机号码不能为空";
		return result;
	}else{
		if(!phoneReg.test(phone)){
			result.success = false;
			result.msg = "手机格式不正确";
			return result;
		}
	}
	if(perince && perince.indexOf("点击选择")>=0){
		result.success = false;
		result.msg = "请选择省份";
		return result;
	}
	if(city && city.indexOf("点击选择")>=0){
		result.success = false;
		result.msg = "请选择城市";
		return result;
	}
	if(!detail){
		result.success = false;
		result.msg = "详细地址不能为空";
		return result;
	}
	return result;
} 

function updateAddress(obj){
	addresskey = $(obj).attr("addressid");
	var $parent = $(obj).parent(); //找按钮的父级元素
	var $p = $parent.siblings('p');//找同级p元素
	var $div = $parent.siblings('div');
	var name = $p.find("#name").text(); //收件人名称
	var phone = $p.find("#phone").text(); //收件人手机号码
	var province = $div.find(".province").text();
	var city = $div.find(".city").text();
	var area = $div.find(".dist").text();
	var detail = $div.find(".street").text();
	$("#user-name").val(name);
	$("#user-phone").val(phone);
	$("#user-intro").text(detail);
	
	$("#province").next().find("button").find("span").text(province); //省级输入框赋值
	$("#city").next().find("button").find("span").text(city); //城市输入框赋值 
	$("#area").next().find("button").find("span").text(area); //区县输入框赋值 
	 	
}


</script>