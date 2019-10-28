#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "fileutils.h"

void FileutilsPlugin::registerTypes(const char *uri) {

    /*
       Here we register our plugin(s). Each plugin is implemented wit a .cpp file (and his .h file)
       "FileUtils" is the name used to register the plugin, and is the one to use for import and invoke his methods from a qml file
       "1,0" is the plugin appVersionIn qml will be:

       import Fileutils 1.0
    */
    qmlRegisterSingletonType<Fileutils>(uri, 1, 0, "Fileutils", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Fileutils; });
}
