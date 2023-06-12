function memLevel(e, i, num) {
	const val = e.value;
	const mems = ["서울지역", "타지역", "VIP회원", "관리자"];
	let y = confirm("회원정보를" + mems[val] + "로 수정하시겠습니까?");
	
	if (y) {
		
		fetch("/user/")
	}
}