function fileName(){
	var preview = new FileReader();
        preview.onload = function (e) {
        // img id 값 
        document.getElementById("imgFile").src = e.target.result;
    };
    // input id 값 
    preview.readAsDataURL(document.getElementById("img").files[0]);
};

