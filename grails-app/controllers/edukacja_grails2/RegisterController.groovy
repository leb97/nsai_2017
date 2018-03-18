package edukacja_grails2

import com.megatome.grails.RecaptchaService
import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.plugin.springsecurity.ui.*

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {
    RecaptchaService recaptchaService

    def register(RegisterCommand registerCommand) {
        def recaptchaOK = false
        if (!request.post) {
            return [registerCommand: new RegisterCommand()]
        }

        if (registerCommand.hasErrors()) {
            return [registerCommand: registerCommand]
        }

        if(recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
            recaptchaOK = true

            def user = uiRegistrationCodeStrategy.createUser(registerCommand)
            String salt = saltSource instanceof NullSaltSource ? null : registerCommand.username
            RegistrationCode registrationCode = uiRegistrationCodeStrategy.register(user, registerCommand.password, salt)

            if (registrationCode == null || registrationCode.hasErrors()) {
                // null means problem creating the user
                flash.error = message(code: 'spring.security.ui.register.miscError')
                return [registerCommand: registerCommand]
            }
            sendVerifyRegistrationMail registrationCode, user, registerCommand.email
        }
        else{
            return [registerCommand: registerCommand]
        }
        [emailSent: true, recaptchaOK:  recaptchaOK, registerCommand: registerCommand]
    }
}

