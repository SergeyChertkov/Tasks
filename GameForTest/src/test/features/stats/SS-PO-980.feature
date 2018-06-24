Feature: Stats site

  #@active
  Scenario Outline: SS-PO-980
  [Match history] check queue type filters content

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES | VALUE      |
      | summoner.name     | <summoner> |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    When I click on "queue dropdown menu"
    Then the following elements should be
      | NAME OF ELEMENTS                 | VALUE        |
      | queue button[1]                  | ALL GAMES    |
      | queue button[2]                  | RANKED SOLO  |
      | queue button[3]                  | RANKED FLEX  |
      | queue button[4]                  | CLASH        |
      | queue dropdown menu              | QUEUE TYPE   |
      | queue button[1] in dropdown menu | displayed    |
      | queue button[1] in dropdown menu | RANKED 3V3   |
      | queue button[2] in dropdown menu | NORMAL BLIND |
      | queue button[3] in dropdown menu | NORMAL DRAFT |
      | queue button[4] in dropdown menu | ARAM         |
      | queue button[5] in dropdown menu | BOT          |
      | queue button[6] in dropdown menu | OTHER        |

    Then close browser

    Examples:
      | browser for test | summoner     |
      | Chrome           | 54B0MB99     |
      | Chrome           | Arbit0rPrime |
      | Chrome           | Ssenkcys     |
