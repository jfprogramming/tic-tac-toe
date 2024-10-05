#pragma once
#include <QObject>
#include <QString>
#include <QVector>

class GameLogic : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer NOTIFY playerChanged)
    Q_PROPERTY(bool playerWon READ getPlayerWon WRITE setPlayerWon NOTIFY playerWonChanged)
public:
    explicit GameLogic(QObject *parent = nullptr);

    QString getCurrentPlayer() const;
    void setCurrentPlayer(const QString &newCurrentPlayer);

    bool getPlayerWon() const;
    void setPlayerWon(bool won);

    Q_INVOKABLE void checkPlayerTurn();
    Q_INVOKABLE void checkForHorizontalWin();
    Q_INVOKABLE void checkForVerticalWin();
    Q_INVOKABLE void checkForDiagonalWin();
    Q_INVOKABLE void checkForCatsCradle();
    Q_INVOKABLE void playerTwoIconTurn();
    Q_INVOKABLE void resetGame();

signals:
    void playerChanged(const QString &player);
    void playerWonChanged(bool won);
    void gameWon(const QString &winner);

private:
    QString currentPlayer;
    bool playerWon;
    QVector<QString> board;
};
