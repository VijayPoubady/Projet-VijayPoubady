#ifndef ANIMATION_H
#define ANIMATION_H

#include <QObject>
#include <QNetworkReply>


class animation : public QObject
{
    Q_OBJECT
public:
    explicit animation(QObject *parent = nullptr);
    Q_INVOKABLE void translater();
    Q_INVOKABLE void tournerP90();
    Q_INVOKABLE void tournerM90();
    Q_INVOKABLE void miniBtranslater();
    Q_INVOKABLE void miniHtranslater();
    Q_INVOKABLE void declancherAnimation(QString place);
    animation(QWidget *parent = nullptr);
    ~animation();

public slots:
    void GetReponse(QNetworkReply *reply);

signals:
    void monSignalTranslation(float coordonnees);
    void monSignalMiniTranslation(int coordonnees);
    void monSignalRotation(float angle);
};

#endif // ANIMATION_H
