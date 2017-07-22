Shiny.addCustomMessageHandler("message",
	function(message){
		alert(JSON.stringify(message));
	}
);