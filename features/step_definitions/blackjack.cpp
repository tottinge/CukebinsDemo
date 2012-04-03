#include <vector>
#include <string>
#include "blackjack.h"

using namespace std;

void Player::receiveCard(std::string card) { 
    cards.push_back(card);
}

int Player::cardCount() { 
    return cards.size(); 
};

Table::~Table() {
    for(int i=0; i< players.size(); ++i) {
        delete players[i];
    }
}

void Table::addPlayer(Player* player){
    players.push_back(player);
}

Player& Table::getPlayer(int player){
    return *players[player];
}

void Table::hit(int playerNumber) {
    Player& player = getPlayer(playerNumber);
    player.receiveCard("Ace spades");
}

