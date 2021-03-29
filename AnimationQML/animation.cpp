#include "animation.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QNetworkReply>


animation::animation(QObject *parent)
{
//    QNetworkAccessManager *nm = new QNetworkAccessManager(this);
//    QUrl url("http://parking.fr/15FGH14");
//    nm->get(QNetworkRequest(url));
//    QObject::connect(nm, SIGNAL(finished(QNetworkReply *)),this, SLOT(GetReponse(QNetworkReply *)));
}
void animation::declancherAnimation(QString place){

}
void animation::translater(){    
    float x = 1;
    float largeur = 134;
    float coordx = (x-1) * largeur;
    emit monSignalTranslation(coordx);
}
void animation::tournerP90(){
    float angle = +90;
    emit monSignalRotation(angle);
}
void animation::tournerM90(){
    float angle = -90;
    emit monSignalRotation(angle);
}
void animation::miniHtranslater(){
    int coordy = 220;
    emit monSignalMiniTranslation(coordy);
}
void animation::miniBtranslater(){
    int coordy = 720;
    emit monSignalMiniTranslation(coordy);
}



void animation::GetReponse(QNetworkReply *reply){
    if(reply->error() == QNetworkReply::NoError) {
        QString strReply = reply->readAll();
        QJsonDocument jsondoc = QJsonDocument::fromJson(strReply.toUtf8());
        QJsonObject jsonObject = jsondoc.object();
        QStringList list = jsonObject.keys();
        strReply.remove('[');
        strReply.remove(']');


    }
}
