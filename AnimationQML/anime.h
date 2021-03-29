#ifndef ANIME_H
#define ANIME_H

#include <QObject>
#include <QNetworkReply>

class Anime : public QObject
{
    Q_OBJECT
public:
    explicit Anime(QObject *parent = nullptr);
    Q_INVOKABLE void translater(int x);
    Q_INVOKABLE void tournerP90(int x);
    Q_INVOKABLE void tournerM90(int x);
    Q_INVOKABLE void miniBtranslater(int x);
    Q_INVOKABLE void miniHtranslater(int x);


public slots:
    void GetReponse(QNetworkReply *reply);

signals:
    void monSignalTranslation(float coordonnees, int x);
    void monSignalMiniTranslation(int coordonnees, int x);
    void monSignalRotation(float angle, int x);

private:
    int numPlace;
};

#endif // ANIME_H
