<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="my.profile"/></title>
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
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="my.profile"/></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <center>
                <br/>
                <label for="username">
                    <g:message code="user.username.label" default="Username"/>
                </label>
                <f:display name="username" bean="user" property="username"/>
                <br/>
                <br/>
                <label for="firstName">
                    <g:message code="user.firstName.label" default="First Name"/>
                </label>
                <f:display name="firstName" bean="user" property="firstName" label="username"/>
                <br/>
                <br/>
                <label for="lastName">
                    <g:message code="user.lastName.label" default="Last Name"/>
                </label>
                <f:display name="lastName" bean="user" property="lastName" label="username"/>
                <br/>
                <br/>
                <label for="email">
                    <g:message code="user.email.label" default="Email"/>
                </label>
                <f:display name="email" bean="user" property="email" label="username"/>
                <br/>
            </center>

            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="editMy" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
