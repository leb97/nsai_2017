<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.register.title'/>
</head>
<body>
<    <content tag="nav">
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

<div id="content" role="main">
	<section class="row colset-2-its">

		<s2ui:formContainer type='register' focus='username' width='800px'>
			<s2ui:form beanName='registerCommand'>
				<g:if test='${emailSent}'>
				<br/>
				<g:message code='spring.security.ui.register.sent'/>
				</g:if>
				<g:else>
				<br/>
				<table>
					<tbody>
					<s2ui:textFieldRow name='username' size='40' labelCodeDefault='Username'/>
					<s2ui:textFieldRow name='email' size='40' labelCodeDefault='E-mail'/>
					<s2ui:passwordFieldRow name='password' size='40' labelCodeDefault='Password'/>
					<s2ui:passwordFieldRow name='password2' size='40' labelCodeDefault='Password (again)'/>
					</tbody>
				</table>
					<s2ui:submitButton elementId='submit' messageCode='spring.security.ui.register.submit'/>
					<recaptcha:ifEnabled>
						<recaptcha:recaptcha theme="clean"/>
					</recaptcha:ifEnabled>
				</g:else>
			</s2ui:form>
		</s2ui:formContainer>
	</section>
</div>
</body>
</html>
