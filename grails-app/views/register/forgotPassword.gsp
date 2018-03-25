<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.forgotPassword.title'/>
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

<s2ui:formContainer type='forgotPassword' focus='username' width='50%'>
	<s2ui:form beanName='forgotPasswordCommand'>
		<g:if test='${emailSent}'>
		<br/>
		<g:message code='spring.security.ui.forgotPassword.sent'/>
		</g:if>
		<g:else>
		<br/>
		<h3><g:message code='spring.security.ui.forgotPassword.description'/></h3>
		<table>
			<s2ui:textFieldRow name='username' size='25' labelCodeDefault='Username'/>
		</table>
		<s2ui:submitButton elementId='submit' messageCode='spring.security.ui.forgotPassword.submit'/>
		</g:else>
	</s2ui:form>
</s2ui:formContainer>
</body>
</html>
