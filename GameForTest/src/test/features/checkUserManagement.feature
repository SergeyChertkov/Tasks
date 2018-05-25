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


  @positive_scenario
  Scenario Outline: As a user who have not been sign up, I should be able sign up into portal 2
    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When I click on "Link for registration"
    #TODO: Maybe, we should create Registration page as a separate class
    When I input "<user email>" in "User email registration"
    When I input "<user name>" in "Username registration"
    When I input "<user password>" in "User pass registration"
    When I input "<summoner name>" in "Summoner name registration"
    #TODO: When I select value "NA" from dropdown "User region registration"
    When I click on "SignUp button"
    When wait 10 sec
    Then the page should be "Welcome Page"
    Then close browser
    #<timestamp> - says us that this will be a current time instead
    Examples:
      | browser for test | user email                             | user name | user password | summoner name |
      | Chrome           | mobalyticshq_Klym_1234@mailinator.com  | Klym      | 123QWEasd     | geei          |
      | Firefox          | mobalyticshq_Julia_1234@mailinator.com | Julia     | 123QWEasd     | geei          |

  @active
  @positive_scenario
  Scenario Outline: As a user who has been sign uped, I should be able see email
    Given the "<browser for test>" browser is opened
    When I open the "Mailinator Page"
    When I input "<user email>" in "input for email"
    When I click on "go button"
    When wait 3 sec
    When I click on "link on inbox"
    And the following elements should be
      | NAME OF ELEMENTS           | VALUE     |
      | email - Email Confirmation | displayed |
    When I click on "email - Email Confirmation"

    When wait 20 sec
    Then the following elements should be
      | NAME OF ELEMENTS                | VALUE     |
      | email body: message             | displayed |
      | email body: verification button | displayed |
    #Welcome to Mobalytics! Thanks for registering an account with us. To get started, please verify your email. |
    #When execute javascript "javascript: document.getElementsByClassName('all_message-min_autor ng-binding')[1].click();"
    And wait 500 sec

    Then close browser

    Examples:
      | browser for test | user email             | user name | user password | summoner name |
      | Chrome           | mobalyticshq_Klym_1234 | Klym      | 123QWEasd     | geei          |

  Scenario: As user open login page. Then open login page in another tab again. Then log in on 1 page
  Validate that user can be logged in

  Scenario: As user Press "Forgot" link from Log in screen
  Validate that: the reset password screen displays

  Scenario: User can enter his email. press "Get new password" button
  Validate that: notification message displays:
  SUCCESS
  We've emailed you instructions for setting your password, if an account exists with the email you entered. You should receive them shortly.
  If you don't receive an email, please make sure you've entered the address you registered with, and check your spam folder.
  You can close this window"

  Scenario: As user verify that email received
  Validate that: an email received

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

  Scenario: user doesn't mark the cause and press "Delete account"
  Validate that: "blank page displays with text:
  Your Mobalytics Account is closed!
  Thank you for giving us a try.
  Go back to Mobalytics.gg"