<%--
  Created by IntelliJ IDEA.
  User: umerazizmalik
  Date: 1/1/15
  Time: 2:03 PM
--%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>User Login</title>

    <r:script disposition="head">
        var RecaptchaOptions = {
            theme:'white'
        };

        $(document).ready(function () {
            $('#reset_password input[name="username"]').focus();

            $(document).keypress(function (e) {
                if (e.which == 13) {

                    $(this).blur();
                    $('#reset_password form').submit();
                }
            });
        });
    </r:script>

    <style type="text/css">
        #recaptcha_widget_div label {
            float: none;
        }

        #recaptcha_widget_div a img {
            top: 0px;
            left: 0px;
        }

        #recaptcha_widget_div span {
            font-weight: normal;
        }

        #recaptcha_widget_div {
            margin-left: 85px;
            margin-top: 12px;
        }
    </style>

</head>

<body>
<div class="body">
    <g:form action="doLogin" method="post">
        <div class="dialog">
            <p>Enter your login details below:</p>
            <table class="userForm">
                <tr class='prop'>
                    <td valign='top' style='text-align:left;' width='20%'>
                        <label for='email'>Email:</label>
                    </td>
                    <td valign='top' style='text-align:left;' width='80%'>
                        <input id="email" type='text' name='email' value='${user?.email}' /> </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' style='text-align:left;' width='20%'>
                        <label for='password'>Password:</label>
                    </td>
                    <td valign='top' style='text-align:left;' width='80%'>
                        <input id="password" type='password' name='password'
                               value='${user?.password}' />
                    </td>
                </tr>

                <tr>
                    <script type="text/javascript"
                            src="https://www.google.com/recaptcha/api/challenge?k=6Lde5P8SAAAAAKBtg9KtJjLJqXBCnwfwdYSwOvNN">
                    </script>
                    <noscript>
                        <iframe src="https://www.google.com/recaptcha/api/noscript?k=6Lde5P8SAAAAAKBtg9KtJjLJqXBCnwfwdYSwOvNN"
                                height="300" width="500" frameborder="0"></iframe><br>
                        <textarea name="recaptcha_challenge_field" rows="3" cols="40">
                        </textarea>
                        <input type="hidden" name="recaptcha_response_field"
                               value="manual_challenge">
                    </noscript>
                </tr>

            </table>
        </div>
        <div class="buttons">
            <span class="formButton">
                <input type="submit" value="Login"></input>
            </span>
        </div>
    </g:form>
</div>
</body>
</html>