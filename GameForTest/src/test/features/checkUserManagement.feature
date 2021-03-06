# created by Klym
# 20.05.2018

@user_management
Feature: The user management
  Customer should be able to login, logout and manage my personal data

  @active
  Scenario Outline: As user I should be able to login in portal with correct cred (UM-SI-240)
    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS         | STATUS    |
      | Login header             | displayed |
      | User name input          | displayed |
      | Pass input               | displayed |
      | Button Login             | displayed |
      | Link for registration    | displayed |
      | Link for forgot-password | displayed |
    Then the following elements should be
      | NAME OF ELEMENTS         | VALUE          |
      | Login header             | SIGN IN        |
      | Button Login             | SIGN IN        |
      | Link for registration    | Create account |
      | Link for forgot-password | Forgot?        |
    When login as "<name of user>"
    Then the page should be "GPI Page"
    And element "character name" should be "Geei"
    Then close browser

    Examples:
      | browser for test | name of user |
      | Chrome           | test_user_1  |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #


  @negative_scenario
  Scenario Outline: As a user who forgot his credentials, I should see a corresponding message (UM-SI-150, UM-SI-180)
    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When I input "<user name>" in "User name input"
    When I input "<user password>" in "Pass input"
    When I click on "Button Login"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE                          |
      | Error message    | Provided credentials are wrong |
    Then close browser

    Examples:
      | browser for test | user name                   | user password      |
      | Chrome           | klym@mobalyticshq.com       | incorrect password |
      | Chrome           | klym121212@mobalyticshq.com | 123QWEqwe          |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #


  @negative_scenario
  Scenario Outline: As a user who input anything during login, I should see a corresponding error message (UM-SI-120, UM-SI-130)
    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When I input "<user name>" in "User name input"
    When I input "<user password>" in "Pass input"
    When I click on "Button Login"
    When I input "any_test_data" in "User name input"
    When I input "any_test_data" in "Pass input"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE                          |
      | <marked field>   | This field should not be empty |
    Then close browser

    Examples:
      | browser for test | user name                   | user password      | marked field                |
      | Chrome           |                             | incorrect password | Error message for User name |
      | Chrome           | klym121212@mobalyticshq.com |                    | Error message for Password  |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #

  @negative_scenario
  Scenario Outline: As a user who have not been sign up, I should be able sign up into portal
    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When I input "<user name>" in "User name input"
    When I input "<user password>" in "Pass input"
    When I click on "Button Login"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE                          |
      | Error message    | Provided credentials are wrong |
    Then close browser

    Examples:
      | browser for test | user name                   | user password      |
      | Chrome           | klym@mobalyticshq.com       | incorrect password |
      | Chrome           | klym121212@mobalyticshq.com | 123QWEqwe          |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #

  #@active
  @positive_scenario
  Scenario Outline: As a user who have not been sign up, I should be able sign up into portal (UM-SUE-340)
    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When I click on "Link for registration"
    When I input "<user email>" in "User email registration"
    When I input "<user name>" in "Username registration"
    When I input "<user password>" in "User pass registration"
    When I input "<summoner name>" in "Summoner name registration"
    When I click on "SignUp button"
    When wait 10 sec
    Then the page should be "Welcome Page"
    Then close browser
     #<timestamp> - says us that this will be a current time instead
    Examples:
      | browser for test | user email                              | user name | user password | summoner name |
      | Chrome           | mobalyticshq_Klym_112233@mailinator.com | Klym      | Password123   | geei          |
   #   | Firefox          | mobalyticshq_Julia_1234@mailinator.com | Julia     | Password123   | geei          |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #


  @positive_scenario
  Scenario Outline: As a user who has been sign uped,
  I should be able see email (UM-SUE-350)
  I should be able to make verification
  I should be able to delete my account from the portal (UM-DA-100, UM-DA-110, UM-DA-130, UM-DA-150, UM-DA-170)
    #register the user
    Given the "<browser for test>" browser is opened
    When I register the user "<user email>"
    Then close browser
    #validate the email (UM-SUE-350)
    Given the "<browser for test>" browser is opened
    When I open the "Mailinator Page"
    When I login on mailinator as "<user email>"
    And I open mail by title "Email Confirmation"
    When I switch to frame "msg_body"
    Then the following elements should be
      | NAME OF ELEMENTS                | VALUE                                                                                                       |
      | email body: message             | Welcome to Mobalytics! Thanks for registering an account with us. To get started, please verify your email. |
      | email body: verification button | displayed                                                                                                   |
    When I click on "email body: verification button"
    When wait 5 sec
    When I switch to tab "1"
    Then the page should be "Login Page"
    When login as new user "<user email>"
    Then the page should be "GPI Page"
    When I click on "Link Skip tutorial"
# UM-DA-170
    When I open new tab
    When I switch to tab "2"
    When I open the "GPI page"
    Then wait 2 sec
    When I switch to tab "1"


    #delete the account (UM-DA-100, UM-DA-110)
    When I click on "account settings link"
    Then wait 2 sec
    When I click on "Link Delete my account"
    When I input "<marks the cause>" in "TextArea Leave comment"
    When I click on "Button Delete"
    When wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS                            | VALUE     |
      | Message: Your Mobalytics Account is closed! | displayed |
      | Message: Thank you for giving us a try      | displayed |
      | Message: Go back to Mobalytics.gg           | displayed |

# UM-DA-170
    When I switch to tab "2"
    When I open the "GPI page"
    Then the page should be "Login page"

# UM-DA-150
    When generate variables with values
      | VARIABLE | VALUE                       |
      | email    | <user email>@mailinator.com |
    When I input "${email}" in "User name input"
    When I input "<user email>" in "Pass input"
    When I click on "Button Login"
    Then wait 5 sec
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE                          |
      | Error message    | Provided credentials are wrong |

    Then close browser
    Examples:
      | browser for test | user email            | marks the cause |
      | Chrome           | mobalyticshq_Klym_251 | This's an automated test |
# UM-DA-130
      | Chrome           | mobalyticshq_Klym_251 |                 |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #

  Scenario Outline: As user open login page.
  Next open login page in another tab again. Then log out on 1 tab
  Validate that: user was logouted (UM-SO-120)

    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When login as "<name of user>"

    #open second tab and open our Portal on it
    When I open new tab
    When I switch to tab "1"
    When I open the "Login page"
    Then wait 2 sec

    #Open first tab and logout from portal
    When I switch to tab "0"
    When I click on "logout link"
    Then wait 2 sec
    Then the page should be "Login page"

    #Open second tab and click on any element -> you should be redirected to Login Page
    When I switch to tab "1"
    Then wait 2 sec
    Then the page should be "GPI Page"
    When I click on "character name"
    Then wait 2 sec
    Then the page should be "Login page"

    Then close browser

    Examples:
      | browser for test | name of user |
      | Chrome           | test_user_1  |

  #
  #-----------------------------------------------------------------------------------------------------------
  #

  #@active
  @positive_scenario
  Scenario Outline: As user I should be able to use the "Forgot" link from Log in form
  Validate that: The reset password functionality is working (UM-RP-100, UM-RP-160)
  I should be able see email with new password (UM-RP-180, UM-RP-190)
  I should be able to change the password (UM-RP-210, UM-RP-220, UM-RP-360)
  I should be able to SingIn into portal with new password (UM-RP-370)

    #register the user
    Given the "<browser for test>" browser is opened
    When generate variable "registrationUser" with value "mobalytics_TIMESTAMP"
    When I register the user "${registrationUser}"
    #logout -> open and use the Forgot password form
    When I maximize the window size
    When I click on "Link Skip tutorial"
    When I click on "logout link"
    Then wait 2 sec
    Then the page should be "Login page"
    Then I click on "Link for forgot-password"
    Then the page should be "Login page"
    When I input "${registrationUser}@mailinator.com" in "User email forgot password"
    When I click on "Button Get new password"
    Then close browser

    #validate the email on the message about changing password
    Given the "<browser for test>" browser is opened
    When I open the "Mailinator Page"
    When I login on mailinator as "${registrationUser}"
    And I open mail by title "Forgot your Mobalytics password?"
    When I switch to frame "msg_body"
# UM-RP-180
    Then the following elements should be
      | NAME OF ELEMENTS                    | VALUE                                                                                                                                     |
      | change password email body: message | We heard you need a password reset. Click the link below and you'll be redirected to a secure site from which you can set a new password. |
      | email body: reset password button   | displayed                                                                                                                                 |
# UM-RP-190
    When I click on "email body: reset password button"
    When wait 5 sec

    #change and confirm changing password
    When I switch to tab "1"
    Then the page should be "Login Page"
# UM-RP-210
    When I input "<new password>" in "Input New password"
# UM-RP-220
    When I input "<new password>" in "Input Repeat password"
    When I click on "Button Change password"
# UM-RP-360
    Then the following elements should be
      | NAME OF ELEMENTS                  | VALUE   |
      | Message Success changing password | SUCCESS |

# UM-RP-370
    #try to login with password
    When I open the "Login page"
    When I input "${registrationUser}@mailinator.com" in "User name input"
    When I input "<new password>" in "Pass input"
    When I click on "Button Login"
    Then wait 5 sec
    When I maximize the window size
    Then the page should be "GPI Page"
    And element "character name" should be "Geei"

    #delet current user
    Then I delete user who have been sign in

    Then close browser

    Examples:
      | browser for test | new password |
      | Chrome           | newPassword  |

  #
  #------------------------------------------------------------------------------------------------
  #

  #@active
  @positive_scenario
  Scenario Outline: User can change his password in his profile page
  Validate that: notification message is displayed
  User is able to SignIn with new password

    #register the user
    Given the "<browser for test>" browser is opened
    When I register the user "<user email>"
    When I maximize the window size

    #change the password in My account settings
    When I click on "Link Skip tutorial"
    When I click on "account settings link"
    When wait 2 sec
    Then the page should be "Account settings page"
    When I input "<user email>" in "Input Old password"
    When I input "<new password>" in "Input New password"
    When I input "<new password>" in "Input Repeat password"
    When I click on "Button change password"
    When I click on "logout link"

    #try to login with password
    When I open the "Login page"
    When I input "<User email forgot password>" in "User name input"
    When I input "<new password>" in "Pass input"
    When I click on "Button Login"
    Then wait 5 sec
    When I maximize the window size
    Then the page should be "GPI Page"
    And element "character name" should be "Geei"

    #delete current user
    Then I delete user who have been sign in

    Then close browser

    Examples:
      | browser for test | user email            | User email forgot password           | new password |
      | Chrome           | mobalyticshq_Klym_278 | mobalyticshq_Klym_278@mailinator.com | newPassword  |

  #
  #-----------------------------------------------------------------------------------------------------
  #


  @klym
  @positive_scenario
  Scenario Outline: User can open log in in one tab and I should be log in in another one that was opened before UM-SI-280

    Given the "<browser for test>" browser is opened
    When I open the "Login page"

    #open second tab and open our Portal on it
    When I open new tab
    When I switch to tab "1"
    When I open the "Login page"
    Then wait 2 sec

    #Open first tab and login in portal
    When I switch to tab "0"
    When login as "<name of user>"
    Then wait 10 sec
    Then the page should be "GPI page"

    #Open second tab and validate that user is login as well
    When I open new tab
    When I switch to tab "1"
    When I open the "GPI page"
    Then wait 2 sec

    Then close browser

    Examples:
      | browser for test | name of user |
      | Chrome           | test_user_1  |

  #
  #-----------------------------------------------------------------------------------------------------
  #




