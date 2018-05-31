# created by Klym
# 28.05.2018

@api
Feature: The data from API should be displayed in appropriate way


  Scenario Outline: As user I should see the data which corresponding from the RAIT static

    #When I run JS file "LOL.js" and save response into "response.json"


    When I save values from the RAIT API
      | <name of user>     | riot_api_host_na1/lol/summoner/v3/summoners/by-name/Geei |
      | summoner.id        | #{id}                                                    |
      | summoner.name      | #{name}                                                  |
      | summoner.accountId | #{accountId}                                             |

    When I save values from the RAIT API
      | <name of user>          | riot_api_host_na1/lol/league/v3/positions/by-summoner/${summoner.id} |
      | league.leagueId         | #{[0].leagueId}                                                      |
      | league.leagueName       | #{[0].leagueName}                                                    |
      | league.tier             | #{[0].tier}                                                          |
      | league.queueType        | #{[0].queueType}                                                     |
      | league.rank             | #{[0].rank}                                                          |
      | league.playerOrTeamId   | #{[0].playerOrTeamId}                                                |
      | league.playerOrTeamName | #{[0].playerOrTeamName}                                              |
      | league.leaguePoints     | #{[0].leaguePoints}                                                  |
      | league.wins             | #{[0].wins}                                                          |
      | league.losses           | #{[0].losses}                                                        |
      | league.veteran          | #{[0].veteran}                                                       |
      | league.inactive         | #{[0].inactive}                                                      |
      | league.freshBlood       | #{[0].freshBlood}                                                    |
      | league.hotStreak        | #{[0].hotStreak}                                                     |

    Given the "<browser for test>" browser is opened
    When I open the "Login page"
    When wait 2 sec
    When login as "<name of user>"
    Then the page should be "GPI Page"

    And the following elements should be
      | NAME OF ELEMENTS | VALUE                      |
      | character name   | ${league.playerOrTeamName} |
      | number of wins   | ${league.wins}W            |

    Then close browser

    Examples:
      | browser for test | name of user |
      | Chrome           | test_user_1  |

  #
  # -----------------------------------------------------------------------------------------------------------------
  #
