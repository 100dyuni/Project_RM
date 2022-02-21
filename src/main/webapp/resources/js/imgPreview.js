
$(function() {
    $(document).on("change",".uploadFile", function()
    {
    	console.log("여긴오지?");
    	var uploadFile = $(this);
        var files = !!this.files ? this.files : [];
       // console.log("1조건 : " + (!files.length || !window.FileReader));
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
        //console.log(/^image/.test( files[0].type));
        if (/^image/.test( files[0].type)){ // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file
            console.log(1);
            reader.onloadend = function(){ // set image data as background of div
                //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
            	console.log(2);
            	console.log(this.result);
            	uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url("+this.result+")");
            	console.log("어려웡 : "+uploadFile.closest(".imgUp"));
            }
            console.log(3);
        }
        console.log("여기 아냐?:"+files[0].name);
      
    });
});