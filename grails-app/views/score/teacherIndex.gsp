<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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

    <a href="#list-score" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-score" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            %{--<f:table collection="${scoreList}" />--}%
            <g:set var="currentUser"><sec:username/></g:set>
            <table class='display'>
                <tr>
                    <th>Score</th>
                    <th>Subject</th>
                    <th>Student</th>
                </tr>
                <g:each in='${scoreList}' var="score">
                    <g:if test="${currentUser == score.subject.user.username}">
                        <tr>
                            <td>${score.score}</td>
                            <td><a href="/subject/show/${score.subject.id}">${score.subject.name}</a></td>
                            <td><a href="/user/show/${score.user.id}">${score.user.username}</a></td>
                        </tr>
                    </g:if>
                </g:each>
            </table>

            <div class="pagination">
                <g:paginate total="${scoreCount ?: 0}" />
            </div>
        </div>
    </body>
</html>