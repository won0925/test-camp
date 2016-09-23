<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");

	String pageNum=request.getParameter("page");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/css/layout/layout.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    function check() {
        var f = document.updateForm;
 
    	var str=f.areaname.value;
    	if(str==""){
    		alert("지역명을 선택하세요.")
    		return false;
    	}
    	
        str = f.placename.value;
        if(!str) {
            alert("캠핑장명을 입력하세요.");
            f.placename.focus();
            return false;
        }

    	str = f.addr.value;
        if(!str) {
            alert("주소를 입력하세요.");
            f.addr.focus();
            return false;
        }
        
        str = f.tel.value;
        if(!str) {
            alert("연락처를 입력하세요.");
            f.tel.focus();
            return false;
        }
        
        str = f.memo1.value;
        if(!str) {
            alert("간단정보를 입력하세요.");
            f.memo1.focus();
            return false;
        }
        
        str = f.memo2.value;
        if(!str) {
            alert("상세정보를 입력하세요.");
            f.memo2.focus();
            return false;
        }
        
    	f.action="<%=cp%>/campground/update_ok.do";
    		
        return true;
    }
</script>
<style type="text/css">
	 .schlbl {
	 	width: 150px;
	 	line-height : 30px;
	 	font-size: 20px;
	 	float: left;
	}
	.schcase {
		width: 500px;
		height: 220px;
		border:1px solid #666666;
		padding-top: 60px;
		padding-left:60px;
	}
	
	.map_list{
		border : 1px solid #000;
	}
</style>
</head>
<body>

<div style="height: 205px">
<div style=" height: 10px;  border-bottom: 50px solid #3cb371; margin-top: 0px">
  <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
</div>

<div class="container">
	<form name="updateForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
		<div style="border-bottom: 1px solid #ccc; margin-bottom: 30px;">
			<h3>캠핑장 정보 입력</h3>
		</div>
		<div style="width:1000px; height: 500px; margin:0px auto;">
			<div class="table-responsive" style="clear: both;"> <!-- 테이블 반응형 -->
	            <table class="table table-hover">
				<colgroup>
					<col style="width:20%">
					<col>
				</colgroup>
	                <thead>
	                	<tr>
	                        <th class="text-center">지 역 명</th>
	                        <td class="text-center" style="border-bottom: 2px solid #ddd; width: 700px;">
								<select class="form-control"  style="width: 180px;" name="areaname">
									<option value="">지역선택</option>
									<option value="서울" ${dto.areaName=="서울" ? "selected='selected'" : ""}>서울</option>
									<option value="인천" ${dto.areaName=="인천" ? "selected='selected'" : ""}>인천</option>
									<option value="경기도" ${dto.areaName=="경기도" ? "selected='selected'" : ""}>경기도</option>
									<option value="강원도" ${dto.areaName=="강원도" ? "selected='selected'" : ""}>강원도</option>
									<option value="충청북도" ${dto.areaName=="충청북도" ? "selected='selected'" : ""}>충청북도</option>
									<option value="세종" ${dto.areaName=="세종" ? "selected='selected'" : ""}>세종</option>
									<option value="대전" ${dto.areaName=="대전" ? "selected='selected'" : ""}>대전</option>
									<option value="충청남도" ${dto.areaName=="충청남도" ? "selected='selected'" : ""}>충청남도</option>
									<option value="전라북도" ${dto.areaName=="전라북도" ? "selected='selected'" : ""}>전라북도</option>
									<option value="광주" ${dto.areaName=="광주" ? "selected='selected'" : ""}>광주</option>
									<option value="전라남도" ${dto.areaName=="전라남도" ? "selected='selected'" : ""}>전라남도</option>
									<option value="경상북도" ${dto.areaName=="경상북도" ? "selected='selected'" : ""}>경상북도</option>
									<option value="대구" ${dto.areaName=="대구" ? "selected='selected'" : ""}>대구</option>
									<option value="울산" ${dto.areaName=="울산" ? "selected='selected'" : ""}>울산</option>
									<option value="경상남도" ${dto.areaName=="경상남도" ? "selected='selected'" : ""}>경상남도</option>
									<option value="부산" ${dto.areaName=="부산" ? "selected='selected'" : ""}>부산</option>
									<option value="제주도" ${dto.areaName=="제주도" ? "selected='selected'" : ""}>제주도</option>
								</select>
							</td> 
	                    </tr>
	                    <tr>
	                        <th class="text-center">캠핑장명</th>
	                        <td class="text-center" style="border-bottom: 2px solid #ddd; width: 700px;">
								<input type="text" name="placename"  value="${dto.placeName}" style="width: 100%;">
							</td> 
	                    </tr>
	                    <tr>
	                        <th class="text-center">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
	                        <td class="text-center" style="border-bottom: 2px solid #ddd; width: 700px;">
								<input type="text" name="addr" value="${dto.addr}" style="width: 100%;">
							</td> 
	                    </tr>
	                    <tr>
	                        <th class="text-center">연 락 처</th>
	                        <td class="text-center" style="border-bottom: 2px solid #ddd; width: 700px;">
								<input type="text" name="tel" value="${dto.tel}" style="width: 100%;">
							</td> 
	                    </tr>
	                    <tr>
	                        <th class="text-center">간단 정보</th>
	                        <td class="text-center" style="border-bottom: 2px solid #ddd; width: 700px;">
								<input type="text" name="memo1" value="${dto.memo1}" style="width: 100%;">
							</td> 
	                    </tr>
	                </thead>
	                <tbody>
						<tr>
							<th class="text-center">상세 정보</th>
							<td colspan="2">
								<div>
									<div style="height: 190px;">
										<textarea style="width: 100%; height: 100%;" name="memo2" >${dto.memo2}</textarea>
									</div>
									<div style="float: left;">
										<input type="file" name="upload" class="boxTF" style="line-height: 30px;">
									</div>
								</div>
							</td>
						</tr>
	                </tbody>
	                <tfoot>
						<tr height="45"> 
						<td colspan="2" align="center">
							<input type="hidden" name="num" value="${dto.num}">
        					<input type="hidden" name="page" value="${pageNum}">
							<input type="submit" class="btn btn-default" value="수정 완료">
		        		    &nbsp;&nbsp;&nbsp;
		        		    <button type="reset" class="btn btn-default">다시 입력</button>
		        		    &nbsp;&nbsp;&nbsp;
		        		    <a class="btn btn-default" href="javascript:location.href='<%=cp%>/campground/list.do';">취소</a>
						</td>
						</tr>
				  </tfoot>
	            </table>
	        </div>
		</div>
	</form>
</div>
<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="<%=cp%>/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>