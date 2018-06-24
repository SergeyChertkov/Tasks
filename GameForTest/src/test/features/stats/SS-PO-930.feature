Feature: Stats site

  @active
  Scenario Outline: SS-PO-930
  for user: 54B0MB99
  [Most played with] check that content of a block is correct

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
      | NAME OF ELEMENTS            | VALUE                                        |
      | most played[1] name         | ${mostPlayed[1].name}                        |
      | most played[1] win to lost  | ${mostPlayed[1].win}/${mostPlayed[1].lost}   |
      | most played[1] win rate     | ${mostPlayed[1].winRate}                     |

      | most played[2] name         | ${mostPlayed[2].name}                        |
      | most played[2] win to lost  | ${mostPlayed[2].win}/${mostPlayed[2].lost}   |
      | most played[2] win rate     | ${mostPlayed[2].winRate}                     |

      | most played[3] name         | ${mostPlayed[3].name}                        |
      | most played[3] win to lost  | ${mostPlayed[3].win}/${mostPlayed[3].lost}   |
      | most played[3] win rate     | ${mostPlayed[3].winRate}                     |

      | most played[4] name         | ${mostPlayed[4].name}                        |
      | most played[4] win to lost  | ${mostPlayed[4].win}/${mostPlayed[4].lost}   |
      | most played[4] win rate     | ${mostPlayed[4].winRate}                     |

      | most played[5] name         | ${mostPlayed[5].name}                        |
      | most played[5] win to lost  | ${mostPlayed[5].win}/${mostPlayed[5].lost}   |
      | most played[5] win rate     | ${mostPlayed[5].winRate}                     |

      | most played[6] name         | ${mostPlayed[6].name}                        |
      | most played[6] win to lost  | ${mostPlayed[6].win}/${mostPlayed[6].lost}   |
      | most played[6] win rate     | ${mostPlayed[6].winRate}                     |

      | most played[7] name         | ${mostPlayed[7].name}                        |
      | most played[7] win to lost  | ${mostPlayed[7].win}/${mostPlayed[7].lost}   |
      | most played[7] win rate     | ${mostPlayed[7].winRate}                     |

      | most played[8] name         | ${mostPlayed[8].name}                        |
      | most played[8] win to lost  | ${mostPlayed[8].win}/${mostPlayed[8].lost}   |
      | most played[8] win rate     | ${mostPlayed[8].winRate}                     |

      | most played[9] name         | ${mostPlayed[9].name}                        |
      | most played[9] win to lost  | ${mostPlayed[9].win}/${mostPlayed[9].lost}   |
      | most played[9] win rate     | ${mostPlayed[9].winRate}                     |

      | most played[10] name        | ${mostPlayed[10].name}                       |
      | most played[10] win to lost | ${mostPlayed[10].win}/${mostPlayed[10].lost} |
      | most played[10] win rate    | ${mostPlayed[10].winRate}                    |

      | most played[11] name        | not present                                  |
      | most played[11] win to lost | not present                                  |
      | most played[11] win rate    | not present                                  |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |


  @active
  Scenario Outline: Scenario SS-PO-930
  for user: Arbit0rPrime
  [Most played with] check that content of a block is correct

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES     | VALUE           |
      | summoner.name         | Arbit0rPrime    |

      | mostPlayed[1].name    | MobalyticsPrime |
      | mostPlayed[1].win     | 8               |
      | mostPlayed[1].lost    | 10              |
      | mostPlayed[1].winRate | 44%             |

      | mostPlayed[2].name    | Ssenkcys        |
      | mostPlayed[2].win     | 9               |
      | mostPlayed[2].lost    | 3               |
      | mostPlayed[2].winRate | 75%             |

      | mostPlayed[3].name    | Lord Vagh       |
      | mostPlayed[3].win     | 3               |
      | mostPlayed[3].lost    | 2               |
      | mostPlayed[3].winRate | 60%             |

      | mostPlayed[4].name    | LadyPeaches     |
      | mostPlayed[4].win     | 2               |
      | mostPlayed[4].lost    | 2               |
      | mostPlayed[4].winRate | 50%             |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS           | VALUE                                      |
      | most played[1] name        | ${mostPlayed[1].name}                      |
      | most played[1] win to lost | ${mostPlayed[1].win}/${mostPlayed[1].lost} |
      | most played[1] win rate    | ${mostPlayed[1].winRate}                   |

      | most played[2] name        | ${mostPlayed[2].name}                      |
      | most played[2] win to lost | ${mostPlayed[2].win}/${mostPlayed[2].lost} |
      | most played[2] win rate    | ${mostPlayed[2].winRate}                   |

      | most played[3] name        | ${mostPlayed[3].name}                      |
      | most played[3] win to lost | ${mostPlayed[3].win}/${mostPlayed[3].lost} |
      | most played[3] win rate    | ${mostPlayed[3].winRate}                   |

      | most played[4] name        | ${mostPlayed[4].name}                      |
      | most played[4] win to lost | ${mostPlayed[4].win}/${mostPlayed[4].lost} |
      | most played[4] win rate    | ${mostPlayed[4].winRate}                   |

      | most played[5] name        | not present                                |
      | most played[5] win to lost | not present                                |
      | most played[5] win rate    | not present                                |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |

  @active
  Scenario Outline: Scenario SS-PO-930
  for user: Ssenkcys
  [Most played with] check that content of a block is correct

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES     | VALUE           |
      | summoner.name         | Ssenkcys        |

      | mostPlayed[1].name    | Arbit0rPrime    |
      | mostPlayed[1].win     | 9               |
      | mostPlayed[1].lost    | 3               |
      | mostPlayed[1].winRate | 75%             |

      | mostPlayed[2].name    | MobalyticsPrime |
      | mostPlayed[2].win     | 7               |
      | mostPlayed[2].lost    | 5               |
      | mostPlayed[2].winRate | 58%             |

      | mostPlayed[3].name    | Melonmoba       |
      | mostPlayed[3].win     | 3               |
      | mostPlayed[3].lost    | 3               |
      | mostPlayed[3].winRate | 50%             |

      | mostPlayed[4].name    | IBMPro          |
      | mostPlayed[4].win     | 2               |
      | mostPlayed[4].lost    | 1               |
      | mostPlayed[4].winRate | 66%             |

      | mostPlayed[5].name    | Reign Of        |
      | mostPlayed[5].win     | 1               |
      | mostPlayed[5].lost    | 2               |
      | mostPlayed[5].winRate | 33%             |

    When I open the "Stats Moba page"
    When I input "${summoner.name}" in "Input Search"
    When I click on "Button Go"
    And wait 5 sec

    Then the following elements should be
      | NAME OF ELEMENTS           | VALUE                                      |
      | most played[1] name        | ${mostPlayed[1].name}                      |
      | most played[1] win to lost | ${mostPlayed[1].win}/${mostPlayed[1].lost} |
      | most played[1] win rate    | ${mostPlayed[1].winRate}                   |

      | most played[2] name        | ${mostPlayed[2].name}                      |
      | most played[2] win to lost | ${mostPlayed[2].win}/${mostPlayed[2].lost} |
      | most played[2] win rate    | ${mostPlayed[2].winRate}                   |

      | most played[3] name        | ${mostPlayed[3].name}                      |
      | most played[3] win to lost | ${mostPlayed[3].win}/${mostPlayed[3].lost} |
      | most played[3] win rate    | ${mostPlayed[3].winRate}                   |

      | most played[4] name        | ${mostPlayed[4].name}                      |
      | most played[4] win to lost | ${mostPlayed[4].win}/${mostPlayed[4].lost} |
      | most played[4] win rate    | ${mostPlayed[4].winRate}                   |

      | most played[5] name        | ${mostPlayed[5].name}                      |
      | most played[5] win to lost | ${mostPlayed[5].win}/${mostPlayed[5].lost} |
      | most played[5] win rate    | ${mostPlayed[5].winRate}                   |

      | most played[6] name        | not present                                |
      | most played[6] win to lost | not present                                |
      | most played[6] win rate    | not present                                |

    Then close browser

    Examples:
      | browser for test |
      | Chrome           |
