
	function formChk(){
		var f = document.frm.f;
		var file = document.frm.file;
		var title = document.frm.title;
		var contents = document.frm.contents;
	    var ext = f.value.slice(f.value.lastIndexOf(".") + 1).toLowerCase();
		
		if(title.value == ""){
			alert("제목을 입력하세요.");
			title.focus();
			return;
		}
		if(contents.value == ""){
			alert("내용을 입력하세요.");
			contents.focus();
			return;
		}

	    if (f.value != "" && !(ext == "gif" || ext == "jpg" || ext == "png")) {
	        alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
	        return;
	    }
	    
		file.value = f.value;
	    
		frm.submit();
	}