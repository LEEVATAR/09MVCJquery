<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	function fncGetUserList(currentPage, menu){
		//document.getElementById("currentPage").value = currentPage;
		//document.getElementById("menu").value = menu;
	   	//document.detailForm.submit();
	   	$("#currentPage").val(currentPage)
	    $("#param.menu").val(menu)
	   	//$("#menu").val(menu)
	   	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	//==> 추가된부분 : "검색" ,  prodNo link  Event 연결 및 처리
	 $(function() {		 
			//==> 검색 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
			 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				fncGetUserList(1);
			});
			
			//==> userId LINK Event 연결처리
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
			//$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					//alert()
				//self.location ="/product/updateProduct?prodNo=$(product.prodNo)&menu=manage"; 
					//<input type="hidden" id="menu" name="manage" class="manage_prodNo" value="${product.prodNo }"/>
			//1. input의 id로 접근해서 값 가져오기
			//   var value =$('#test_id').val();
			//2. input의 class로 접근해서 값 가져오기
			//   var value = $('.test_class').val();
			//class="manage_prodNo"
			//3. input의 name으로 접근해서 값 가져오기
            //  var value = $('input[name=test_name]').val();
			//});
			//$(this).children('input:hidden').val()n
			
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					var prodNo = $('#menu').val();
					//Debug..
					//alert($('.manage_prodNo').val());
					//alert($('#menu').val());
					//alert($('input[name=manage]').val());
					//alert($('#manageprodNo').val());
					//alert($(this).text().trim());
					//alert($('#menu').attr('name'));
					//alert(prodNo);
					alert($(this).children('input:hidden').val());
					//self.location ="/product/updateProduct?prodNo="+$('#menu').val();+"&menu="+$('#menu').attr('name'); 
					//alert(selflocation);					
					if(($('#menu').attr('name')) == "manage"){
						//alert(selflocation);
						self.location ="/product/updateProduct?prodNo="+$(this).children('input:hidden').val()+"&menu="+$('#menu').attr('name');
					}
					
					if(($('#menu').attr('name')) == "search"){
						//alert(selflocation);
						self.location ="/product/getProduct?prodNo="+$(this).children('input:hidden').val()+"&menu="+$('#menu').attr('name');
					}
			});
			/*
			$( ".prodNo" ).on("click" , function() {
				//Debug..
				alert(  $( this ).text().trim() );
				self.location ="/product/updateProduct?prodNo="+$(this).find('input').val();+"&menu=manage"; 
			});
			*/
			//$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				//self.location ="/product/getProduct?prodNo=$(product.prodNo)&menu=search"; 
			//});
			//$("td.ct_ttl01::contains('관리')").on("click", function(){
				//alert($(this).text().trim());
			//	self.location ="/product/updateProduct?prodNo=$(product.prodNo)&menu=manage"; 
			//});
			//$("td.ct_ttl01::contains('목록조회')").on("click", function(){
				//alert($(this).text().trim());
			//	self.location ="/product/getProduct?prodNo=$(product.prodNo)&menu=search"; 
			//});
			
			//==> UI 수정 추가부분  :  prodNo LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			
			//==> 아래와 같이 정의한 이유는 ??
			//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
			//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		});	
	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">
<!--<c:set var = "pageType" value="product" scope="request"/>  action="/product/listProduct?menu=${ param.menu }" method="post"-->
<div style="width:98%; margin-left:10px;">


<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">								
					<c:choose>
						<c:when test = "${param.menu eq 'manage'}">
						상품 관리
						</c:when>		
						<c:when test = "${param.menu eq 'search'}">
						상품 목록조회
						</c:when>						
					</c:choose>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${! empty search.searchCondition.equals("0") ? "selected" : "" }>상품번호</option>
				<option value="1" ${! empty search.searchCondition.equals("1") ? "selected" : ""}>상품명</option>
				<option value="2" ${! empty search.searchCondition.equals("2") ? "selected" : ""}>상품가격</option>
			</select>
			<input type="text" name="searchKeyword"  
							value="${! empty search.searchKeyword ? search.searchKeyword : "" }" 
							class="ct_input_g" style="width:200px; height:19px" />
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
					<!--<a href="javascript:fncGetUserList('1');">검색</a> -->
					검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>		
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<!-- <td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td> -->
		<td class="ct_list_b" width="150">
			상품명<br>
			<h7 >(상품명 click:상세정보)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>			
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }"/>	
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left"> 
			<c:choose>
				<c:when test = "${param.menu eq 'manage'}">
			<!-- a href="/product/updateProduct?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a> -->
			<input type="hidden" id="menu" name="manage" class="manage_prodNo" value="${product.prodNo }"/>
			<!-- input type="hidden" id="manageprodNo" name="prodNo" value="${product.prodNo}" title="${product.prodName }"/> -->
				</c:when>
				<c:when test = "${param.menu eq 'search'}">
			<!-- a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a> -->
			<input type="hidden" id="menu" name="search" class="search_prodNo" value="${product.prodNo }"/>
			<!-- input type="hidden" id="searchprodNo" name="prodNo" value="${product.prodNo}" title="${product.prodNo }"/> -->	
				</c:when>
			</c:choose>
			${product.prodName}
			</td>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>
			<td></td>
			<td align="left">${product.proTranCode}</td>	
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>	
		</c:forEach>		
</table>
<!-- 페이지 Navigation 시작부분 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		    <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div>
</body>
</html>
