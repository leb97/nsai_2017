<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.login.title'/>
	<asset:stylesheet src='spring-security-ui-auth.css'/>
</head>
<body>
<content tag="nav">
	<sec:ifAllGranted roles="ROLE_ADMIN">
		<li class="dropdown">
			<a href="/userRole/index"><g:message code="my.admin.roles" /></a>
		<li class="dropdown">
			<a href="/user"><g:message code="users" /></a>
		<li class="dropdown">
			<a href="/subject/adminIndex"><g:message code="my.admin.subjects" /></a>
		<li class="dropdown">
            <a href="/score/adminIndex"><g:message code="my.admin.scores" /></a>
	</sec:ifAllGranted>
	%{--student menu--}%
	<sec:ifAllGranted roles="ROLE_STUDENT">
		<li class="dropdown">
            <a href="/score/studentindex"><g:message code="my.scores" /></a>
	</sec:ifAllGranted>

	%{--teacher menu--}%
	<sec:ifAllGranted roles="ROLE_TEACHER">
		<li class="dropdown">
			<a href="/subject/teacherIndex"><g:message code="my.subjects" /></a>
		<li class="dropdown">
            <a href="/score/teacherindex"><g:message code="my.scores" /></a>
	</sec:ifAllGranted>
	%{--not logged in--}%
	<sec:ifNotLoggedIn>
		<li class="dropdown">
            <a href="/register/register"><g:message code="my.register" /></a>
	</sec:ifNotLoggedIn>
	<sec:ifNotLoggedIn>
		<li class="dropdown">
            <a href="/login/index"><g:message code="my.login" /></a>
	</sec:ifNotLoggedIn>
	%{--all logged in--}%
	<sec:ifLoggedIn>
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				<g:message code="hello" /> <sec:username/>
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="/user/showMy/${sec.loggedInUserInfo(field: 'id')}"><g:message code="my.profile" /></a> </li>
				<li>(<g:link controller="logout"><g:message code="my.logout" /></g:link>)</li>
			</ul>
		</li>
	</sec:ifLoggedIn>
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			<g:message code="my.language" />
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="?lang=pl"><g:message code="my.language.polish" /></a> </li>
			<li><a href="?lang=en"><g:message code="my.language.english" /></a> </li>
			<li><a href="?lang=de"><g:message code="my.language.german" /></a> </li>
		</ul>
	</li>
</content>
<p/>
<div class="login s2ui_center ui-corner-all" style='text-align:center;'>
	<div class="login-inner">
		<s2ui:form type='login' focus='username'>
			<div class="sign-in">
				<h2><g:message code='spring.security.ui.login.signin'/></h2>
				<table>
					<tr>
						<td><label for="username"><g:message code='spring.security.ui.login.username'/></label></td>
						<td><input type="text" name="${securityConfig.apf.usernameParameter}" id="username" class='formLogin' size="20"/></td>
					</tr>
					<tr>
						<td><label for="password"><g:message code='spring.security.ui.login.password'/></label></td>
						<td><input type="password" name="${securityConfig.apf.passwordParameter}" id="password" class="formLogin" size="20"/></td>
					</tr>
					<tr>
						<td colspan='2'>
							<input type="checkbox" class="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me" checked="checked"/>
							<label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label> |
							<span class="forgot-link">
								<g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan='2'>
							<s2ui:linkButton elementId='register' controller='register' messageCode='spring.security.ui.login.register'/>
							<s2ui:submitButton elementId='loginButton' messageCode='spring.security.ui.login.login'/>
						</td>
					</tr>
				</table>
			</div>
		</s2ui:form>
	</div>
</div>
</body>
</html>
