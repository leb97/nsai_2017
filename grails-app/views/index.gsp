<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="title" /></title>
</head>
<body>
    <content tag="nav">
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <li class="dropdown">
                <a href="/user"><g:message code="users" /></a>
        </sec:ifAllGranted>
        %{--student menu--}%
        <sec:ifAllGranted roles="ROLE_STUDENT">
            <li class="dropdown">
                <a href="/score/studentindex"><g:message code="my.scores" /></a>
        </sec:ifAllGranted>

        %{--teacher menu--}%
        <sec:ifAllGranted roles="ROLE_TEACHER">
            <li class="dropdown">
                <a href="/score/teacherindex"><g:message code="my.subjects" /></a>
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
                    <li><a href="/user/show/${sec.loggedInUserInfo(field: 'id')}"><g:message code="my.profile" /></a> </li>
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

    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
        </div>
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1><g:message code="title" /></h1>

            <p>
                <g:message code="welcome.message" />
            </p>

            %{--<div id="controllers" role="navigation">--}%
                %{--<h2>Available Controllers:</h2>--}%
                %{--<ul>--}%
                    %{--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">--}%
                        %{--<li class="controller">--}%
                            %{--<g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>--}%
                        %{--</li>--}%
                    %{--</g:each>--}%
                %{--</ul>--}%
            %{--</div>--}%
        </section>
    </div>

</body>
</html>
