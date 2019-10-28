#include <QDebug>
#include <QtQml>
#include <QtQml/QQmlContext>
#include "fileutils.h"
#include "plugin.h"


Fileutils::Fileutils() {

}

void Fileutils::speak() {
    qDebug() << "hello world!";
}


void Fileutils::moveImage(QString source, QString destination, QString fileName)
{
    //qDebug() << Q_FUNC_INFO << "Copying moveImage from" << source << "to" << destination;

    QDir dir(destination);
    if (!dir.exists())
        dir.mkpath(".");

    const QString srcFilePath = source + QLatin1Char('/') + fileName;
    const QString destFilePath = destination + QLatin1Char('/') + fileName;

    QFile::copy(srcFilePath, destFilePath);
}

/*
  Delete an image
*/
void Fileutils::removeImage(QString source)
{
    if(source.startsWith("file://"))
      source.remove("file://");

    QFile file(source);
    file.remove();
}

/*
   The returned value, depends on the target device :
   '/home/phablet' when running on device
   '/tmp' when on Desktop. NOTE: '/tmp' is a folder inside clickable container, NOT host machine
 */
QString Fileutils::getHomePath()
{
    return QDir::homePath();
}

/*
  Get the list of images owned
*/
QStringList Fileutils::getMomentImages(QString path)
{
    //qDebug() << "Path" << path;
    QStringList list;

    if(path.isEmpty())
      return list;

    if(path.startsWith("file://"))
       path.remove("file://");

    QDir dir(path);
    list = dir.entryList(QDir::Files);
    //qDebug() << "Files" << list;

    return list;
}

/*
  Remove images
*/
void Fileutils::deleteMomentFolder(QString path)
{
    QStringList list;

    if(path.startsWith("file://"))
       path.remove("file://");

    QDir dir(path);
    dir.removeRecursively();
    //list = dir.entryList(QDir::Files);
}
