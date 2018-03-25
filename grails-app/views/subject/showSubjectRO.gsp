<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-subject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-subject" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <center>
                <br/>
                <label for="name">
                    <g:message code="users.username.label" default="Subject Name"/>
                </label>
                <f:display name="name" bean="subject" property="name"/>
                <br/>
                <br/>
                <label for="teacher">
                    <g:message code="users.firstname.label" default="Teacher"/>
                </label>
                <a href="/user/showTeacher/${subject.user.id}" name="teacher">${subject.user.username}</a>
                %{--<f:display name="teacher" bean="subject" property="user.username" />--}%
            </center>
        </div>
    </body>
</html>
