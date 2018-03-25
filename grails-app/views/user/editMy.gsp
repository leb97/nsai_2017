<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            %{--<g:form resource="${this.user}" controller="user" action="updateMy" method="PUT">--}%
                <g:form resource="${this.user}" method="PUT">

                    <g:hiddenField name="version" value="${this.user?.version}" />
                <fieldset class="form">
                    %{--<f:all bean="user"/>--}%
                    <f:field bean="user" property="username"/>
                    <f:field bean="user" property="firstName"/>
                    <f:field bean="user" property="lastName"/>
                    <f:field bean="user" property="email"/>
                    <f:field bean="user" property="password"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'UpdateMy')}"  />
                    %{--<g:submitButton name="saveMy" value="${message(code: 'default.button.update.label', default: 'UpdateMy')}"/>--}%
                    %{--<g:link class="save" action="updateMy" params="${this.user}" resource="${this.user}"><g:message code="default.button.update.label" default="Save" /></g:link>--}%
                </fieldset>
            </g:form>
        </div>
    </body>
</html>