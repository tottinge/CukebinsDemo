@wip
Feature: deal a blackjack hand
    In order to start a game of blackjack
    Each player should receive two cards

    Scenario: One player
        Given the table has 1 player
        When the dealer deals cards
        Then player 1 has 2 cards
        And the dealer has 2 cards
        And the deck is short 4 cards

    Scenario: five players
        Given the table has 5 players
        When the dealer deals cards
        Then the table appears as follows:
            | Player | Cards |
            | dealer |   2   |
            |  1     |   2   |
            |  2     |   2   |
            |  3     |   2   |
            |  4     |   2   |
            |  5     |   2   |
        And the deck is short 12 cards

