Feature: Stats site

  @active
  Scenario Outline: SS-PO-1020
  [Match history] check that values of "Overall" block are correct

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES  | VALUE       |
      | summoner.name      | <summoner>  |

      | overall.wins       | <wins>      |
      | overall.lost       | <lost>      |
      | overall.winsToLost | <winToLost> |
      | overall.KDA        | <KDA>       |
      | overall.KDAKP      | <KDAKP>     |

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
      | browser for test | summoner     | wins | lost | winToLost | KDA | KDAKP              |
      | Chrome           | 54B0MB99     | 12   | 8    | 60        | 4   | 7.8 / 3.7 / 8.8    |
      | Chrome           | Arbit0rPrime | 9    | 11   | 45        | 2   | 4.95 / 5.5 / 7.35  |
      | Chrome           | Ssenkcys     | 8    | 12   | 40        | 2   | 6.45 / 5.85 / 7.15 |
