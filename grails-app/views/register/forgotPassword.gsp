<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.forgotPassword.title'/>
</head>
<body>

<content tag="nav">
	<sec:ifAllGranted roles="ROLE_ADMIN">
		<li class="dropdown">
            <a href="/user">Users</a>
	</sec:ifAllGranted>
	%{--student menu--}%
	<sec:ifAllGranted roles="ROLE_STUDENT">
		<li class="dropdown">
            <a href="/score/studentindex">My Scores</a>
	</sec:ifAllGranted>

	%{--teacher menu--}%
	<sec:ifAllGranted roles="ROLE_TEACHER">
		<li class="dropdown">
            <a href="/score/teacherindex">My Subjects</a>
	</sec:ifAllGranted>
	%{--not logged in--}%
	<sec:ifNotLoggedIn>
		<li class="dropdown">
            <a href="/register/register">Sing up</a>
	</sec:ifNotLoggedIn>
	<sec:ifNotLoggedIn>
		<li class="dropdown">
            <a href="/login/index">Sing in</a>
	</sec:ifNotLoggedIn>
	%{--all logged in--}%
	<sec:ifLoggedIn>
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				Hello <sec:username/>
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="/user/show/${sec.loggedInUserInfo(field: 'id')}">Profile</a> </li>
				<li>(<g:link controller="logout">Logout</g:link>)</li>
			</ul>
		</li>
	</sec:ifLoggedIn>
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			Language
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="?lang=pl">Polish</a> </li>
			<li><a href="?lang=en">English</a> </li>
			<li><a href="?lang=de">Deutch</a> </li>
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
