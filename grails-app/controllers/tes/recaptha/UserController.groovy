package tes.recaptha

import groovyx.net.http.ContentType
import groovyx.net.http.HTTPBuilder
import groovyx.net.http.Method
import org.apache.commons.io.IOUtils

class UserController {

    def login = {
    }

    def doLogin = {
        def user = User.findWhere(email : params['email'], password : params['password'])
        session.user = user

        boolean result
        def remoteAddress = request.remoteAddr

        def body = [privatekey: "6Lde5P8SAAAAAOaViL3X6n5O5uvDKOm4qIQ39pCL",
                remoteip: remoteAddress,
                challenge: params.recaptcha_challenge_field,
                response: params.recaptcha_response_field]
        def http = new HTTPBuilder('https://www.google.com')
        http.request(Method.POST, ContentType.TEXT) {
            uri.path = '/recaptcha/api/verify'
            uri.query = body
            body = body

            response.success = { resp, value ->
                StringWriter writer = new StringWriter();
                IOUtils.copy(value, writer);
                result = Boolean.parseBoolean((writer?.toString()?.split("\n") as List)[0])
            }
        }

        if (result) {
            if (user) {
                redirect(controller:'plant',action:'list')
            }
            else {
                redirect(controller:'user',action:'login')
            }
        } else {
            flash.error = message(code: 'forgotPassword.captcha.wrong')
            redirect(controller:'user', action:'login')
        }
    }
}
