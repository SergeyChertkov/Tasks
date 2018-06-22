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
      | gpi role            | MID       |

    #SS-PO-320
    Then the following elements should be
      | NAME OF ELEMENTS          | VALUE                               |
      | tier chart                | ${summoner.tier.is_chart_displayed} |
      | tier rank progress banner | ${summoner.tier.is_ranker_banner}   |





    #SS-PO-620, SS-PO-650 should be done by David
    Then close browser

    Examples:
      | browser for test |
      | Chrome           |


  @active
  Scenario Outline: I validate cases elements on the Summoner Profile Overview: SS-PO-980

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES | VALUE    |
      | summoner.name     | 54B0MB99 |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    When I click on "queue dropdown menu"
    Then the following elements should be
      | NAME OF ELEMENTS                 | VALUE        |

#SS-PO-980
      | queue button[1]                  | ALL GAMES    |
      | queue button[2]                  | RANKED SOLO  |
      | queue button[3]                  | RANKED FLEX  |
      | queue button[4]                  | CLASH        |
      | queue dropdown menu              | QUEUE TYPE   |
      | queue button[1] in dropdown menu | RANKED 3V3   |
      | queue button[2] in dropdown menu | NORMAL BLIND |
      | queue button[3] in dropdown menu | NORMAL DRAFT |
      | queue button[4] in dropdown menu | ARAM         |
      | queue button[5] in dropdown menu | BOT          |
      | queue button[6] in dropdown menu | OTHER        |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |

  @active
  Scenario Outline: SS-PO-930

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES      | VALUE           |
      | summoner.name          | 54B0MB99        |

      | mostPlayed[1].name     | Prohibit        |
      | mostPlayed[1].win      | 7               |
      | mostPlayed[1].lost     | 11              |
      | mostPlayed[1].winRate  | 38%             |

      | mostPlayed[2].name     | BuNNy4u         |
      | mostPlayed[2].win      | 13              |
      | mostPlayed[2].lost     | 2               |
      | mostPlayed[2].winRate  | 86%             |

      | mostPlayed[3].name     | 54H0RNY99       |
      | mostPlayed[3].win      | 7               |
      | mostPlayed[3].lost     | 2               |
      | mostPlayed[3].winRate  | 77%             |

      | mostPlayed[4].name     | XsQ             |
      | mostPlayed[4].win      | 6               |
      | mostPlayed[4].lost     | 0               |
      | mostPlayed[4].winRate  | 100%            |

      | mostPlayed[5].name     | Little Potatoes |
      | mostPlayed[5].win      | 3               |
      | mostPlayed[5].lost     | 2               |
      | mostPlayed[5].winRate  | 60%             |

      | mostPlayed[6].name     | Detain          |
      | mostPlayed[6].win      | 3               |
      | mostPlayed[6].lost     | 2               |
      | mostPlayed[6].winRate  | 60%             |

      | mostPlayed[7].name     | Munnyfish       |
      | mostPlayed[7].win      | 3               |
      | mostPlayed[7].lost     | 1               |
      | mostPlayed[7].winRate  | 75%             |

      | mostPlayed[8].name     | Lockdown        |
      | mostPlayed[8].win      | 1               |
      | mostPlayed[8].lost     | 3               |
      | mostPlayed[8].winRate  | 25%             |

      | mostPlayed[9].name     | Pharmercy69     |
      | mostPlayed[9].win      | 4               |
      | mostPlayed[9].lost     | 0               |
      | mostPlayed[9].winRate  | 100%            |

      | mostPlayed[10].name    | AliceeInHell    |
      | mostPlayed[10].win     | 3               |
      | mostPlayed[10].lost    | 0               |
      | mostPlayed[10].winRate | 100%            |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS           | VALUE                                      |
      | most played[1] name        | ${mostPlayed[1].name}                      |
      | most played[1] win to lost | ${mostPlayed[1].win}/${mostPlayed[1].lost} |
      | most played[1] win rate    | ${mostPlayed[1].winRate}                   |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |


  @active
  Scenario Outline: SS-PO-850

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES | VALUE              |
      | summoner.name     | 54B0MB99           |

      | recentRecords[1]  | Longest Win Streak |
      | recentRecords[2]  | Most Assists       |
      | recentRecords[3]  | Best KDA           |
      | recentRecords[4]  | Best KDA           |
      | recentRecords[5]  | Most Deaths        |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS       | VALUE               |
      | recent records[1] name | ${recentRecords[1]} |
      | recent records[2] name | ${recentRecords[2]} |
      | recent records[3] name | ${recentRecords[3]} |
      | recent records[4] name | ${recentRecords[4]} |
      | recent records[5] name | ${recentRecords[5]} |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |

  @active
  Scenario Outline: SS-PO-720, SS-PO-730

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES       | VALUE        |
      | summoner.name           | 54B0MB99     |

      | statChampion[1].name    | Evelynn      |
      | statChampion[1].games   | 5            |
      | statChampion[1].winRate | 40%          |
      | statChampion[1].KDA     | 3.52         |

      | statChampion[2].name    | Kayn         |
      | statChampion[2].games   | 4            |
      | statChampion[2].winRate | 50%          |
      | statChampion[2].KDA     | 3.22         |

      | statChampion[3].name    | Twisted Fate |
      | statChampion[3].games   | 4            |
      | statChampion[3].winRate | 50%          |
      | statChampion[3].KDA     | 3.57         |

      | statChampion[4].name    | Kassadin     |
      | statChampion[4].games   | 4            |
      | statChampion[4].winRate | 25%          |
      | statChampion[4].KDA     | 2.63         |

      | statChampion[5].name    | Vladimir     |
      | statChampion[5].games   | 3            |
      | statChampion[5].winRate | 66%          |
      | statChampion[5].KDA     | 7.12         |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS          | VALUE                      |
      | champion stat[1] Name     | ${statChampion[1].name}    |
      | champion stat[1] Games    | ${statChampion[1].games}   |
      | champion stat[1] Win Rate | ${statChampion[1].winRate} |
      | champion stat[1] KDA      | ${statChampion[1].KDA}     |

      | champion stat[2] Name     | ${statChampion[2].name}    |
      | champion stat[2] Games    | ${statChampion[2].games}   |
      | champion stat[2] Win Rate | ${statChampion[2].winRate} |
      | champion stat[2] KDA      | ${statChampion[2].KDA}     |

      | champion stat[3] Name     | ${statChampion[3].name}    |
      | champion stat[3] Games    | ${statChampion[3].games}   |
      | champion stat[3] Win Rate | ${statChampion[3].winRate} |
      | champion stat[3] KDA      | ${statChampion[3].KDA}     |

      | champion stat[4] Name     | ${statChampion[4].name}    |
      | champion stat[4] Games    | ${statChampion[4].games}   |
      | champion stat[4] Win Rate | ${statChampion[4].winRate} |
      | champion stat[4] KDA      | ${statChampion[4].KDA}     |

      | champion stat[5] Name     | ${statChampion[5].name}    |
      | champion stat[5] Games    | ${statChampion[5].games}   |
      | champion stat[5] Win Rate | ${statChampion[5].winRate} |
      | champion stat[5] KDA      | ${statChampion[5].KDA}     |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |


  @active
  Scenario Outline: SS-PO-1020

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES  | VALUE           |
      | summoner.name      | 54B0MB99        |

      | overall.wins       | 12              |
      | overall.lost       | 8               |
      | overall.winsToLost | 60              |
      | overall.KDA        | 4               |
      | overall.KDAKP      | 7.8 / 3.7 / 8.8 |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS    | VALUE                    |
      | overall wins        | ${overall.wins}W         |
      | overall lost        | ${overall.lost}L         |
      | overall win to lost | (${overall.winsToLost}%) |
      | overall KDA         | ${overall.KDA} KDA       |
      | overall KDA KP      | ${overall.KDAKP}         |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |

  @active
  Scenario Outline: SS-PO-1040, SS-PO-1050

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES        | VALUE    |
      | summoner.name            | 54B0MB99 |

      | firstCampion.wins        | 1        |
      | firstCampion.lost        | 2        |
      | firstCampion.winsToLost  | 33       |
      | firstCampion.KDA         | 2.88     |
      | firstCampion.KP          | 44%      |

      | secondCampion.wins       | 1        |
      | secondCampion.lost       | 1        |
      | secondCampion.winsToLost | 50       |
      | secondCampion.KDA        | 3.8      |
      | secondCampion.KP         | 69%      |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS               | VALUE                                             |
      | recent top role[1] wins        | ${firstCampion.wins}W                             |
      | recent top role[1] lost        | ${firstCampion.lost}L                             |
      | recent top role[1] win to lost | (${firstCampion.winsToLost}%)                     |
      | recent top role[1] KDA KP      | ${firstCampion.KDA} KDA / ${firstCampion.KP} KP   |

      | recent top role[2] wins        | ${secondCampion.wins}W                            |
      | recent top role[2] lost        | ${secondCampion.lost}L                            |
      | recent top role[2] win to lost | (${secondCampion.winsToLost}%)                    |
      | recent top role[2] KDA KP      | ${secondCampion.KDA} KDA / ${secondCampion.KP} KP |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |


  @active
  Scenario Outline: SS-PO-1070, SS-PO-1080

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES  | VALUE    |
      | summoner.name      | 54B0MB99 |

      | topRole.wins       | 3        |
      | topRole.lost       | 5        |
      | topRole.winsToLost | 37       |
      | topRole.KDA        | 2.61     |
      | topRole.KP         | 52%      |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS               | VALUE                                 |
      | recent top role[3] wins        | ${topRole.wins}W                      |
      | recent top role[3] lost        | ${topRole.lost}L                      |
      | recent top role[3] win to lost | (${topRole.winsToLost}%)              |
      | recent top role[3] KDA KP      | ${topRole.KDA} KDA / ${topRole.KP} KP |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |

  @active
  Scenario Outline: SS-PO-1110

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES       | VALUE           |
      | summoner.name           | 54B0MB99        |

      | champions[1].queueType  | RANKED SOLO/DUO |
      | champions[1].role       | JUNGLE          |
      | champions[1].winLost    | 4/7/3           |
      | champions[1].KDA        | 1               |
      | champions[1].CS         | 95              |
      | champions[1].KP         | 34              |

      | champions[2].queueType  | RANKED SOLO/DUO |
      | champions[2].role       | SUPPORT         |
      | champions[2].winLost    | 1/4/13          |
      | champions[2].KDA        | 3.5             |
      | champions[2].CS         | 33              |
      | champions[2].KP         | 63              |

      | champions[3].queueType  | CLASH           |
      | champions[3].role       | MID             |
      | champions[3].winLost    | 4/7/1           |
      | champions[3].KDA        | 0.71            |
      | champions[3].CS         | 300             |
      | champions[3].KP         | 62              |

      | champions[4].queueType  | RANKED FLEX     |
      | champions[4].role       | MID             |
      | champions[4].winLost    | 19/3/2          |
      | champions[4].KDA        | 7               |
      | champions[4].CS         | 259             |
      | champions[4].KP         | 63              |

      | champions[5].queueType  | CLASH           |
      | champions[5].role       | MID             |
      | champions[5].winLost    | 15/2/11         |
      | champions[5].KDA        | 13              |
      | champions[5].CS         | 202             |
      | champions[5].KP         | 83              |

      | champions[6].queueType  | CLASH           |
      | champions[6].role       | MID             |
      | champions[6].winLost    | 10/0/8          |
      | champions[6].KDA        | PERFECT         |
      | champions[6].CS         | 250             |
      | champions[6].KP         | 72              |

      | champions[7].queueType  | RANKED FLEX     |
      | champions[7].role       | MID             |
      | champions[7].winLost    | 14/2/8          |
      | champions[7].KDA        | 11              |
      | champions[7].CS         | 267             |
      | champions[7].KP         | 70              |

      | champions[8].queueType  | RANKED FLEX     |
      | champions[8].role       | TOP             |
      | champions[8].winLost    | 11/4/9          |
      | champions[8].KDA        | 5               |
      | champions[8].CS         | 188             |
      | champions[8].KP         | 62              |

      | champions[9].queueType  | RANKED FLEX     |
      | champions[9].role       | TOP             |
      | champions[9].winLost    | 14/4/13         |
      | champions[9].KDA        | 6.75            |
      | champions[9].CS         | 197             |
      | champions[9].KP         | 57              |

      | champions[10].queueType | RANKED SOLO/DUO |
      | champions[10].role      | JUNGLE          |
      | champions[10].winLost   | 7/1/6           |
      | champions[10].KDA       | 13              |
      | champions[10].CS        | 187             |
      | champions[10].KP        | 61              |

      | champions[11].queueType | RANKED SOLO/DUO |
      | champions[11].role      | JUNGLE          |
      | champions[11].winLost   | 4/3/2           |
      | champions[11].KDA       | 2               |
      | champions[11].CS        | 123             |
      | champions[11].KP        | 35              |

      | champions[12].queueType | RANKED SOLO/DUO |
      | champions[12].role      | SUPPORT         |
      | champions[12].winLost   | 4/5/27          |
      | champions[12].KDA       | 6.2             |
      | champions[12].CS        | 33              |
      | champions[12].KP        | 75              |

      | champions[13].queueType | RANKED SOLO/DUO |
      | champions[13].role      | SUPPORT         |
      | champions[13].winLost   | 2/5/5           |
      | champions[13].KDA       | 1.4             |
      | champions[13].CS        | 48              |
      | champions[13].KP        | 50              |

      | champions[14].queueType | RANKED SOLO/DUO |
      | champions[14].role      | JUNGLE          |
      | champions[14].winLost   | 4/8/10          |
      | champions[14].KDA       | 1.75            |
      | champions[14].CS        | 231             |
      | champions[14].KP        | 46              |

      | champions[15].queueType | RANKED SOLO/DUO |
      | champions[15].role      | JUNGLE          |
      | champions[15].winLost   | 5/2/6           |
      | champions[15].KDA       | 5.5             |
      | champions[15].CS        | 163             |
      | champions[15].KP        | 42              |

      | champions[16].queueType | RANKED FLEX     |
      | champions[16].role      | JUNGLE          |
      | champions[16].winLost   | 14/6/5          |
      | champions[16].KDA       | 3.16            |
      | champions[16].CS        | 267             |
      | champions[16].KP        | 61              |

      | champions[17].queueType | RANKED FLEX     |
      | champions[17].role      | SUPPORT         |
      | champions[17].winLost   | 8/1/19          |
      | champions[17].KDA       | 27              |
      | champions[17].CS        | 33              |
      | champions[17].KP        | 77              |

      | champions[18].queueType | RANKED FLEX     |
      | champions[18].role      | JUNGLE          |
      | champions[18].winLost   | 3/0/5           |
      | champions[18].KDA       | PERFECT         |
      | champions[18].CS        | 113             |
      | champions[18].KP        | 61              |

      | champions[19].queueType | RANKED FLEX     |
      | champions[19].role      | ADC             |
      | champions[19].winLost   | 11/1/9          |
      | champions[19].KDA       | 20              |
      | champions[19].CS        | 254             |
      | champions[19].KP        | 50              |

      | champions[20].queueType | RANKED SOLO/DUO |
      | champions[20].role      | JUNGLE          |
      | champions[20].winLost   | 2/9/14          |
      | champions[20].KDA       | 1.77            |
      | champions[20].CS        | 109             |
      | champions[20].KP        | 72              |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS               | VALUE                      |

      | champions table[1]             | displayed                  |
      | champions table[1] queue type  | ${champions[1].queueType}  |
      | champions table[1] role        | ${champions[1].role}       |
      | champions table[1] win lost    | ${champions[1].winLost}    |
      | champions table[1] KDA         | ${champions[1].KDA}        |
      | champions table[1] CS          | ${champions[1].CS} CS      |
      | champions table[1] KP          | ${champions[1].KP}% KP     |

      | champions table[2]             | displayed                  |
      | champions table[2] queue type  | ${champions[2].queueType}  |
      | champions table[2] role        | ${champions[2].role}       |
      | champions table[2] win lost    | ${champions[2].winLost}    |
      | champions table[2] KDA         | ${champions[2].KDA}        |
      | champions table[2] CS          | ${champions[2].CS} CS      |
      | champions table[2] KP          | ${champions[2].KP}% KP     |

      | champions table[3]             | displayed                  |
      | champions table[3] queue type  | ${champions[3].queueType}  |
      | champions table[3] role        | ${champions[3].role}       |
      | champions table[3] win lost    | ${champions[3].winLost}    |
      | champions table[3] KDA         | ${champions[3].KDA}        |
      | champions table[3] CS          | ${champions[3].CS} CS      |
      | champions table[3] KP          | ${champions[3].KP}% KP     |

      | champions table[4]             | displayed                  |
      | champions table[4] queue type  | ${champions[4].queueType}  |
      | champions table[4] role        | ${champions[4].role}       |
      | champions table[4] win lost    | ${champions[4].winLost}    |
      | champions table[4] KDA         | ${champions[4].KDA}        |
      | champions table[4] CS          | ${champions[4].CS} CS      |
      | champions table[4] KP          | ${champions[4].KP}% KP     |

      | champions table[5]             | displayed                  |
      | champions table[5] queue type  | ${champions[5].queueType}  |
      | champions table[5] role        | ${champions[5].role}       |
      | champions table[5] win lost    | ${champions[5].winLost}    |
      | champions table[5] KDA         | ${champions[5].KDA}        |
      | champions table[5] CS          | ${champions[5].CS} CS      |
      | champions table[5] KP          | ${champions[5].KP}% KP     |

      | champions table[6]             | displayed                  |
      | champions table[6] queue type  | ${champions[6].queueType}  |
      | champions table[6] role        | ${champions[6].role}       |
      | champions table[6] win lost    | ${champions[6].winLost}    |
      | champions table[6] KDA         | ${champions[6].KDA}        |
      | champions table[6] CS          | ${champions[6].CS} CS      |
      | champions table[6] KP          | ${champions[6].KP}% KP     |

      | champions table[7]             | displayed                  |
      | champions table[7] queue type  | ${champions[7].queueType}  |
      | champions table[7] role        | ${champions[7].role}       |
      | champions table[7] win lost    | ${champions[7].winLost}    |
      | champions table[7] KDA         | ${champions[7].KDA}        |
      | champions table[7] CS          | ${champions[7].CS} CS      |
      | champions table[7] KP          | ${champions[7].KP}% KP     |

      | champions table[8]             | displayed                  |
      | champions table[8] queue type  | ${champions[8].queueType}  |
      | champions table[8] role        | ${champions[8].role}       |
      | champions table[8] win lost    | ${champions[8].winLost}    |
      | champions table[8] KDA         | ${champions[8].KDA}        |
      | champions table[8] CS          | ${champions[8].CS} CS      |
      | champions table[8] KP          | ${champions[8].KP}% KP     |

      | champions table[9]             | displayed                  |
      | champions table[9] queue type  | ${champions[9].queueType}  |
      | champions table[9] role        | ${champions[9].role}       |
      | champions table[9] win lost    | ${champions[9].winLost}    |
      | champions table[9] KDA         | ${champions[9].KDA}        |
      | champions table[9] CS          | ${champions[9].CS} CS      |
      | champions table[9] KP          | ${champions[9].KP}% KP     |

      | champions table[10]            | displayed                  |
      | champions table[10] queue type | ${champions[10].queueType} |
      | champions table[10] role       | ${champions[10].role}      |
      | champions table[10] win lost   | ${champions[10].winLost}   |
      | champions table[10] KDA        | ${champions[10].KDA}       |
      | champions table[10] CS         | ${champions[10].CS} CS     |
      | champions table[10] KP         | ${champions[10].KP}% KP    |

      | champions table[11]            | displayed                  |
      | champions table[11] queue type | ${champions[11].queueType} |
      | champions table[11] role       | ${champions[11].role}      |
      | champions table[11] win lost   | ${champions[11].winLost}   |
      | champions table[11] KDA        | ${champions[11].KDA}       |
      | champions table[11] CS         | ${champions[11].CS} CS     |
      | champions table[11] KP         | ${champions[11].KP}% KP    |

      | champions table[12]            | displayed                  |
      | champions table[12] queue type | ${champions[12].queueType} |
      | champions table[12] role       | ${champions[12].role}      |
      | champions table[12] win lost   | ${champions[12].winLost}   |
      | champions table[12] KDA        | ${champions[12].KDA}       |
      | champions table[12] CS         | ${champions[12].CS} CS     |
      | champions table[12] KP         | ${champions[12].KP}% KP    |

      | champions table[13]            | displayed                  |
      | champions table[13] queue type | ${champions[13].queueType} |
      | champions table[13] role       | ${champions[13].role}      |
      | champions table[13] win lost   | ${champions[13].winLost}   |
      | champions table[13] KDA        | ${champions[13].KDA}       |
      | champions table[13] CS         | ${champions[13].CS} CS     |
      | champions table[13] KP         | ${champions[13].KP}% KP    |

      | champions table[14]            | displayed                  |
      | champions table[14] queue type | ${champions[14].queueType} |
      | champions table[14] role       | ${champions[14].role}      |
      | champions table[14] win lost   | ${champions[14].winLost}   |
      | champions table[14] KDA        | ${champions[14].KDA}       |
      | champions table[14] CS         | ${champions[14].CS} CS     |
      | champions table[14] KP         | ${champions[14].KP}% KP    |

      | champions table[15]            | displayed                  |
      | champions table[15] queue type | ${champions[15].queueType} |
      | champions table[15] role       | ${champions[15].role}      |
      | champions table[15] win lost   | ${champions[15].winLost}   |
      | champions table[15] KDA        | ${champions[15].KDA}       |
      | champions table[15] CS         | ${champions[15].CS} CS     |
      | champions table[15] KP         | ${champions[15].KP}% KP    |

      | champions table[16]            | displayed                  |
      | champions table[16] queue type | ${champions[16].queueType} |
      | champions table[16] role       | ${champions[16].role}      |
      | champions table[16] win lost   | ${champions[16].winLost}   |
      | champions table[16] KDA        | ${champions[16].KDA}       |
      | champions table[16] CS         | ${champions[16].CS} CS     |
      | champions table[16] KP         | ${champions[16].KP}% KP    |

      | champions table[17]            | displayed                  |
      | champions table[17] queue type | ${champions[17].queueType} |
      | champions table[17] role       | ${champions[17].role}      |
      | champions table[17] win lost   | ${champions[17].winLost}   |
      | champions table[17] KDA        | ${champions[17].KDA}       |
      | champions table[17] CS         | ${champions[17].CS} CS     |
      | champions table[17] KP         | ${champions[17].KP}% KP    |

      | champions table[18]            | displayed                  |
      | champions table[18] queue type | ${champions[18].queueType} |
      | champions table[18] role       | ${champions[18].role}      |
      | champions table[18] win lost   | ${champions[18].winLost}   |
      | champions table[18] KDA        | ${champions[18].KDA}       |
      | champions table[18] CS         | ${champions[18].CS} CS     |
      | champions table[18] KP         | ${champions[18].KP}% KP    |

      | champions table[19]            | displayed                  |
      | champions table[19] queue type | ${champions[19].queueType} |
      | champions table[19] role       | ${champions[19].role}      |
      | champions table[19] win lost   | ${champions[19].winLost}   |
      | champions table[19] KDA        | ${champions[19].KDA}       |
      | champions table[19] CS         | ${champions[19].CS} CS     |
      | champions table[19] KP         | ${champions[19].KP}% KP    |

      | champions table[20]            | displayed                  |
      | champions table[20] queue type | ${champions[20].queueType} |
      | champions table[20] role       | ${champions[20].role}      |
      | champions table[20] win lost   | ${champions[20].winLost}   |
      | champions table[20] KDA        | ${champions[20].KDA}       |
      | champions table[20] CS         | ${champions[20].CS} CS     |
      | champions table[20] KP         | ${champions[20].KP}% KP    |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |