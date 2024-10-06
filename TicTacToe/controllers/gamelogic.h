#pragma once
#include <QObject>
#include <QString>
#include <QVector>
#include <QMap>

class GameLogic : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer NOTIFY playerChanged)
    Q_PROPERTY(bool playerWon READ getPlayerWon WRITE setPlayerWon NOTIFY playerWonChanged)
    Q_PROPERTY(bool catsCradle READ getCatsCradle WRITE setCatsCradle RESET resetCatsCradle NOTIFY catsCradleMatch FINAL)
    Q_PROPERTY(QString gameType READ getGameType WRITE setGameType NOTIFY gameTypeChanged)

public:
    explicit GameLogic(QObject *parent = nullptr);

    // Win Logic Functions
    //
    Q_INVOKABLE void checkForHorizontalWin();
    Q_INVOKABLE void checkForVerticalWin();
    Q_INVOKABLE void checkForDiagonalWin();
    Q_INVOKABLE void checkForCatsCradle();

    // Player turn functions
    //
    Q_INVOKABLE void checkPlayerTurn();
    Q_INVOKABLE void playerTwoTurn();

    // Reset functions
    //
    Q_INVOKABLE void resetTicTacToeBoard();
    Q_INVOKABLE void resetPlayerWon();
    Q_INVOKABLE void resetGameType();

public slots:
    // Setters and Getters
    //
    QString getCurrentPlayer() const;
    bool getPlayerWon() const;

    void setCurrentPlayer(const QString &newCurrentPlayer);
    void setPlayerWon(bool won);

    QString getGameType() const;
    void setGameType(const QString &newGameType);

    bool getCatsCradle() const;
    void setCatsCradle(bool newCatsCradle);
    void resetCatsCradle();

signals:
    void playerChanged(const QString &player);
    void playerWonChanged(bool won);
    void gameWon(const QString &winner);
    void catsCradleMatch();
    void gameTypeChanged(const QString &gameType);

private:
    QString currentPlayer="";
    bool playerWon=false;
    bool catsCradle=false;
    QString gameType;
    QMap<QString, bool> ticTacToeBoard;
};
