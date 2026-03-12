#ifndef SINGLEAPPLICATION_H
#define SINGLEAPPLICATION_H

#include <QApplication>
#include <QLocalServer>
#include <QLocalSocket>

class SingleApplication : public QApplication
{
    Q_OBJECT

public:
    SingleApplication(int &argc, char **argv, const QString &serverName);

    bool isSecondary() const;

signals:
    void instanceStarted();

private:
    void initServer();

private:
    QString m_serverName;
    QLocalServer* m_server = nullptr;
    bool m_isSecondary = false;
};

#endif