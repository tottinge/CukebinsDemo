#include <vector>
#include <string>

using namespace std;

class Player {
    public:
        void receiveCard(std::string card); 
        int cardCount();
    private:
        std::vector<string> cards;
};

class Table {
    public:
        ~Table();
        void addPlayer(Player* player);
        Player& getPlayer(int player);
        void hit(int playerNumber);
    private:
        std::vector<Player*> players;
};

