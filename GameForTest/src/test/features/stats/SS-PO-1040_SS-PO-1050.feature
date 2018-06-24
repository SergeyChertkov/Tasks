Feature: Stats site

  @active
  Scenario Outline: SS-PO-1040, SS-PO-1050
  [Match history] check that values of 2 champions block are correct

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES        | VALUE        |
      | summoner.name            | <summoner>   |

      | firstCampion.wins        | <wins1>      |
      | firstCampion.lost        | <lost1>      |
      | firstCampion.winsToLost  | <winToLost1> |
      | firstCampion.KDA         | <KDA1>       |
      | firstCampion.KP          | <KP1>        |

      | secondCampion.wins       | <wins2>      |
      | secondCampion.lost       | <lost2>      |
      | secondCampion.winsToLost | <winToLost2> |
      | secondCampion.KDA        | <KDA2>       |
      | secondCampion.KP         | <KP2>        |

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
      | browser for test | summoner     | wins1 | lost1 | winToLost1 | KDA1 | KP1 | wins2 | lost2 | winToLost2 | KDA2 | KP2 |
#      | Chrome           | 54B0MB99     | 1     | 2     | 33         | 2.88 | 44% | 1     | 1     | 50         | 3.8  | 69% |
      | Chrome           | 54B0MB99     | 1     | 2     | 33         | 2.88 | 44% | 2     | 0     | 100        | 6.6  | 62% |
      | Chrome           | Arbit0rPrime | 4     | 3     | 57         | 2.28 | 40% | 3     | 4     | 42         | 2.77 | 50% |
      | Chrome           | Ssenkcys     | 2     | 7     | 22         | 1.73 | 39% | 5     | 4     | 55         | 2.60 | 51% |
