<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-subject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="create-subject" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.subject}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.subject}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <g:form resource="${this.subject}" method="POST">
                <fieldset class="form">
                    %{--<f:all bean="subject" />--}%
                    <f:field bean="subject" property="name"/>
                    <center>

                    <label for="user">
                        <g:message code="users.email.label" default="Teacher"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:set var="currentUser"><sec:username/></g:set>
                    <g:select id="user" name="user" value="${subject?.user}"
                              optionValue="username"
                              optionKey="id"
                              from='${subject.getMyTeachers("${currentUser}")}'></g:select>
                              %{--from='${subject.getTeachers()}'></g:select>--}%
                    </center>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>

        </div>
    </body>
</html>
