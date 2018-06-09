# created by Klym
# 28.05.2018

@api
Feature: Stats site


  Scenario Outline: Testing the data on Stats side which corresponding from the RIOT static

    Given generate variable "summoner" with value "<summoner>"
    When I save values from the RIOT API
      | <name of user>     | riot_api_host_na1/lol/summoner/v3/summoners/by-name/${summoner} |
      | summoner.id        | #{id}                                                           |
      | summoner.name      | #{name}                                                         |
      | summoner.accountId | #{accountId}                                                    |

    When I save values from the RIOT API
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
    When I open the "Stats Moba page"
    When I input "${summoner}" in "Input Search"
    When I click on "Button Go"
    Then wait 10 sec
    Then I validate that count of element "All games block" equals "20"
    Then close browser

    Examples:
      | browser for test | summoner | name of user |
      | Chrome           | Geei     | test_user_1  |



  #
  # -----------------------------------------------------------------------------------------------------------------
  #


  @active
  Scenario Outline: I validate case SS-PO-240 from the test scenarios

    Given the "<browser for test>" browser is opened

    Given I gathering data about summoner with name "<summoner>" from platform "NA" as "<name of user>" user

    When I open the "Stats Moba page"
    When I input "<summoner>" in "Input Search"
    When I click on "Button Go"
    Then wait 10 sec
    Then the following elements should be
      | NAME OF ELEMENTS            | VALUE               |
      | TIER STATS: number of wins  | ${0.league.wins}W   |
      | TIER STATS: number of loses | ${0.league.losses}L |

    Then close browser

    Examples:
      | browser for test | summoner | name of user |
      | Chrome           | 54B0MB99 | test_user_1  |
      | Chrome           | Ssenkcys | test_user_1  |

