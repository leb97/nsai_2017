<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
        <a href="#list-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="my.userrole.button"/></g:link></li>
            </ul>
        </div>
        <div id="list-userRole" class="content scaffold-list" role="main">
            <h1><g:message code="my.userrole.message"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class='display'>
                <tr>
                    <th><g:message code='my.userrole.user'/></th>
                    <th><g:message code='my.userrole.role'/></th>
                </tr>
                <g:each in='${userRoleList}' var="userRole">
                        <tr>
                            <td><a href="/user/show/${userRole.user.id}">${userRole.user.username}</a></td>
                            <td><a href="/userRole/show/${userRole.role.id}">${userRole.role.authority}</a></td>
                        </tr>
                </g:each>
            </table>
        </div>
    </body>
</html>