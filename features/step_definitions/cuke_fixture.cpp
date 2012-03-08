#include <gtest/gtest.h>
#include <cukebins/wireserver.hpp>
#include "blackjack.h"
#include <cukebins/wireserver.hpp>

struct Context {
    Table table;
};


GIVEN("^the table has one player$") {
    USING_CONTEXT(Context, context);
    context->table.addPlayer(new Player());
}


GIVEN("^the player has 2 cards$") {
    USING_CONTEXT(Context, context);
    Player& player = context->table.getPlayer(0);
    player.receiveCard("4 clubs");
    player.receiveCard("2 spades");
    ASSERT_EQ(2, player.cardCount());
}


WHEN("^the player asks for a hit$") {
    USING_CONTEXT(Context, context);
    Table& table = context->table;
    table.hit(0);
}


THEN("^the player has 3 cards$") {
    USING_CONTEXT(Context, context);
    Player& player = context->table.getPlayer(0);
    ASSERT_EQ(3, player.cardCount());
}


