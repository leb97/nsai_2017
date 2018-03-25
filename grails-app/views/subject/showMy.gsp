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
                    <g:message code="users.username.label" default="Name"/>
                </label>
                <f:display name="name" bean="subject" property="name"/>
                <br/>
                <br/>
                <label for="owner">
                    <g:message code="users.firstname.label" default="Owner"/>
                </label>
                <f:display name="owner" bean="subject" property="user.username"/>
                <br/>
            </center>

            <g:form resource="${this.subject}" method="DELETE">
                <fieldset class="buttons">
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
