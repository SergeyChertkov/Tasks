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



  #
  # -----------------------------------------------------------------------------------------------------------------
  #


  Scenario Outline: I validate cases for the Homepage on the Stats site SS-H-260, SS-H-270

    Given the "<browser for test>" browser is opened

    Given generate variables with values
      | NAME OF VARIABLES    | VALUE    |
      | summoner.name        | 54B0MB99 |
      | summoner.notFullName | 54B0MB9  |

  #SS-H-260
    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE            |
      | What we found    | ${summoner.name} |
      | Recent           | not present      |
    When I click on "What we found"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE            |
      | Summoner Name    | ${summoner.name} |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE            |
      | What we found    | ${summoner.name} |
      | Recent           | ${summoner.name} |
    When I click on "Recent"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE            |
      | Summoner Name    | ${summoner.name} |

  #SS-H-270 - BUG FOUND
    When I open the "Stats Moba page"
    When I input "${summoner.notFullName}" in "Input Search"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE            |
      | What we found    | ${summoner.name} |
    When I click on "What we found"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE            |
      | Summoner Name    | ${summoner.name} |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |


  #
  # -----------------------------------------------------------------------------------------------------------------
  #


  Scenario Outline: I validate cases elements on the Navbar:
  SS-N-120, SS-N-130, SS-N-140, SS-N-150, SS-N-160, SS-N-170
  SS-N-180, SS-N-190, SS-N-200, SS-N-210, SS-N-220

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES    | VALUE    |
      | summoner.name        | 54B0MB99 |
      | summoner.notFullName | 54B0MB9  |
    When I open the "Stats Moba page"

    #SS-N-120
    Then the following elements should be
      | NAME OF ELEMENTS          | VALUE          |
      | navbar homepage link      | displayed      |
      | navbar Download link      | DOWNLOAD       |
      | navbar ProvingGround link | PROVING GROUND |
      | navbar Blog link          | BLOG           |

      | navbar Profile link       | Profile        |
      | navbar GPI link           | GPI            |
      | navbar PreGame link       | Pre Game       |
      | navbar PostGame link      | Post Game      |

      | navbar search link        | displayed      |
      | navbar login button       | displayed      |

    #SS-N-130
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    Then the following elements should be
      | NAME OF ELEMENTS     | VALUE     |
      | navbar homepage link | displayed |
    When I click on "navbar homepage link"
    Then the page should be "Stats Moba page"

    #SS-N-140
    Given wait 5 sec
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | navbar Profile link | displayed |
    When I click on "navbar Profile link"
    Then wait 2 sec
    #TODO Need to require from developers to get id for iframe
    # Then I switch to frame "moba-auth"
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      #| sign-in popup email    | displayed |
      #| sign-in popup password | displayed |
      | sign-in popup title | displayed |
    Then I click on "sign-in close"

    #SS-N-150
    Given wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE     |
      | navbar GPI link  | displayed |
    When I click on "navbar GPI link"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | sign-in popup title | displayed |
    Then I click on "sign-in close"

    #SS-N-160
    Given wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | navbar PreGame link | displayed |
    When I click on "navbar PreGame link"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | sign-in popup title | displayed |
    Then I click on "sign-in close"

    #SS-N-170
    Given wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS     | VALUE     |
      | navbar PostGame link | displayed |
    When I click on "navbar PostGame link"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | sign-in popup title | displayed |
    Then I click on "sign-in close"

    #SS-N-180
    Given wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS   | VALUE     |
      | navbar search link | displayed |
    When I click on "navbar search link"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS                                  | VALUE     |
      | search popup message: What are you trying to find | displayed |
    Then I click on "sign-in close"

    #SS-N-190
    Given wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | navbar login button | displayed |
    When I click on "navbar login button"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | sign-in popup title | displayed |
    Then I click on "sign-in close"

    #SS-N-200
    Given wait 2 sec
    When I open the "Stats Moba page"
    Then the following elements should be
      | NAME OF ELEMENTS     | VALUE     |
      | navbar Download link | displayed |
    When I click on "navbar Download link"
    Then the page should be "Download page"

    #SS-N-210
    Given wait 2 sec
    When I open the "Stats Moba page"
    Then the following elements should be
      | NAME OF ELEMENTS          | VALUE     |
      | navbar ProvingGround link | displayed |
    When I click on "navbar ProvingGround link"
    Then the page should be "Proving Ground page"

    #SS-N-220
    Given wait 2 sec
    When I open the "Stats Moba page"
    Then the following elements should be
      | NAME OF ELEMENTS | VALUE     |
      | navbar Blog link | displayed |
    When I click on "navbar Blog link"
    Then the page should be "Blog page"

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |


  #
  # -----------------------------------------------------------------------------------------------------------------
  #


  @active
  Scenario Outline: I validate cases elements on the Summoner Profile Overview:
  SS-PO-110, SS-PO-120, SS-PO-240, SS-PO-320, SS-PO-410, SS-PO-460, SS-PO-500,
  SS-PO-620, SS-PO-650, SS-PO-720, SS-PO-730, SS-PO-790, SS-PO-820, SS-PO-860,
  SS-PO-930, SS-PO-980, SS-PO-1020, SS-PO-1040, SS-PO-1050, SS-PO-1070, SS-PO-1080, SS-PO-1110

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES | VALUE                                             |
      | summoner.name     | 54B0MB99                                          |
      | summoner.icon     | https://cdn.moba.live/static/profileicon/1590.png |

    #SS-PO-110
    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    Then the following elements should be
      | NAME OF ELEMENTS      | VALUE            |
      | profile summoner name | ${summoner.name} |
    Then the following tags for next elements should be
      | NAME OF ELEMENTS | TAGS NAMES | VALUE            |
      | profile icon     | src        | ${summoner.name} |


    #SS-PO-110

    #SS-PO-620, SS-PO-650 should be done by David

    Examples:
      | browser for test |
      | Chrome           |