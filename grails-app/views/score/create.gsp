<%@ page import="java.security.Principal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
    <center>
        <a href="#create-score" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="create-score" class="content scaffold-create" role="main">
            <h1><g:message code="my.score.add" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.score}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.score}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.score}" method="POST">
                <fieldset class="form">
                    <label for="score">
                    <g:message code="my.score.score" default="Score"/>
                    <span class="required-indicator">*</span>
                    </label>
                    <g:field type="number" name="score" min="1" max="5" required="true" value="${score?.score}"/>
<br/><br/>
                    <g:set var="currentUser"><sec:username/></g:set>
                    <label for="subject">
                        <g:message code="my.score.subject" default="Subject"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="subject" name="subject" value="${score?.subject}"
                              optionValue="name"
                              optionKey="id"
                              from='${score.getSubjects("${currentUser}")}'>
                    </g:select>
<br/><br/>
                    <label for="student">
                        <g:message code="my.score.student" default="Student"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="student" name="user" value="${score?.user}"
                              optionValue="username"
                              optionKey="id"
                              from='${score.getStudents()}'>
                    </g:select>

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'my.score.add', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </center>
    </body>
</html>
