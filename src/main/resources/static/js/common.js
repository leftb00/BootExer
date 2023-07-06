/**
 * 
 */
// 함수: 쿠키 생성
function setCookie(name, value, days) {
	var expires = "";
	if (days) {
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		expires = "; expires=" + date.toUTCString();
	}
	document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

// 함수: 쿠키 가져오기
function getCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) === ' ') c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
	}
	return null;
}

function changeCSS(cssID, cssFile) {
    var linkElement = document.getElementById(cssID);
    linkElement.href = "/r/css/" + cssFile + ".css";
    setCookie("color", cssFile, 30);
}

function joinCheck() {
	if(document.member_form.mpw.value != document.member_form.mpw2.value) {
		alert("암호와 암호확인에 입력한 값이 같지 않습니다.");
	} else {
		return true;
	}

	return false;
}

// 페이지 로드 시 쿠키에서 CSS 값 가져와서 적용
window.onload = function () {
	var color_cookie = getCookie("color");
	var color_list = document.getElementById('color_list');
	var color_groups = ['color1', 'color2', 'color3', 'color4'];
	color_groups.forEach(function(color) {
		color_list.appendChild(new Option(color, color));
	});
	if (color_cookie) {
		color_list.value = color_cookie;
		changeCSS('color_css', color_cookie);
	}
	
	// 셀렉트 박스 변경 시 CSS 변경
	color_list.onchange = function () {
		changeCSS('color_css', this.value);
	};
};
