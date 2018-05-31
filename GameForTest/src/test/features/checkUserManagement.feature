# created by Klym
# 20.05.2018

@user_management
Feature: The user management
  Customer should be able to login, logout and manage my personal data

  @smoke
  @positive_scenario
  Scenario Outline: As user I should be able to login in portal with correct cred
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
  Scenario Outline: As a user who forgot his credentials, I should see a corresponding message
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
  Scenario Outline: As a user who input anything during login, I should see a corresponding error message
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
  Scenario Outline: As a user who have not been sign up, I should be able sign up into portal 2
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
  I should be able see email
  I should be able to make verification
  I should be able to delete my account from the portal
    #register the user
    Given the "<browser for test>" browser is opened
    When I register the user "<user email>"
    Then close browser
    #validate the email
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
    #delete the account
    When I click on "account settings link"
    Then wait 2 sec
    When I click on "Link Delete my account"
    When I input "This's an automated test" in "TextArea Leave comment"
    When I click on "Button Delete"
    When wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS                            | VALUE     |
      | Message: Your Mobalytics Account is closed! | displayed |
      | Message: Thank you for giving us a try      | displayed |
      | Message: Go back to Mobalytics.gg           | displayed |

    Then close browser
    Examples:
      | browser for test | user email            |
      | Chrome           | mobalyticshq_Klym_251 |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #

  Scenario Outline: As user open login page.
  Next open login page in another tab again. Then log out on 1 tab
  Validate that: user was logouted

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

  #@acitve
  @positive_scenario
  Scenario Outline: As user I should be able to use the "Forgot" link from Log in form
  Validate that: The reset password functionality is working
  I should be able see email with new password
  I should be able to change the password
  I should be able to SingIn into portal with new password
    #register the user
    Given the "<browser for test>" browser is opened
    When I register the user "<user email>"
    #logout -> open and use the Forgot password form
    When I click on "Link Skip tutorial"
    When I click on "logout link"
    Then wait 2 sec
    Then the page should be "Login page"
    Then I click on "Link for forgot-password"
    Then the page should be "Login page"
    When I input "<User email forgot password>" in "User email forgot password"
    When I click on "Button Get new password"
    Then close browser
    #validate the email on the message about changing password
    Given the "<browser for test>" browser is opened
    When I open the "Mailinator Page"
    When I login on mailinator as "<user email>"
    And I open mail by title "Forgot your Mobalytics password?"
    When I switch to frame "msg_body"
    Then the following elements should be
      | NAME OF ELEMENTS                  | VALUE                                                                                                                                     |
      | email body: message               | We heard you need a password reset. Click the link below and you'll be redirected to a secure site from which you can set a new password. |
      | email body: reset password button | displayed                                                                                                                                 |
    When I click on "email body: reset password button"
    When wait 5 sec
    When I switch to tab "1"
    Then the page should be "Login Page"

    Then close browser

    Examples:
      | browser for test | user email            | User email forgot password           |
      | Chrome           | mobalyticshq_Klym_254 | mobalyticshq_Klym_254@mailinator.com |

  #
  #------------------------------------------------------------------------------------------------
  #

  Scenario: User can enter his email. press "Get new password" button
  Validate that: notification message displays:
  SUCCESS
  We've emailed you instructions for setting your password, if an account exists with the email you entered. You should receive them shortly.
  If you don't receive an email, please make sure you've entered the address you registered with, and check your spam folder.
  You can close this window"


  Scenario: As user I enter correct value to both fields. Then press "Change password" button
  Validate that: a message is ""SUCCESS Password has been changed. Go to login page."""

  Scenario: As an user press "login" link from success message about change password
  Validate that: a sign in screen opens

  Scenario: As an user user logged in and open 2 or more tabs. user logged out in 1 tab.
  open another tab and try open another page of app there
  Validate that: user logged out from all tabs

  Scenario: As an user press "Delete your account" from user settings
  Validate that: "pop-up displays with ask user to mark the cause of deletion of account
  clarify texts"

