Feature: Stats site

  @active
  Scenario Outline: SS-PO-850
  [Recent Records] check content of the block

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES | VALUE            |
      | summoner.name     | <summoner>       |

      | recentRecords[1]  | <recentRecords1> |
      | recentRecords[2]  | <recentRecords2> |
      | recentRecords[3]  | <recentRecords3> |
      | recentRecords[4]  | <recentRecords4> |
      | recentRecords[5]  | <recentRecords5> |

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
      | browser for test | summoner     | recentRecords1     | recentRecords2 | recentRecords3 | recentRecords4 | recentRecords5    |
      | Chrome           | 54B0MB99     | Longest Win Streak | Most Assists   | Best KDA       | Best KDA       | Most Deaths       |
      | Chrome           | Arbit0rPrime | Longest Loss       | Longest Game   | Longest Game   | Most Assists   | Most Wards Placed |
      | Chrome           | Ssenkcys     | Most Assists       | Most Deaths    | Most Assists   | Best KDA       | Longest Loss      |
