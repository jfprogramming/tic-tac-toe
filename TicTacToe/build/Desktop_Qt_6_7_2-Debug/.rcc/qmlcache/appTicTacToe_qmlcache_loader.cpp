#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_TicTacToe_Main_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_PlayArea_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_Home_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_DateTimeSetting_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_PlayerManager_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_PlayerSelection_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_AdminLogin_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_AdminPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_Footer_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_TicTacToe_Header_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/Main.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_Main_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/PlayArea.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_PlayArea_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/Home.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_Home_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/DateTimeSetting.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_DateTimeSetting_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/PlayerManager.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_PlayerManager_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/PlayerSelection.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_PlayerSelection_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/AdminLogin.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_AdminLogin_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/AdminPage.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_AdminPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/Footer.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_Footer_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/TicTacToe/Header.qml"), &QmlCacheGeneratedCode::_qt_qml_TicTacToe_Header_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appTicTacToe)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appTicTacToe))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appTicTacToe)() {
    return 1;
}
