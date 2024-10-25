#pragma once
#include <QObject>
#include <QString>
#include <QVector>
#include <QMap>

class GameLogic : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int     currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer NOTIFY playerChanged)
    Q_PROPERTY(bool    playerWon     READ getPlayerWon     WRITE setPlayerWon     NOTIFY playerWonChanged)
    Q_PROPERTY(QString gameType      READ getGameType      WRITE setGameType      NOTIFY gameTypeChanged)
    Q_PROPERTY(bool    catsCradle    READ getCatsCradle    WRITE setCatsCradle    RESET  resetCatsCradle NOTIFY catsCradleMatch FINAL)

public:
    explicit GameLogic(QThread* home = NULL, QObject *parent = NULL);
    ~GameLogic();

    // Setters and Getters
    //
    int getCurrentPlayer() const;
    bool getPlayerWon() const;

    void setCurrentPlayer(int newCurrentPlayer);
    void setPlayerWon(bool won);

    QString getGameType() const;
    void setGameType(const QString &newGameType);

    bool getCatsCradle() const;
    void setCatsCradle(bool newCatsCradle);

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

    // Set square selected
    //
    Q_INVOKABLE void setSquareSelected(const QString &square);

public slots:
    void resetCatsCradle();

signals:
    void playerChanged();
    void playerWonChanged(QString winType, QString winLocation);
    void catsCradleMatch();
    void gameTypeChanged();


private:
    int  m_currentPlayer;
    bool m_playerWon;
    bool m_catsCradle;

    QString m_gameType;
    std::map<QString, char> m_ticTacToeBoard;
};
