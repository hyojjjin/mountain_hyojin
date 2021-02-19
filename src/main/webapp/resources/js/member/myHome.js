	$(document).ready(function() {
		
		// ##패스워드 에러, 패스워드 null 숨기기
		function hideSpans() {
			$('#pwError').hide();
			$('#pwNull').hide();	
		}
		
		hideSpans();
		
		// ##탈퇴 모달창에서 '취소(x)' 버튼 클릭했을 때
		$("#memberDeleteCancel1").click(function() {
			$('#pwConfirm').val('');
			$('#pwError').hide();
			$('#pwNull').hide();
		});	
		
		// ##탈퇴 모달창에서 '취소' 버튼 클릭했을 때
		$("#memberDeleteCancel2").click(function() {
			$('#pwConfirm').val('');
			$('#pwError').hide();
			$('#pwNull').hide();
		});	
		
		// ##탈퇴 모달창에서 '탈퇴' 버튼 클릭했을때
		$("#memberDelete").click(function() {
			$('#pwError').hide();
			$('#pwNull').hide();
	
			var userId = $(this).attr("data-userId"); //attribute 값
			var pwConfirm = $('#pwConfirm').val(); //value값
			//변수에 원하는 값을 넣어준다.
		
			$.ajax("/mountain/member/delete?" + $.param({userId: userId, pwConfirm:pwConfirm}), { //경로
				method: "delete" //메소드 방법(controller에서 deleteMapping으로 표시)
				//data:{id: userId, pw:pwConfirm}로 보내줬을때 읽어오질 못함
				//=> delete 방식으로 보냈을때, delete는 body가 없기 때문에 요청이 오류, 거절이 일어날 수 있다.
				//=> 해결 : 파라미터로 값을 붙여서 보내주자!
				
			}).fail(function() {
				console.log("삭제 실패");
				if($('#pwConfirm').val() == '') { 
					$('#pwNull').show();	//비밀번호를 입력해주세요.
				} else {
					$('#pwError').show();	//비밀번호가 일치하지 않습니다.
				}
	
			}).done(function() {
				console.log("삭제 완료");
				$("#memberDeleteModal").modal('hide');
				$("#memberDeleteSuccessModal").modal('show');
				
			});
		});
	});