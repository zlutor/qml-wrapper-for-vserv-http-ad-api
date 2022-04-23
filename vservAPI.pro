TEMPLATE = app

QT += qml quick widgets multimedia

SOURCES += main.cpp \
    vserv/cpp/vservcontentstorage.cpp

RESOURCES += qml.qrc \
    content.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

#DISTFILES += \
#    VservHttpApi.js \
#    MandatoryParameters.js \
#    MobileAppIds.js \
#    MobileSiteIds.js \
#    ImportantParameters.js \
#    DeviceRenditionParameters.js \
#    StrictBannerDimensionValues.js \
#    NetworkSimInformation.js \
#    GeoParameters.js \
#    UserDemographics.js \
#    AdResponse.js \
#    CriticalParameters.js \
#    UriHelper.js

HEADERS += \
    vserv/cpp/vservcontentstorage.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
