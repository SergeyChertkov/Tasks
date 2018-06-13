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
      | NAME OF VARIABLES                | VALUE                                             |
      | summoner.name                    | 54B0MB99                                          |
      | summoner.icon                    | https://cdn.moba.live/static/profileicon/1590.png |
      | summoner.tier.is_chart_displayed | displayed                                         |
      | summoner.tier.is_ranker_banner   | not displayed                                     |

    #SS-PO-110
    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    Then the following elements should be
      | NAME OF ELEMENTS      | VALUE            |
      | profile summoner name | ${summoner.name} |
    When I click on "profile button refresh"
    When wait 5 sec
    Then the following elements should be
      | NAME OF ELEMENTS          | VALUE                      |
      | profile message data load | Updated: a few seconds ago |

    #SS-PO-120
    Then the following tags for next elements should be
      | NAME OF ELEMENTS | TAGS NAMES | VALUE            |
      | profile icon     | src        | ${summoner.icon} |

    #SS-PO-240
    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE     |
      | gpi radar           | displayed |
      | gpi link Learn more | displayed |
      | gpi role            | mid       |

    #SS-PO-320
    Then the following elements should be
      | NAME OF ELEMENTS          | VALUE                               |
      | tier chart                | ${summoner.tier.is_chart_displayed} |
      | tier rank progress banner | ${summoner.tier.is_ranker_banner}   |





    #SS-PO-620, SS-PO-650 should be done by David

    Examples:
      | browser for test |
      | Chrome           |

  @active
  Scenario Outline: I validate cases elements on the Summoner Profile Overview2:
  SS-PO-1110

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES | VALUE    |
      | summoner.name     | 54B0MB99 |

#SS-PO-1110
    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec
    Then the following elements should be
      | NAME OF ELEMENTS             | VALUE     |
      | champions table[1]           | displayed |
      | champions table[1] win lost  | 4/7/3     |
      | champions table[1] KDA       | 1.00      |
      | champions table[1] CS        | 95 CS     |
      | champions table[1] KP        | 20% KP    |

      | champions table[2]           | displayed |
      | champions table[2] win lost  | 1/4/13    |
      | champions table[2] KDA       | 3.50      |
      | champions table[2] CS        | 33 CS     |
      | champions table[2] KP        | 5% KP     |

      | champions table[3]           | displayed |
      | champions table[3] win lost  | 4/7/1     |
      | champions table[3] KDA       | 0.71      |
      | champions table[3] CS        | 300 CS    |
      | champions table[3] KP        | 50% KP    |

      | champions table[4]           | displayed |
      | champions table[4] win lost  | 19/3/2    |
      | champions table[4] KDA       | 7.00      |
      | champions table[4] CS        | 259 CS    |
      | champions table[4] KP        | 58% KP    |

      | champions table[5]           | displayed |
      | champions table[5] win lost  | 15/2/11   |
      | champions table[5] KDA       | 13.00     |
      | champions table[5] CS        | 202 CS    |
      | champions table[5] KP        | 48% KP    |

      | champions table[6]           | displayed |
      | champions table[6] win lost  | 10/0/8    |
      | champions table[6] KDA       | PERFECT   |
      | champions table[6] CS        | 250 CS    |
      | champions table[6] KP        | 40% KP    |

      | champions table[7]           | displayed |
      | champions table[7] win lost  | 14/2/8    |
      | champions table[7] KDA       | 11.00     |
      | champions table[7] CS        | 267 CS    |
      | champions table[7] KP        | 45% KP    |

      | champions table[8]           | displayed |
      | champions table[8] win lost  | 11/4/9    |
      | champions table[8] KDA       | 5.00      |
      | champions table[8] CS        | 188 CS    |
      | champions table[8] KP        | 34% KP    |

      | champions table[9]           | displayed |
      | champions table[9] win lost  | 14/4/13   |
      | champions table[9] KDA       | 6.75      |
      | champions table[9] CS        | 197 CS    |
      | champions table[9] KP        | 30% KP    |

      | champions table[10]          | displayed |
      | champions table[10] win lost | 7/1/6     |
      | champions table[10] KDA      | 13.00     |
      | champions table[10] CS       | 187 CS    |
      | champions table[10] KP       | 33% KP    |

      | champions table[11]          | displayed |
      | champions table[11] win lost | 4/3/2     |
      | champions table[11] KDA      | 2.00      |
      | champions table[11] CS       | 123 CS    |
      | champions table[11] KP       | 24% KP    |

      | champions table[12]          | displayed |
      | champions table[12] win lost | 4/5/27    |
      | champions table[12] KDA      | 6.20      |
      | champions table[12] CS       | 33 CS     |
      | champions table[12] KP       | 10% KP    |

      | champions table[13]          | displayed |
      | champions table[13] win lost | 2/5/5     |
      | champions table[13] KDA      | 1.40      |
      | champions table[13] CS       | 48 CS     |
      | champions table[13] KP       | 14% KP    |

      | champions table[14]          | displayed |
      | champions table[14] win lost | 4/8/10    |
      | champions table[14] KDA      | 1.75      |
      | champions table[14] CS       | 231 CS    |
      | champions table[14] KP       | 13% KP    |

      | champions table[15]          | displayed |
      | champions table[15] win lost | 5/2/6     |
      | champions table[15] KDA      | 5.50      |
      | champions table[15] CS       | 163 CS    |
      | champions table[15] KP       | 19% KP    |

      | champions table[16]          | displayed |
      | champions table[16] win lost | 14/6/5    |
      | champions table[16] KDA      | 3.17      |
      | champions table[16] CS       | 267 CS    |
      | champions table[16] KP       | 45% KP    |

      | champions table[17]          | displayed |
      | champions table[17] win lost | 8/1/19    |
      | champions table[17] KDA      | 27.00     |
      | champions table[17] CS       | 33 CS     |
      | champions table[17] KP       | 23% KP    |

      | champions table[18]          | displayed |
      | champions table[18] win lost | 3/0/5     |
      | champions table[18] KDA      | PERFECT   |
      | champions table[18] CS       | 113 CS    |
      | champions table[18] KP       | 23% KP    |

      | champions table[19]          | displayed |
      | champions table[19] win lost | 11/1/9    |
      | champions table[19] KDA      | 20.00     |
      | champions table[19] CS       | 254 CS    |
      | champions table[19] KP       | 28% KP    |

      | champions table[20]          | displayed |
      | champions table[20] win lost | 2/9/14    |
      | champions table[20] KDA      | 1.78      |
      | champions table[20] CS       | 109 CS    |
      | champions table[20] KP       | 9% KP     |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |