#include "anime.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QTimer>
//************************************REQUETE BDD**********************************************
Anime::Anime(QObject *parent) : QObject(parent)
{
    QNetworkAccessManager *nm = new QNetworkAccessManager(this);
    QUrl url("http://parking.fr/15GBH20");
    nm->get(QNetworkRequest(url));
    QObject::connect(nm, SIGNAL(finished(QNetworkReply *)),this, SLOT(GetReponse(QNetworkReply *)));
}
//************************************METHODE**********************************************
void Anime::translater(int x){
    float largeur = 134;
    if(x <= 12){
        float coordx = ((x%13)-1) * largeur;
        emit monSignalTranslation(coordx,x);
    }
    else if(x >= 12){
        float coordx = ((x%13)) * largeur;
        emit monSignalTranslation(coordx,x);
    }
}
void Anime::tournerP90(int x){
    float angle = +90;
    x = numPlace;
    emit monSignalRotation(angle,x);
}
void Anime::tournerM90(int x){
    float angle = -90;
    x = numPlace;
    emit monSignalRotation(angle,x);
}
void Anime::miniHtranslater(int x){
    int coordy = 220;
    x = numPlace;
    emit monSignalMiniTranslation(coordy, x);
}
void Anime::miniBtranslater(int x){
    int coordy = 720;
    x = numPlace;
    emit monSignalMiniTranslation(coordy, x);
}
//************************************DECODER LE JSON**********************************************
void Anime::GetReponse(QNetworkReply *reply){
    if(reply->error() == QNetworkReply::NoError) {
        QString strReply = reply->readAll();
        strReply.remove('[');
        strReply.remove(']');
        QJsonDocument jsondoc = QJsonDocument::fromJson(strReply.toUtf8());
        QJsonObject jsonObject = jsondoc.object();
        QStringList list = jsonObject.keys();

        qDebug()<< strReply;

        for (int i=0;i< jsonObject.size();i++) {
            QJsonValue value = jsonObject.value(list[i]);
            if (value.isDouble()){
                numPlace = value.toDouble();
                qDebug() <<"Double = " << list[i] << ",Value = " << numPlace ;
            }
        }
        translater(numPlace);
    }
}

