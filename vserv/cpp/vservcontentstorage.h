#ifndef VSERVTEMPORARYCONTENTSTORAGE_H
#define VSERVTEMPORARYCONTENTSTORAGE_H

#include <QObject>
#include <QTemporaryFile>
#include <QString>
#include <QSharedPointer>
#include <QQmlApplicationEngine>
#include <QUrl>
#include <QMutex>
#include <map>

/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 * This software provided as it is, no any guaranty provided
 * or responsibility is taken by the author
 *
 * It can be freely used for whatever purposes (commercial, too)
 * including usage, modification, distribution of the source but at your own risk
 */
class VservContentStorage : public QObject
{
    Q_OBJECT

    // "vservContentStorage";
    static const char * const DEFAULT_PROPERTY_NAME;

public:
    explicit VservContentStorage(QObject *parent = 0);
    ~VservContentStorage();

    Q_INVOKABLE QUrl pushContent(const QString& contentId, const QString& content);
    Q_INVOKABLE void dropContent(const QString& contentId);
    Q_INVOKABLE QString createUniqueContentId() const;

    static void
    setupAsRootContextProperty( QQmlApplicationEngine& engine
                              , const QString& propertyName = DEFAULT_PROPERTY_NAME
                              );

private:
    static QSharedPointer<VservContentStorage> instance;

    QMutex accesGuardMutex;
    std::map<QString, QSharedPointer<QTemporaryFile> > tempFiles;

signals:

public slots:
};

#endif // VSERVTEMPORARYCONTENTSTORAGE_H

