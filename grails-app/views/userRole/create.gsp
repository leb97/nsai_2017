<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="create-userRole" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.userRole}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.userRole}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.userRole}" method="POST">
                <fieldset class="form">
                    <label for="role">
                        <g:message code="users.email.label" default="Role"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="role" name="role" value="${userRole?.role}"
                              optionValue="authority"
                              optionKey="id"
                              from='${userRole.getMyRoles()}'>
                    </g:select>
                    <br/><br/>
                    <label for="user">
                        <g:message code="users.email.label" default="User"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="user" name="user" value="${userRole?.user}"
                              optionValue="username"
                              optionKey="id"
                              from='${userRole.getMyUsers()}'>
                    </g:select>
                    <br/><br/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
