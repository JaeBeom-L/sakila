<div id="sidebar" class="active">
	<div class="sidebar-wrapper active">
    	<div class="sidebar-header">        	
       		<div class="row">
       			<h1>video</h1>
        		<c:if test="${loginStaff != null}">
					<h6>
						<a href="${pageContext.request.contextPath}/admin/logout">logout</a>
					</h6>
				</c:if>
			</div>				
      	</div>
      	<div class="sidebar-menu">
			<ul class="menu">
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getBoardList">boardList</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/staffList">staffList</a>
			  </li>
			   <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getFilmList">filmList</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getActorList">actorList</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getCustomerList">customerList</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getInventoryList">inventoryList</a>
			  </li>
			</ul>
		</div>
	</div>
</div>
