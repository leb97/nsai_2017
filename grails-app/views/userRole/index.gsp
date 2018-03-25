<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-userRole" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class='display'>
                <tr>
                    <th>User</th>
                    <th>Role</th>
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