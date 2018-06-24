Feature: Stats site

  @active
  Scenario Outline: SS-PO-1110
  for user: 54B0MB99
  [Match history] check that data about last 20 matches displayed correctly

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

  @active
  Scenario Outline: SS-PO-1110
  for user: Arbit0rPrime
  [Match history] check that data about last 20 matches displayed correctly

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES       | VALUE        |
      | summoner.name           | Arbit0rPrime |

      | champions[1].queueType  | NORMAL DRAFT |
      | champions[1].role       | JUNGLE       |
      | champions[1].winLost    | 6/4/14       |
      | champions[1].KDA        | 5            |
      | champions[1].CS         | 131          |
      | champions[1].KP         | 45           |

      | champions[2].queueType  | NORMAL DRAFT |
      | champions[2].role       | TOP          |
      | champions[2].winLost    | 0/4/0        |
      | champions[2].KDA        | 0            |
      | champions[2].CS         | 108          |
      | champions[2].KP         | 0            |

      | champions[3].queueType  | NORMAL DRAFT |
      | champions[3].role       | ADC          |
      | champions[3].winLost    | 0/5/0        |
      | champions[3].KDA        | 0            |
      | champions[3].CS         | 110          |
      | champions[3].KP         | 0            |

      | champions[4].queueType  | NORMAL DRAFT |
      | champions[4].role       | JUNGLE       |
      | champions[4].winLost    | 5/6/12       |
      | champions[4].KDA        | 2.83         |
      | champions[4].CS         | 139          |
      | champions[4].KP         | 58           |

      | champions[5].queueType  | NORMAL DRAFT |
      | champions[5].role       | JUNGLE       |
      | champions[5].winLost    | 6/6/10       |
      | champions[5].KDA        | 2.66         |
      | champions[5].CS         | 138          |
      | champions[5].KP         | 69           |

      | champions[6].queueType  | NORMAL DRAFT |
      | champions[6].role       | JUNGLE       |
      | champions[6].winLost    | 3/4/9        |
      | champions[6].KDA        | 3            |
      | champions[6].CS         | 154          |
      | champions[6].KP         | 23           |

      | champions[7].queueType  | NORMAL DRAFT |
      | champions[7].role       | JUNGLE       |
      | champions[7].winLost    | 1/14/15      |
      | champions[7].KDA        | 1.14         |
      | champions[7].CS         | 214          |
      | champions[7].KP         | 44           |

      | champions[8].queueType  | NORMAL DRAFT |
      | champions[8].role       | JUNGLE       |
      | champions[8].winLost    | 1/3/9        |
      | champions[8].KDA        | 3.33         |
      | champions[8].CS         | 115          |
      | champions[8].KP         | 34           |

      | champions[9].queueType  | NORMAL DRAFT |
      | champions[9].role       | JUNGLE       |
      | champions[9].winLost    | 5/2/3        |
      | champions[9].KDA        | 4            |
      | champions[9].CS         | 127          |
      | champions[9].KP         | 33           |

      | champions[10].queueType | NORMAL DRAFT |
      | champions[10].role      | JUNGLE       |
      | champions[10].winLost   | 2/5/3        |
      | champions[10].KDA       | 1            |
      | champions[10].CS        | 84           |
      | champions[10].KP        | 45           |

      | champions[11].queueType | NORMAL DRAFT |
      | champions[11].role      | JUNGLE       |
      | champions[11].winLost   | 5/5/5        |
      | champions[11].KDA       | 2            |
      | champions[11].CS        | 175          |
      | champions[11].KP        | 35           |

      | champions[12].queueType | NORMAL DRAFT |
      | champions[12].role      | JUNGLE       |
      | champions[12].winLost   | 13/3/18      |
      | champions[12].KDA       | 10.33        |
      | champions[12].CS        | 147          |
      | champions[12].KP        | 70           |

      | champions[13].queueType | NORMAL DRAFT |
      | champions[13].role      | ADC          |
      | champions[13].winLost   | 4/5/6        |
      | champions[13].KDA       | 2            |
      | champions[13].CS        | 153          |
      | champions[13].KP        | 52           |

      | champions[14].queueType | NORMAL DRAFT |
      | champions[14].role      | SUPPORT      |
      | champions[14].winLost   | 5/4/7        |
      | champions[14].KDA       | 3            |
      | champions[14].CS        | 22           |
      | champions[14].KP        | 46           |

      | champions[15].queueType | NORMAL DRAFT |
      | champions[15].role      | JUNGLE       |
      | champions[15].winLost   | 1/3/2        |
      | champions[15].KDA       | 1            |
      | champions[15].CS        | 76           |
      | champions[15].KP        | 50           |

      | champions[16].queueType | NORMAL DRAFT |
      | champions[16].role      | MID          |
      | champions[16].winLost   | 14/5/8       |
      | champions[16].KDA       | 4.4          |
      | champions[16].CS        | 115          |
      | champions[16].KP        | 62           |

      | champions[17].queueType | NORMAL DRAFT |
      | champions[17].role      | JUNGLE       |
      | champions[17].winLost   | 3/5/0        |
      | champions[17].KDA       | 0.6          |
      | champions[17].CS        | 73           |
      | champions[17].KP        | 50           |

      | champions[18].queueType | NORMAL DRAFT |
      | champions[18].role      | JUNGLE       |
      | champions[18].winLost   | 14/5/8       |
      | champions[18].KDA       | 4.4          |
      | champions[18].CS        | 131          |
      | champions[18].KP        | 55           |

      | champions[19].queueType | NORMAL BLIND |
      | champions[19].role      | JUNGLE       |
      | champions[19].winLost   | 3/9/11       |
      | champions[19].KDA       | 1.55         |
      | champions[19].CS        | 120          |
      | champions[19].KP        | 30           |

      | champions[20].queueType | NORMAL BLIND |
      | champions[20].role      | MID          |
      | champions[20].winLost   | 8/13/7       |
      | champions[20].KDA       | 1.15         |
      | champions[20].CS        | 133          |
      | champions[20].KP        | 44           |

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

  @active
  Scenario Outline: SS-PO-1110   for user: Ssenkcys
  [Match history] check that data about last 20 matches displayed correctly

    Given the "<browser for test>" browser is opened
    Given generate variables with values
      | NAME OF VARIABLES       | VALUE           |
      | summoner.name           | Ssenkcys        |

      | champions[1].queueType  | RANKED SOLO/DUO |
      | champions[1].role       | ADC             |
      | champions[1].winLost    | 1/4/3           |
      | champions[1].KDA        | 1               |
      | champions[1].CS         | 145             |
      | champions[1].KP         | 36              |

      | champions[2].queueType  | RANKED SOLO/DUO |
      | champions[2].role       | ADC             |
      | champions[2].winLost    | 10/4/9          |
      | champions[2].KDA        | 4.75            |
      | champions[2].CS         | 254             |
      | champions[2].KP         | 43              |

      | champions[3].queueType  | RANKED SOLO/DUO |
      | champions[3].role       | ADC             |
      | champions[3].winLost    | 17/12/7         |
      | champions[3].KDA        | 2               |
      | champions[3].CS         | 239             |
      | champions[3].KP         | 66              |

      | champions[4].queueType  | RANKED SOLO/DUO |
      | champions[4].role       | ADC             |
      | champions[4].winLost    | 12/2/6          |
      | champions[4].KDA        | 9               |
      | champions[4].CS         | 239             |
      | champions[4].KP         | 75              |

      | champions[5].queueType  | RANKED SOLO/DUO |
      | champions[5].role       | ADC             |
      | champions[5].winLost    | 3/10/18         |
      | champions[5].KDA        | 2.1             |
      | champions[5].CS         | 247             |
      | champions[5].KP         | 44              |

      | champions[6].queueType  | RANKED SOLO/DUO |
      | champions[6].role       | ADC             |
      | champions[6].winLost    | 15/2/5          |
      | champions[6].KDA        | 10              |
      | champions[6].CS         | 166             |
      | champions[6].KP         | 64              |

      | champions[7].queueType  | RANKED SOLO/DUO |
      | champions[7].role       | ADC             |
      | champions[7].winLost    | 8/8/8           |
      | champions[7].KDA        | 2               |
      | champions[7].CS         | 224             |
      | champions[7].KP         | 41              |

      | champions[8].queueType  | RANKED SOLO/DUO |
      | champions[8].role       | ADC             |
      | champions[8].winLost    | 13/16/14        |
      | champions[8].KDA        | 1.68            |
      | champions[8].CS         | 290             |
      | champions[8].KP         | 49              |

      | champions[9].queueType  | RANKED SOLO/DUO |
      | champions[9].role       | ADC             |
      | champions[9].winLost    | 4/0/5           |
      | champions[9].KDA        | PERFECT         |
      | champions[9].CS         | 344             |
      | champions[9].KP         | 29              |

      | champions[10].queueType | RANKED SOLO/DUO |
      | champions[10].role      | ADC             |
      | champions[10].winLost   | 1/5/5           |
      | champions[10].KDA       | 1.2             |
      | champions[10].CS        | 108             |
      | champions[10].KP        | 40              |

      | champions[11].queueType | RANKED SOLO/DUO |
      | champions[11].role      | ADC             |
      | champions[11].winLost   | 4/7/5           |
      | champions[11].KDA       | 1.28            |
      | champions[11].CS        | 141             |
      | champions[11].KP        | 50              |

      | champions[12].queueType | RANKED SOLO/DUO |
      | champions[12].role      | ADC             |
      | champions[12].winLost   | 9/11/3          |
      | champions[12].KDA       | 1.09            |
      | champions[12].CS        | 236             |
      | champions[12].KP        | 50              |

      | champions[13].queueType | RANKED SOLO/DUO |
      | champions[13].role      | ADC             |
      | champions[13].winLost   | 8/9/14          |
      | champions[13].KDA       | 2.44            |
      | champions[13].CS        | 366             |
      | champions[13].KP        | 52              |

      | champions[14].queueType | RANKED SOLO/DUO |
      | champions[14].role      | ADC             |
      | champions[14].winLost   | 3/4/4           |
      | champions[14].KDA       | 1.75            |
      | champions[14].CS        | 150             |
      | champions[14].KP        | 43              |

      | champions[15].queueType | RANKED SOLO/DUO |
      | champions[15].role      | ADC             |
      | champions[15].winLost   | 4/3/9           |
      | champions[15].KDA       | 4.33            |
      | champions[15].CS        | 238             |
      | champions[15].KP        | 31              |

      | champions[16].queueType | RANKED SOLO/DUO |
      | champions[16].role      | ADC             |
      | champions[16].winLost   | 7/5/6           |
      | champions[16].KDA       | 2.6             |
      | champions[16].CS        | 254             |
      | champions[16].KP        | 51              |

      | champions[17].queueType | RANKED SOLO/DUO |
      | champions[17].role      | ADC             |
      | champions[17].winLost   | 3/3/2           |
      | champions[17].KDA       | 1.66            |
      | champions[17].CS        | 137             |
      | champions[17].KP        | 45              |

      | champions[18].queueType | RANKED SOLO/DUO |
      | champions[18].role      | ADC             |
      | champions[18].winLost   | 0/3/1           |
      | champions[18].KDA       | 0.33            |
      | champions[18].CS        | 156             |
      | champions[18].KP        | 12              |

      | champions[19].queueType | RANKED SOLO/DUO |
      | champions[19].role      | ADC             |
      | champions[19].winLost   | 0/3/2           |
      | champions[19].KDA       | 0.66            |
      | champions[19].CS        | 84              |
      | champions[19].KP        | 28              |

      | champions[20].queueType | RANKED SOLO/DUO |
      | champions[20].role      | SUPPORT         |
      | champions[20].winLost   | 7/6/17          |
      | champions[20].KDA       | 4               |
      | champions[20].CS        | 45              |
      | champions[20].KP        | 57              |

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
