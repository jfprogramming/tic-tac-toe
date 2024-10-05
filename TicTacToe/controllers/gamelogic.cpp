#include "gamelogic.h"
#include "controllers.h"
#include <QRandomGenerator>

GameLogic::GameLogic(QObject *parent)
    : QObject{parent}, currentPlayer{"Player1"}, playerWon{false}
{
    // Initialize the board with empty strings
    board.fill("", 9);
}

QString GameLogic::getCurrentPlayer() const
{
    return currentPlayer;
}

void GameLogic::setCurrentPlayer(const QString &newCurrentPlayer)
{
    currentPlayer = newCurrentPlayer;
    emit playerChanged(currentPlayer);
}

bool GameLogic::getPlayerWon() const
{
    return playerWon;
}

void GameLogic::setPlayerWon(bool won)
{
    playerWon = won;
    emit playerWonChanged(won);
}

void GameLogic::checkPlayerTurn()
{
    if (currentPlayer == "Player1") {
        currentPlayer = "Player2";
    } else {
        currentPlayer = "Player1";
    }
    emit playerChanged(currentPlayer);
}

void GameLogic::checkForHorizontalWin()
{
    // Implement horizontal win logic
    // If there is a win, call setPlayerWon(true) and emit gameWon(currentPlayer)
}

void GameLogic::checkForVerticalWin()
{
    // Implement vertical win logic
    // If there is a win, call setPlayerWon(true) and emit gameWon(currentPlayer)
}

void GameLogic::checkForDiagonalWin()
{
    // Implement diagonal win logic
    // If there is a win, call setPlayerWon(true) and emit gameWon(currentPlayer)
}

void GameLogic::checkForCatsCradle()
{
    bool allFilled = true;
    for (const auto &cell : board) {
        if (cell.isEmpty()) {
            allFilled = false;
            break;
        }
    }
    if (allFilled) {
        // Handle the CatsCradle scenario
    }
}

void GameLogic::playerTwoIconTurn()
{
    if (currentPlayer == "Player2") {
        QVector<int> emptySquares;
        for (int i = 0; i < board.size(); ++i) {
            if (board[i].isEmpty()) {
                emptySquares.append(i);
            }
        }
        if (!emptySquares.isEmpty()) {
            int randomIndex = QRandomGenerator::global()->bounded(emptySquares.size());
            int selectedSquare = emptySquares[randomIndex];
            board[selectedSquare] = "Player2";
            checkForHorizontalWin();
            checkForVerticalWin();
            checkForDiagonalWin();
            checkForCatsCradle();
        }
    }
}

void GameLogic::resetGame()
{
    board.fill("");
    setCurrentPlayer("Player1");
    setPlayerWon(false);
}
