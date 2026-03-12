// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "autogen/environment.h"
#include "Counter.h"
#include "SingleApplication.h"

#include <QWindow>

int main(int argc, char *argv[])
{
    set_qt_environment();
    //QApplication app(argc, argv);
    SingleApplication app(argc, argv, "Test4QDS001App");

    if (app.isSecondary())
        return 0;

#if 0
    // 注册成 QML 类型
    qmlRegisterType<Counter>("Backend", 1, 0, "Counter");
#endif

    QQmlApplicationEngine engine;

#if 1
    // C++ 创建对象
    Counter counter;

    // 把对象暴露给 QML
    engine.rootContext()->setContextProperty(
        "counter",   // QML 里访问的名字
        &counter
        );
#endif

    const QUrl url(mainQmlFile);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *root = engine.rootObjects().first();

    QObject::connect(&app, &SingleApplication::instanceStarted, [&]() {

        QWindow *window = qobject_cast<QWindow*>(root);

        if (window) {
            window->showNormal();
            window->raise();
            window->requestActivate();
        }

    });

    return app.exec();
}
