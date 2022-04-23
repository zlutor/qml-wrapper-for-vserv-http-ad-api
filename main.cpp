#include <QApplication>
#include <QQmlApplicationEngine>
#include <iostream>
#include <QString>
#include "vserv/cpp/vservcontentstorage.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // !!! Vserv stuff is initialized here !!!
    // property name: vservContentStorage
    VservContentStorage::setupAsRootContextProperty(engine);

    engine.load(QUrl(QStringLiteral("qrc:/vserv/qml/main.qml")));

    return app.exec();
}
