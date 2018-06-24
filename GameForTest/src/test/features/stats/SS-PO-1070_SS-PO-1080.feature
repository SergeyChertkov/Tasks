Feature: Stats site

  @active
  Scenario Outline: SS-PO-1070, SS-PO-1080
  [Match history] check that role details are shown correctly

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES  | VALUE        |
      | summoner.name      | <summoner>   |

      | topRole.wins       | <wins>       |
      | topRole.lost       | <lost>       |
      | topRole.winsToLost | <winsToLost> |
      | topRole.KDA        | <KDA>        |
      | topRole.KP         | <KP>         |

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
      | browser for test | summoner     | wins | lost | winsToLost | KDA  | KP  |
      | Chrome           | 54B0MB99     | 3    | 5    | 37         | 2.61 | 52% |
      #TODO: 7/7 = 50% not 49% is it bug?
      | Chrome           | Arbit0rPrime | 7    | 7    | 49         | 2.52 | 44% |
      | Chrome           | Ssenkcys     | 7    | 12   | 36         | 2.23 | 47% |
