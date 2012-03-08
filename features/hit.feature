Feature: hitting
    In order to increase chances of winning
    A player may ask for a "hit", which will cause the dealer
    to provide him an additional card, which will add to his score.

    Scenario: A player hits once
        Given the table has one player
        And the player has 2 cards
        When the player asks for a hit
        Then the player has 3 cards

