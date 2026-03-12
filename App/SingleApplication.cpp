#include "SingleApplication.h"

SingleApplication::SingleApplication(int &argc, char **argv, const QString &serverName)
    : QApplication(argc, argv),
      m_serverName(serverName)
{
    QLocalSocket socket;
    socket.connectToServer(serverName);

    if (socket.waitForConnected(100)) {
        m_isSecondary = true;

        socket.write("activate");
        socket.flush();
        socket.waitForBytesWritten(100);

        socket.disconnectFromServer();
    } else {
        initServer();
    }
}

bool SingleApplication::isSecondary() const
{
    return m_isSecondary;
}

void SingleApplication::initServer()
{
    m_server = new QLocalServer(this);

    QLocalServer::removeServer(m_serverName);

    m_server->listen(m_serverName);

    connect(m_server, &QLocalServer::newConnection, this, [this]() {

        QLocalSocket *socket = m_server->nextPendingConnection();

        socket->waitForReadyRead(100);

        QByteArray msg = socket->readAll();

        if (msg == "activate") {
            emit instanceStarted();
        }

        socket->disconnectFromServer();
    });
}