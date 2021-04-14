<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>신고 처리 페이지</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="adminmain.action">관리자 페이지</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    	<a class="dropdown-item" href="main.action">메인 페이지</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.action">로그아웃</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="adminmain.action">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                관리자 메인
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                신고 처리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="plannerreportprocess.action">플래너</a>
                                    <a class="nav-link" href="notereportprocess.action">쪽지</a>
                                    <a class="nav-link" href="articlereportprocess.action">게시글</a>
                                    <a class="nav-link" href="commentreportprocess.action">댓글</a>
                                    <a class="nav-link" href="#">매칭 채팅방</a>
                                    <a class="nav-link" href="#">매칭 후기</a>
                                    <a class="nav-link" href="#">매칭 댓글</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                이용자 처리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="qnaanswerform.action" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        1대1 문의  
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="qnaanswerprocesspage.action">1대1 문의 답변처리</a>
                                            
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Administrator → <b>${memberId }</b>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">신고 처리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">
                            	<c:choose>
		                        	<c:when test="${reportType eq 'note' }">쪽지 신고 처리</c:when>
		                        	<c:when test="${reportType eq 'planner' }">플래너 신고 처리</c:when>
		                        	<c:when test="${reportType eq 'article' }">게시물 신고 처리</c:when>
		                        	<c:when test="${reportType eq 'comment' }">댓글 신고 처리</c:when>
		                        	<c:otherwise>신고 ㅋㅋ</c:otherwise>
		                        </c:choose> 
							</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Primary Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                신고 처리 리스트
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
	                                        <tr>
	                                            <th>신고 유형</th>
	                                            <th>신고 접수 코드</th>
	                                            <th>신고자</th>
	                                            <th>피신고자</th>
	                                            <th>내용</th>
	                                            <th>신고 날짜</th>
	                                            <th>해당 컨텐츠 확인</th>
	                                            <th>처리 및 처리 일자</th>
	                                           
	                                        </tr>
                                        </thead>
                                        <tbody>
                                        
                                        	<c:choose>
			                        			<c:when test="${reportType eq 'note' }">  <!-- 쪽지페이지 일 때 -->
		                                        <c:forEach var="dto" items="${lists }">
												<tr>
													<td>${dto.rep_type_detail }</td>
													<td>${dto.note_rep_in_code }</td>
													<td>${dto.reporter_id }</td>
													<td>${dto.sender_id }</td>
													<td>${dto.note_rep_in_content }</td>
													<td>${dto.note_rep_in_date }</td>
													<td style="text-align: center;">
													<a href="notedetail.action?noteCode=${dto.note_code }" style="width:90%;" class="btn btn-success">컨텐츠로 이동
													</a>
													</td>
	
													<td>
														<c:choose>
															<c:when test="${dto.note_rep_out_process eq null}">
																<a href="notereportprocessaction.action?note_rep_in_code=${dto.note_rep_in_code }&note_rep_out_process=0"><button class="btn btn-primary" style="width:40%;">승인</button></a>
																<a href="notereportprocessaction.action?note_rep_in_code=${dto.note_rep_in_code }&note_rep_out_process=1"><button class="btn btn-danger" style="width:40%;">각하</button></a>
															</c:when>
															<c:when test="${dto.note_rep_out_process eq '0'}">
																${dto.note_rep_out_date } 에 <span style="font-weight: bold; color:blue; font-size:large;">승인</span>
															</c:when>
															<c:when test="${dto.note_rep_out_process eq '1'}">
																${dto.note_rep_out_date } 에 <span style="font-weight: bold; color:red; font-size:large;">각하</span>
															</c:when>
														</c:choose>
													</td>
													
												</tr>
												</c:forEach>
												</c:when>
												
												
												<c:when test="${reportType eq 'planner' }">  <!-- 플래너페이지 일 때 -->
												<td>ㅍㄹㄴ</td>
												</c:when>
												
												<c:when test="${reportType eq 'article' }">  <!-- 게시글페이지 일 때 -->
												<c:forEach var="dto" items="${lists }">
												<tr>
													<td>${dto.rep_type_detail }</td>
													<td>${dto.article_rep_in_code }</td>
													<td>${dto.reporter_id }</td>
													<td>${dto.writer_id }</td>
													<td>${dto.article_rep_in_content }</td>
													<td>${dto.article_rep_in_date }</td>
													<td style="text-align: center;">
														<a href="memberdetailopen.action?articleCode=${dto.article_code }&memberId=${dto.writer_id}&bno=${dto.bno}&pageNum=0" style="width:90%;" class="btn btn-success">컨텐츠로 이동
														</a>
													</td>
	
													<td>
														<c:choose>
															<c:when test="${dto.article_rep_out_process eq null}">
																<a href="articlereportprocessaction.action?article_rep_in_code=${dto.article_rep_in_code }&article_rep_out_process=0"><button class="btn btn-primary" style="width:40%;">승인</button></a>
																<a href="articlereportprocessaction.action?article_rep_in_code=${dto.article_rep_in_code }&article_rep_out_process=1"><button class="btn btn-danger" style="width:40%;">각하</button></a>
															</c:when>
															<c:when test="${dto.article_rep_out_process eq '0'}">
																${dto.article_rep_out_date } 에 <span style="font-weight: bold; color:blue; font-size:large;">승인</span>
															</c:when>
															<c:when test="${dto.article_rep_out_process eq '1'}">
																${dto.article_rep_out_date } 에 <span style="font-weight: bold; color:red; font-size:large;">각하</span>
															</c:when>
														</c:choose>
													</td>
													
												</tr>
												</c:forEach>
												</c:when>
												
												<c:when test="${reportType eq 'comment' }">  <!-- 댓글페이지 일 때 -->
												<td>ㄷㄱ</td>
												</c:when>
											</c:choose>
                                        </tbody>
                                        
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>
