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

public:
    explicit GameLogic(QObject *parent = nullptr);

    QString getCurrentPlayer() const;
    void setCurrentPlayer(const QString &newCurrentPlayer);

    bool getPlayerWon() const;
    void setPlayerWon(bool won);

    // Exposed Functions to QML
    //
    Q_INVOKABLE void checkPlayerTurn();
    Q_INVOKABLE void checkForHorizontalWin();
    Q_INVOKABLE void checkForVerticalWin();
    Q_INVOKABLE void checkForDiagonalWin();
    Q_INVOKABLE void checkForCatsCradle();
    Q_INVOKABLE void playerTwoIconTurn();
    Q_INVOKABLE void resetGame();

    bool getCatsCradle() const;

public slots:
    void setCatsCradle(bool newCatsCradle);
    void resetCatsCradle();

signals:
    void playerChanged(const QString &player);
    void playerWonChanged(bool won);
    void gameWon(const QString &winner);
    void catsCradleMatch();

private:
    QString currentPlayer;
    bool playerWon=false;
    bool catsCradle=false;
    QMap<QString, bool> ticTacToeBoard;

};
