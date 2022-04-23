#include "vservcontentstorage.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QMutexLocker>
#include <QUuid>


/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 * This software provided as it is, no any guaranty provided
 * or responsibility is taken by the author
 *
 * It can be freely used for whatever purposes (commercial, too)
 * including usage, modification, distribution of the source but at your own risk
 */

const char * const VservContentStorage::DEFAULT_PROPERTY_NAME = "vservContentStorage";
QSharedPointer<VservContentStorage> VservContentStorage::instance;

VservContentStorage::VservContentStorage(QObject *parent)
    : QObject(parent) {}

VservContentStorage::~VservContentStorage() {}

QUrl VservContentStorage::pushContent(const QString& contentId, const QString& content)
{
    QMutexLocker locker(&accesGuardMutex);
    QSharedPointer<QTemporaryFile>& tempFile = tempFiles[contentId];
    tempFile.reset(new QTemporaryFile());

    tempFile->open();
    tempFile->write(content.toLocal8Bit());
    tempFile->close();

    return tempFile->fileName();
}

void VservContentStorage::dropContent(const QString& contentId)
{
    QMutexLocker locker(&accesGuardMutex);
    tempFiles.erase(contentId);
}

QString VservContentStorage::createUniqueContentId() const
{
    return QUuid::createUuid().toString();
}

void VservContentStorage::setupAsRootContextProperty(
        QQmlApplicationEngine& engine,
        const QString& propertyName)
{
    instance.reset(new VservContentStorage());
    engine.rootContext()->setContextProperty( propertyName
                                            , instance.data()
                                            );
}
