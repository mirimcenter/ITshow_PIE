
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

	function formChk_comment(){
		var id = document.frm.id.value;
		var contents = document.frm.comment_contents;
		
		if(id == "null"){
			alert("로그인 하세요.");
			location.href="login.jsp";
			return;
		}
		
		if(contents.value == ""){
			alert("내용을 입력하세요.");
			contents.focus();
			return;
		}
		
		frm.submit();
	}
	
	function formChk_search(){
		var text = document.frm.search_text;
		
		if(text.value == ""){
			alert("검색할 내용을 입력하세요.");
			text.focus();
			return;
		}
		
		frm.submit();
	}