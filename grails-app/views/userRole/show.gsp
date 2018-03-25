<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-userRole" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            %{--<f:display bean="userRole" />--}%
            <center>
                <br/>
                <label for="username">
                    <g:message code="users.username.label" default="Username"/>
                </label>
                <f:display name="username" bean="userRole" property="user.username"/>
                <br/>
                <br/>
                <label for="authority">
                    <g:message code="users.firstname.label" default="Role"/>
                </label>
                <f:display name="authority" bean="userRole" property="role.authority"/>
                <br/>
                <br/>
            </center>





            <g:form resource="${this.userRole}" method="DELETE">
                <fieldset class="buttons">
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
