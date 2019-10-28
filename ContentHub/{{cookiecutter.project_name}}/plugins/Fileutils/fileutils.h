#ifndef FILEUTILS_H
#define FILEUTILS_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QFileInfo>
#include <QRegularExpression>
#include <QDir>
#include <QDateTime>

class Fileutils: public QObject {
    Q_OBJECT

public:
    Fileutils();
   ~Fileutils() = default;
   /* IMPORTANT: Without Q_INVOKABLE as prefix, the method is NOT exposed to QML (ie: is non invokable) causing error like:
      TypeError: Property <metho-name> of object <pluginName>(0x284d8d0) is not a function
   */
   Q_INVOKABLE void moveImage(QString source, QString destination, QString fileName);  
   Q_INVOKABLE void removeImage(QString source);
   Q_INVOKABLE QStringList getMomentImages(QString path);
   Q_INVOKABLE void deleteMomentFolder(QString path);
   Q_INVOKABLE QString getHomePath();
   Q_INVOKABLE void speak();
};

#endif
