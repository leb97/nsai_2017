<%@ page import="java.security.Principal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <center>
        <a href="#create-score" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="create-score" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.score}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.score}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.score}" method="POST">
                <fieldset class="form">
                    <label for="score">
                    <g:message code="users.email.label" default="Score"/>
                    <span class="required-indicator">*</span>
                    </label>
                    <g:field type="number" name="score" min="1" max="5" required="true" value="${score?.score}"/>
<br/><br/>
                    <g:set var="currentUser"><sec:username/></g:set>
                    <label for="subject">
                        <g:message code="users.email.label" default="Subject"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="subject" name="subject" value="${score?.subject}"
                              optionValue="name"
                              optionKey="id"
                              from='${score.getSubjects("${currentUser}")}'>
                    </g:select>
<br/><br/>
                    <label for="student">
                        <g:message code="users.email.label" default="Student"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="student" name="user" value="${score?.user}"
                              optionValue="username"
                              optionKey="id"
                              from='${score.getStudents()}'>
                    </g:select>

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </center>
    </body>
</html>
