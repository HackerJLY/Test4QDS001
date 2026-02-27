#pragma once

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ value NOTIFY valueChanged)

public:
    explicit Counter(QObject *parent = nullptr);

    int value() const;

    Q_INVOKABLE void increment();

signals:
    void valueChanged();

private:
    int m_value = 0;
};
