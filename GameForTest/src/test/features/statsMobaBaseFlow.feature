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


  #@active
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

  #
  #--------------------------------------------------------------------------------------
  #


  #@active
  Scenario Outline: I validate cases elements on the Top Roles: SS-PO-620, SS-PO-650

    Given the "<browser for test>" browser is opened
    When I open the "Stats Moba page"

    Then wait 5 sec

    #SS-PO-620
    When I input "<summoner>" in "Input Search"
    When I click on "Button Go"
    Then wait 10 sec
    Then the following elements should be
      | NAME OF ELEMENTS               | VALUE   |
      | top roles main icon <roleMain> | present |
      | top roles off icon <roleOff>   | present |

    #SS-PO-650
    Then the following elements should be
      | NAME OF ELEMENTS   | VALUE            |
      | Role Main Wins     | <mainWins>W      |
      | Role Main Losses   | <mainLosses>L    |
      | Role Main Win Rate | (<mainWinRate>%) |
      | Role Main KDA      | <mainKda> KDA    |
      | Role Main KP       | <mainKp>% KP     |
      | Role Off Wins      | <offWins>W       |
      | Role Off Losses    | <offLosses>L     |
      | Role Off Win Rate  | (<offWinRate>%)  |
      | Role Off KDA       | <offKda> KDA     |
      | Role Off KP        | <offKp>% KP      |

    Then close browser

    Examples:
      | browser for test | summoner     | roleMain | mainWins | mainLosses | mainWinRate | mainKda | mainKp | roleOff | offWins | offLosses | offWinRate | offKda | offKp |
      | Chrome           | 54B0MB99     | mid      | 14       | 8          | 63          | 4.46    | 60     | jungle  | 7       | 9         | 43         | 3.13   | 54    |
      | Chrome           | Arbit0rPrime | jungle   | 16       | 17         | 48          | 2.12    | 43     | mid     | 3       | 3         | 50         | 1.84   | 43    |
      | Chrome           | Ssenkcys     | adc      | 42       | 61         | 40          | 2.37    | 45     | support | 5       | 6         | 45         | 2.41   | 42    |


  #
  #--------------------------------------------------------------------------------------------
  #


  #@active
  Scenario Outline: I validate cases elements on the Champion Stats:
  SS-PO-720, SS-PO-730

    Given the "<browser for test>" browser is opened

    #SS-PO-720-730-Account-1
    Given generate variables with values
      | NAME OF VARIABLES       | VALUE        |
      | summoner.name           | 54B0MB99     |

      | statChampion[1].name    | Evelynn      |
      | statChampion[1].games   | 5            |
      | statChampion[1].winRate | 40%          |
      | statChampion[1].KDA     | 3.53         |

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
      | statChampion[4].KDA     | 2.64         |

      | statChampion[5].name    | Vladimir     |
      | statChampion[5].games   | 3            |
      | statChampion[5].winRate | 66%          |
      | statChampion[5].KDA     | 7.13         |

    When I open the "Stats Moba page"

    Then wait 5 sec
    When I input "${summoner.name}" in "Input Search"

    When I click on "Button Go"
    Then wait 10 sec

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

    #SS-PO-720-730-Account-2
    Given generate variables with values
      | NAME OF VARIABLES       | VALUE    |
      | summoner.name           | ssenkcys |

      | statChampion[1].name    | Kai'Sa   |
      | statChampion[1].games   | 10       |
      | statChampion[1].winRate | 50%      |
      | statChampion[1].KDA     | 2.31     |

      | statChampion[2].name    | Ezreal   |
      | statChampion[2].games   | 10       |
      | statChampion[2].winRate | 20%      |
      | statChampion[2].KDA     | 1.96     |

      | statChampion[3].name    | Thresh   |
      | statChampion[3].games   | 2        |
      | statChampion[3].winRate | 100%     |
      | statChampion[3].KDA     | 4.00     |

      | statChampion[4].name    | Sivir    |
      | statChampion[4].games   | 1        |
      | statChampion[4].winRate | 0%       |
      | statChampion[4].KDA     | 2.44     |

    When I open the "Stats Moba page"

    Then wait 5 sec
    When I input "${summoner.name}" in "Input Search"

    When I click on "Button Go"
    Then wait 10 sec

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

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |

  #
  #--------------------------------------------------------------------------------
  #

  #@active
  Scenario Outline: I validate cases elements on the Tier Stats:
  SS-PO-410

    Given the "<browser for test>" browser is opened
    #SS-PO-410-Account-1
    Given generate variables with values
      | NAME OF VARIABLES    | VALUE       |
      | summoner.name        | 54B0MB99    |

      | tierStat[1].queue    | RANKED SOLO |
      | tierStat[1].tierRank | PLATINUM II |
      | tierStat[1].lp       | 40          |
      | tierStat[1].win      | 14          |
      | tierStat[1].loss     | 23          |
      | tierStat[1].winRate  | 37          |

      | tierStat[2].queue    | RANKED FLEX |
      | tierStat[2].tierRank | PLATINUM V  |
      | tierStat[2].lp       | 75          |
      | tierStat[2].win      | 10          |
      | tierStat[2].loss     | 1           |
      | tierStat[2].winRate  | 90          |

    When I open the "Stats Moba page"

    Then wait 5 sec
    When I input "${summoner.name}" in "Input Search"

    When I click on "Button Go"

    Then wait 5 sec
    When I click on "tier menu"
    Then wait 2 sec
    When I click on "tier menu ranked solo"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS       | VALUE                     |
      | tier selected tierRank | ${tierStat[1].tierRank}   |
      | tier selected queue    | ${tierStat[1].queue}      |
      | tier selected lp       | ${tierStat[1].lp} LP      |
      | tier selected win      | ${tierStat[1].win}W       |
      | tier selected loss     | ${tierStat[1].loss}L      |
      | tier selected winRate  | (${tierStat[1].winRate}%) |
    Then wait 2 sec
    When I click on "tier menu"
    Then wait 2 sec
    When I click on "tier menu ranked flex"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS       | VALUE                     |
      | tier selected tierRank | ${tierStat[2].tierRank}   |
      | tier selected queue    | ${tierStat[2].queue}      |
      | tier selected lp       | ${tierStat[2].lp} LP      |
      | tier selected win      | ${tierStat[2].win}W       |
      | tier selected loss     | ${tierStat[2].loss}L      |
      | tier selected winRate  | (${tierStat[2].winRate}%) |
    Then wait 3 sec

    #SS-PO-410-Account-2
    Given generate variables with values
      | NAME OF VARIABLES    | VALUE       |
      | summoner.name        | ssenkcys    |

      | tierStat[1].queue    | RANKED SOLO |
      | tierStat[1].tierRank | SILVER III  |
      | tierStat[1].lp       | 33          |
      | tierStat[1].win      | 9           |
      | tierStat[1].loss     | 14          |
      | tierStat[1].winRate  | 39          |

    When I open the "Stats Moba page"

    Then wait 5 sec
    When I input "${summoner.name}" in "Input Search"

    When I click on "Button Go"

    Then wait 5 sec
    When I click on "tier menu"
    Then wait 2 sec
    When I click on "tier menu ranked solo"
    Then wait 2 sec
    Then the following elements should be
      | NAME OF ELEMENTS       | VALUE                     |
      | tier selected tierRank | ${tierStat[1].tierRank}   |
      | tier selected queue    | ${tierStat[1].queue}      |
      | tier selected lp       | ${tierStat[1].lp} LP      |
      | tier selected win      | ${tierStat[1].win}W       |
      | tier selected loss     | ${tierStat[1].loss}L      |
      | tier selected winRate  | (${tierStat[1].winRate}%) |
    Then wait 3 sec

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |
