
var imageright = '../images/alert/right.png';
var imageerror = '../images/alert/error.png';
var imagewarn = '../images/alert/warning.png';

function checkForm() {

}
//身份证校验
// 身份证号合法性验证
// 支持15位和18位身份证号
// 支持地址编码、出生日期、校验位验证
function IdentityCodeValid(code) {
	var city = {11 : "北京",12 : "天津",13 : "河北",14 : "山西",15 : "内蒙古",21 : "辽宁",22 : "吉林",23 : "黑龙江 ",31 : "上海",32 : "江苏",33 : "浙江",
		34 : "安徽",35 : "福建",36 : "江西",37 : "山东",41 : "河南",42 : "湖北 ",43 : "湖南",44 : "广东",45 : "广西",46 : "海南",50 : "重庆",51 : "四川",
		52 : "贵州",53 : "云南",54 : "西藏 ",61 : "陕西",62 : "甘肃",63 : "青海",64 : "宁夏",65 : "新疆",71 : "台湾",81 : "香港",82 : "澳门",91 : "国外 "
	};
	var result = {pass:true,tip:""};
	if (!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)) {
		result.tip = "身份证号格式错误";
		result.pass = false;
		return result;
	}else if (!city[code.substr(0, 2)]) {
		result.tip = "地址编码错误";
		result.pass = false;
		return result;
	} else {
		// 18位身份证需要验证最后一位校验位
		if (code.length == 18) {
			code = code.split('');
			// ∑(ai×Wi)(mod 11)
			// 加权因子
			var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
			// 校验位
			var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
			var sum = 0;
			var ai = 0;
			var wi = 0;
			for ( var i = 0; i < 17; i++) {
				ai = code[i];
				wi = factor[i];
				sum += ai * wi;
			}
			var last = parity[sum % 11];
			if (parity[sum % 11] != code[17]) {
				result.tip = "身份证输入不合法";
				result.pass = false;
				return result;
			}
		}
	}
	return result;
}

//弹窗
function jqAlaert(msg , image){
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
}

//Description:  银行卡号Luhm校验

//Luhm校验规则：16位银行卡号（19位通用）:

// 1.将未带校验位的 15（或18）位卡号从右依次编号 1 到 15（18），位于奇数位号上的数字乘以 2。
// 2.将奇位乘积的个十位全部相加，再加上所有偶数位上的数字。
// 3.将加法和加上校验位能被 10 整除。
function luhmCheck(bankno){
	var result = {pass:true,tip:""};
	if (bankno.length < 16 || bankno.length > 19) {
		result.tip = "银行卡号长度必须在16到19之间";
		result.pass = false;
		return result;
	}
	var num = /^\d*$/;  //全数字
	if (!num.exec(bankno)) {
		result.tip = "银行卡号必须全为数字";
		result.pass = false;
		return result;
	}
	//开头6位
	var strBin="10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";    
	if (strBin.indexOf(bankno.substring(0, 2))== -1) {
		result.tip = "银行卡号开头6位不符合规范";
		result.pass = false;
		return result;
	}
	    var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhm进行比较）
	    var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
	    var newArr=new Array();
	    for(var i=first15Num.length-1;i>-1;i--){    //前15或18位倒序存进数组
	        newArr.push(first15Num.substr(i,1));
	    }
	    var arrJiShu=new Array();  //奇数位*2的积 <9
	    var arrJiShu2=new Array(); //奇数位*2的积 >9
	    
	    var arrOuShu=new Array();  //偶数位数组
	    for(var j=0;j<newArr.length;j++){
	        if((j+1)%2==1){//奇数位
	            if(parseInt(newArr[j])*2<9)
	            arrJiShu.push(parseInt(newArr[j])*2);
	            else
	            arrJiShu2.push(parseInt(newArr[j])*2);
	        }
	        else //偶数位
	        arrOuShu.push(newArr[j]);
	    }
	    
	    var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
	    var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
	    for(var h=0;h<arrJiShu2.length;h++){
	        jishu_child1.push(parseInt(arrJiShu2[h])%10);
	        jishu_child2.push(parseInt(arrJiShu2[h])/10);
	    }        
	    
	    var sumJiShu=0; //奇数位*2 < 9 的数组之和
	    var sumOuShu=0; //偶数位数组之和
	    var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
	    var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
	    var sumTotal=0;
	    for(var m=0;m<arrJiShu.length;m++){
	        sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
	    }
	    
	    for(var n=0;n<arrOuShu.length;n++){
	        sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
	    }
	    
	    for(var p=0;p<jishu_child1.length;p++){
	        sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
	        sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
	    }      
	    //计算总和
	    sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
	    
	    //计算Luhm值
	    var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;        
	    var luhm= 10-k;
	    
	    if(lastNum==luhm){
//	    $("#banknoInfo").html("Luhm验证通过");
	    	return result;
	    }
	    else{
//		    $("#banknoInfo").html("银行卡号必须符合Luhm校验");
	    	result.tip = "银行卡号有误";
			result.pass = false;
		    return result;
	    }        
}
//进度条样式控制
function stepStyle(){
	$(".step-2 .u-stage-icon-inner .bg").css("opacity","1");
	$(".u-progress-bar-inner").css("width","auto");
	
}

//密码校验
function  checkPwd(oldpwd,newpwd,conpwd){
	var result = {pass:true,tip:""};
	var pwdReg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,8}$/;
	if(!oldpwd){
		result.tip = "原密码不能为空";
		result.pass = false;
	    return result;
	}
	if(!newpwd){
		result.tip = "新密码不能为空";
		result.pass = false;
	    return result;
	}else{
		if(!pwdReg.test(newpwd)){
			result.tip = "新密码必须由6-8位数字和字母组成";
			result.pass = false;
		    return result;
		}
	}
	if(newpwd !=conpwd){
		result.tip = "两次密码不一致";
		result.pass = false;
	    return result;
	}
	return result;
	
}
//强制刷新页面
function reloadpage(){
	window.location.reload();
}

