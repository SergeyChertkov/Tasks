# created by Klym
# 28.05.2018

@api
Feature: The data from API should be displayed in appropriate way



  Scenario Outline: As user I should see the data which corresponding from the RAIN static

    When I save values from the RAIN API
      | <name of user>   | riot_api_host_na1/lol/league/v3/positions/by-summoner/20120070 |
      | number of wins   | {wins}                                                         |
      | number of losses | {losses}                                                       |



    #Given the "<browser for test>" browser is opened
    #When I open the "Login page"
    #When login as "<name of user>"
    #Then the page should be "GPI Page"
    #And element "character name" should be "Geei"
    #Then close browser

    Examples:
      | browser for test | name of user |
      | Chrome           | test_user_1  |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #
