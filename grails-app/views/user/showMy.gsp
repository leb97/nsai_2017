<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="my.profile"/></title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="my.profile"/></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <center>
                <br/>
                <label for="username">
                    <g:message code="users.username.label" default="Username"/>
                </label>
                <f:display name="username" bean="user" property="username"/>
                <br/>
                <br/>
                <label for="firstName">
                    <g:message code="users.firstname.label" default="First Name"/>
                </label>
                <f:display name="firstName" bean="user" property="firstName" label="username"/>
                <br/>
                <br/>
                <label for="lastName">
                    <g:message code="users.lastname.label" default="Last Name"/>
                </label>
                <f:display name="lastName" bean="user" property="lastName" label="username"/>
                <br/>
                <br/>
                <label for="email">
                    <g:message code="users.email.label" default="Email"/>
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
