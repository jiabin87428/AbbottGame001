// JavaScript Document

// Date: 2014-11-07
// Author: Agnes Xu


i = 0;
j = 0;
count = 0;
MM = 0;
SS = 10;  // 秒 30s
MS = 0;
totle = (MM+1)*600;
d = 180*(MM+1);
MM = "0" + MM;
var gameTime = 10;
var completeFun = null;
//count down
var showTime = function(){
    totle = totle - 1;
    if (totle == 0) {
        clearInterval(s);
        clearInterval(t1);
		
		completeFun();
		
		// alert('时间到');
        // clearInterval(t2);
//         $(".pie2").css("-o-transform", "rotate(" + d + "deg)");
//         $(".pie2").css("-moz-transform", "rotate(" + d + "deg)");
//         $(".pie2").css("-webkit-transform", "rotate(" + d + "deg)");
    } else {
        if (totle > 0 && MS > 0) {
            MS = MS - 1;
            if (MS < 10) {
                MS = "0" + MS
            }
            ;
        }
        ;
        if (MS == 0 && SS > 0) {
            MS = 10;
            SS = SS - 1;
            if (SS < 10) {
                SS = "0" + SS
            }
            ;
        }
        ;
        if (SS == 0 && MM > 0) {
            SS = 60;
            MM = MM - 1;
            if (MM < 10) {
                MM = "0" + MM
            }
            ;
        }
        ;
    }
    ;
    // $(".time").html(SS + "s");
	// console.log("../assets/" + SS + ".png")
	$(".time").attr("src","./assets/" + SS + ".png");
	
};

var start1 = function(){
	//i = i + 0.6;
	i = i + 360/((gameTime)*10);  //旋转的角度  90s 为 0.4  60s为0.6
	count = count + 1;
	if(count <= (gameTime/2*10)){  // 一半的角度  90s 为 450
		$(".pie1").css("-o-transform","rotate(" + i + "deg)");
		$(".pie1").css("-moz-transform","rotate(" + i + "deg)");
		$(".pie1").css("-webkit-transform","rotate(" + i + "deg)");
	}else{
		// $(".pie2").css("backgroundColor", "#5953BC");
		$(".pie2").css("background", "radial-gradient(circle, #5953BC, #5953BC)");
		$(".pie2").css("-o-transform","rotate(" + i + "deg)");
		$(".pie2").css("-moz-transform","rotate(" + i + "deg)");
		$(".pie2").css("-webkit-transform","rotate(" + i + "deg)");
	}
};

var start2 = function(){
    j = j + 0.6;
    count = count + 1;
    if (count == 300) {
        count = 0;
        clearInterval(t2);
        t1 = setInterval("start1()", 100);
    }
	$(".pie2").css("-o-transform","rotate(" + j + "deg)");
	$(".pie2").css("-moz-transform","rotate(" + j + "deg)");
	$(".pie2").css("-webkit-transform","rotate(" + j + "deg)");
}

var countDown = function(complete) {
    //80*80px 时间进度条
    i = 0;
    j = 0;
    count = 0;
    MM = 0;
    SS = gameTime;
    MS = 0;
    totle = (MM + 1) * gameTime * 10;
    d = 180 * (MM + 1);
    MM = "0" + MM;

    showTime();
	completeFun = complete;

    s = setInterval("showTime()", 100);
    start1();
    //start2();
    t1 = setInterval("start1()", 100);
}

var resetCount = function() {
	$(".pie1").css("-o-transform","rotate(0deg)");
	$(".pie1").css("-moz-transform","rotate(0deg)");
	$(".pie1").css("-webkit-transform","rotate(0deg)");
	
	$(".pie2").css("backgroundColor", "#00C321");
	$(".pie2").css("background", "radial-gradient(circle, #00FA27, #00C321)");
	$(".pie2").css("-o-transform","rotate(0deg)");
	$(".pie2").css("-moz-transform","rotate(0deg)");
	$(".pie2").css("-webkit-transform","rotate(0deg)");
}