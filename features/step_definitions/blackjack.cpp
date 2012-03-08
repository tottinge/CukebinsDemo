#include <vector>
#include <string>

using namespace std;

class Player {
    public:
        void receiveCard(std::string card) { 
            cards.push_back(card);
        }
        int cardCount() { 
            return cards.size(); 
        };
    private:
        std::vector<string> cards;
};



class Table {
    public:
        ~Table() {
            for(int i=0; i< players.size(); ++i) {
                delete players[i];
            }
        }

        void addPlayer(Player* player){
            players.push_back(player);
        }

        Player& getPlayer(int player){
            return *players[player];
        }

        void hit(int playerNumber) {
            Player& player = getPlayer(playerNumber);
            player.receiveCard("Ace spades");
        }

    private:
        std::vector<Player*> players;
};


