<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-score" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-score" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <center>
                <br/>
                <label for="name">
                    <g:message code="users.username.label" default="Name"/>
                </label>
                <f:display name="name" bean="score" property="score"/>
                <br/>
                <br/>
                <label for="student">
                    <g:message code="users.firstname.label" default="Student"/>
                </label>
                <f:display name="student" bean="score" property="user.username"/>
                <br/>
            </center>

            <g:form resource="${this.score}" method="DELETE">
                <fieldset class="buttons">
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
