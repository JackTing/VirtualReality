//Unity3d Js

var config = {
	height:window.innerHeight-120,
	params: {                                                 // 文本颜色
				logoimage: "/Data/images/CustomLogo.png",                             //  logo
				progressbarimage: "/Data/images/CustomProgressBar.png",              // 加载进度条
				progressframeimage: "/Data/images/CustomProgressFrame.png",
				disableContextMenu: true
			 }
	
};

var UnityObject = new UnityObject2(config);
jQuery(function() {
			ActiveUnityObject();
});
function ActiveUnityObject()
{
	var $missingScreen = jQuery("#unityPlayer").find(".missing");
	var $brokenScreen = jQuery("#unityPlayer").find(".broken");
	$missingScreen.hide();
	$brokenScreen.hide();
	
	UnityObject.observeProgress(function (progress) {
		switch(progress.pluginStatus) {
			case "broken":
				$brokenScreen.find("a").click(function (e) {
					e.stopPropagation();
					e.preventDefault();
					UnityObject.installPlugin();
					return false;
				});
				$brokenScreen.show();
			break;
			case "missing":
				$missingScreen.find("a").click(function (e) {
					e.stopPropagation();
					e.preventDefault();
					UnityObject.installPlugin();
					return false;
				});
				$missingScreen.show();
			break;
			case "installed":
				$missingScreen.remove();
			break;
			case "first":
			break;
		}
	});
	UnityObject.initPlugin(jQuery("#unityPlayer")[0], "/Data/main.unity3d");
}
//Web Call Unity3d
function ActiveCamera(camera_name)
{
	UnityObject.getUnity().SendMessage("Cameras","ActiveCamera",camera_name);
}
function ActiveShow (type) {
	// 
	UnityObject.getUnity().SendMessage("Models","StartShowWithPlan",type);
}
function ShowAll() {
	// 
	UnityObject.getUnity().SendMessage("Models","StartShowAll","");
	//custom show 
	CustomShowObject("show");
}
function ShowOrigin() {
	// 
	UnityObject.getUnity().SendMessage("Models","StartShoworigin","");
	//custom show 
	CustomShowObject("hide");
}
function CustomShowObject(type)
{
	UnityObject.getUnity().SendMessage("ynm","StartCustomShow",type);
}
function ActiveLayer(objectname,show_type)
{
    var type;
    if(show_type)
    {
    	type="show";
    }
    else
    {

    	type="hide";
    }

    if (objectname=="")
    {
    	return;
    }
	UnityObject.getUnity().SendMessage("Models","ActiveLayer",objectname+"!!"+type);

}
function ActiveLight(type)
{   
	UnityObject.getUnity().SendMessage("Lights","ActiveLight",type);

}
function ShowInfos(objectname)
{
		alert(objectname);
}
function ActiveMeasurement(type)
{
	UnityObject.getUnity().SendMessage("Models","ActiveMeasurement",type);
}

function ShowPipelines()
{
	UnityObject.getUnity().SendMessage("Models","StartShowPipelines","");

}
function HidePipelines()
{
	UnityObject.getUnity().SendMessage("Models","StartHidePipelines","");

}

//document.body.parentNode.style.overflow="hidden";//隐藏且禁用

