// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

// TODO: write your module tests here
var ticordova = require('org.selfkleptomaniac.ti.mod.ticordova');
Ti.API.info("module is => " + ticordova);

label.text = ticordova.example();

Ti.API.info("module exampleProp is => " + ticordova.exampleProp);
ticordova.exampleProp = "This is a test value";

if (Ti.Platform.name == "android") {
	var proxy = ticordova.createExample({
		message: "Creating an example Proxy",
		backgroundColor: "red",
		width: 100,
		height: 100,
		top: 100,
		left: 150
	});

	proxy.printMessage("Hello world!");
	proxy.message = "Hi world!.  It's me again.";
	proxy.printMessage("Hello world!");
	win.add(proxy);
}

var webview = ticordova.createWebView({userAgent:'dofjadojfosaidfjasd/1.0', url:'http://dev.voidoid.com/webview', top:0, height:Ti.UI.FILL, width:Ti.UI.FILL});
webview.setUserAgent('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh/1.0');

webview.addEventListener('my_event', function(e){
  Ti.API.info(e);
  alert(e);
  Ti.API.info(webview.html);
});

win.add(webview);

