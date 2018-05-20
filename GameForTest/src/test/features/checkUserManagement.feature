# created by Klym
# 20.05.2018

@user_management

Feature: User management

  @smoke
  @positive_scenario

  Scenario Outline: As user I should be able to login in portal with correct creds

    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    Then the url of current page is "https://app.mobalytics.gg/login"
    Then the following elements should be
      | NAME OF ELEMENTS         | STATUS    |
      | Login header             | displayed |
      | Email input              | displayed |
      | Password input           | displayed |
      | Button Login             | displayed |
      | Link for registration    | displayed |
      | Link for forgot-password | displayed |
    Then the following attributes of elemetns should be
      | NAME IF ELEMENTS | NAME OF ATTRIBUTES | VALUE            |
      | Email input      | placeholder        | Enter your email |
      | Password input   | placeholder        | Password         |
    Then the following elements should be
      | NAME OF ELEMENTS         | VALUE                     |
      | Login header             | Log in                    |
      | Button Login             | Log In                    |
      | Link for registration    | Sign Up for FREE account! |
      | Link for forgot-password | Forgot?                   |
    When login as "<name of user>"
    Then the page should be "Home Page"
    Then close browser

    Examples:
      | browser for test | name of user |
      | Chrome           | test_user_1  |

  Scenario Outline: As user I should not be able to login in portal with a wrong password

    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    Then the url of current page is "https://app.mobalytics.gg/login"
    Then the following elements should be
      | NAME OF ELEMENTS         | STATUS    |
      | Login header             | displayed |
      | Email input              | displayed |
      | Password input           | displayed |
      | Button Login             | displayed |
      | Link for registration    | displayed |
      | Link for forgot-password | displayed |
    Then the following attributes of elemetns should be
      | NAME IF ELEMENTS | NAME OF ATTRIBUTES | VALUE            |
      | Email input      | placeholder        | Enter your email |
      | Password input   | placeholder        | Password         |
    Then the following elements should be
      | NAME OF ELEMENTS         | VALUE                     |
      | Login header             | Log in                    |
      | Button Login             | Log In                    |
      | Link for registration    | Sign Up for FREE account! |
      | Link for forgot-password | Forgot?                   |
    When I input "<wrong password>" in "Password input"
    When I input "<correct email>" in "Email input"
    Then the following elements should contains
      | NAME OF ELEMENTS | VALUE                      |
      | Error message    | "<value of error message>" |
    Then the page should be "Login Page"
    Then close browser

    Examples:
      | browser for test | wrong password | correct email         | value of error message |
      | Chrome           | 1              | klym@mobalystichq.com | Short password         |
      | Chrome           | 1223123        | klym@mobalystichq.com | Wrong credentials      |