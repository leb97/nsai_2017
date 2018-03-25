<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-subject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-subject" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:set var="currentUser"><sec:username/></g:set>
            <table class='display'>
                <tr>
                    <th>Subject</th>
                    <th>Teacher</th>
                </tr>
                <g:each in='${subjectList}' var="subject">
                    <tr>
                        <td><a href="/subject/showMy/${subject.id}">${subject.name}</a></td>
                        <td>${subject.user.username}</td>
                    </tr>
                </g:each>
            </table>
        </div>
    </body>
</html>