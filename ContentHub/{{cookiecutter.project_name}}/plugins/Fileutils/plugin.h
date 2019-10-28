#ifndef FILEUTILSPLUGIN_H
#define FILEUTILSPLUGIN_H

#include <QQmlExtensionPlugin>

class FileutilsPlugin : public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif
