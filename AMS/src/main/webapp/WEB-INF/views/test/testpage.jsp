<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="content-page">
	<div class="card-body">
		<div class="row">
             <div class="col-lg-6">
                 <div class="card">
                     <div class="card-body">
						<h4 class="mt-0 header-title">버튼</h4>
                        <button type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">버튼</button>
                     </div>
                     <div class="col-xs-6 col-sm-3 mb-5">
                        <p class="text-muted">Confirm Dialog</p>
                        <button type="button" class="btn btn-primary waves-effect waves-light" id="alertify-confirm">Click me</button>
                    </div>
                 </div>
             </div> <!-- end col -->

             <div class="col-lg-6">
                 <div class="card">
                     <div class="card-body">

                         <h4 class="mt-0 header-title">테이블</h4>
                         <p class="text-muted mb-4 font-14">Add <code>.table-bordered</code>
                         </p>

                         <table class="table table-bordered">
                             <thead>
                             <tr>
                                 <th>#</th>
                                 <th>First Name</th>
                                 <th>Last Name</th>
                                 <th>Username</th>
                             </tr>
                             </thead>
                             <tbody>
                             <tr>
                                 <th scope="row">1</th>
                                 <td>Mark</td>
                                 <td>Otto</td>
                                 <td>@mdo</td>
                             </tr>
                             <tr>
                                 <th scope="row">2</th>
                                 <td>Mark</td>
                                 <td>Otto</td>
                                 <td>@TwBootstrap</td>
                             </tr>
                             <tr>
                                 <th scope="row">3</th>
                                 <td colspan="2">Larry the Bird</td>
                                 <td>@twitter</td>
                             </tr>
                             </tbody>
                         </table>
                     </div>
                 </div>
             </div> <!-- end col -->
             
         </div> <!--end low -->
	</div>
</div>
        <!-- jQuery  -->
        <script src="resources/assets/js/jquery.min.js"></script>
        <script src="resources/assets/js/popper.min.js"></script>
        <script src="resources/assets/js/bootstrap.min.js"></script>
        <script src="resources/assets/js/modernizr.min.js"></script>
        <script src="resources/assets/js/detect.js"></script>
        <script src="resources/assets/js/fastclick.js"></script>
        <script src="resources/assets/js/jquery.blockUI.js"></script>
        <script src="resources/assets/js/waves.js"></script>
        <script src="resources/assets/js/jquery.nicescroll.js"></script>

        <!-- Alertify js -->
        <script src="resources/assets/plugins/alertify/js/alertify.js"></script>
        <script src="resources/assets/pages/alertify-init.js"></script>

        <!-- App js -->
        <script src="resources/assets/js/app.js"></script>
</body>
</html>