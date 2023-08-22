!MAIN_PRI{
    CONFIG += MAIN_PRI

    INCLUDEPATH += $$PWD

    HEADERS += \
    $$PWD/main.h

    SOURCES += \
    $$PWD/main.cpp

    include($$PWD/../widgets/mainwindow/mainwindow.pri)

}
