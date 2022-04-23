/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import QtMultimedia 5.4
//import QtSystemInfo 5.4

//
// http://qmlbook.org/ch10/index.html#
// http://code.tutsplus.com/tutorials/streaming-video-in-android-apps--cms-19888
// http://www.androidbegin.com/tutorial/android-video-streaming-videoview-tutorial/
//
//Item
Rectangle
{
    //property alias contentSourceUrl: mediaPlayer.source
    property alias contentSourceUrl: videoOutputId.source
    property url redirectUrl
    property url clickUrl

    id: multimediaContentViewer
    visible : false

    VideoOutput {
        id: videoOutputId
        height: width
        source: mediaPlayer

        property alias duration: mediaPlayer.duration
        property alias mediaSource: mediaPlayer.source
        property alias metaData: mediaPlayer.metaData
        property alias playbackRate: mediaPlayer.playbackRate
        property alias position: mediaPlayer.position
        property alias volume: mediaPlayer.volume

        signal sizeChanged
        signal fatalError

        onHeightChanged: videoOutputId.sizeChanged()

        MediaPlayer {
            id: mediaPlayer
            autoLoad: false
            loops: Audio.Infinite

            onError: {
                if (MediaPlayer.NoError != error) {
                    console.log("[qmlvideo] VideoItem.onError error " + error + " errorString " + errorString)
                    videoOutputId.fatalError()
                }
            }
        }

        function start() { mediaPlayer.play() }
        function stop() { mediaPlayer.stop() }
        function seek(position) { mediaPlayer.seek(position); }
    }

//    ScreenSaver {
//        screenSaverEnabled: false
//    }

//    // http://doc-snapshot.qt-project.org/qt5-5.4/qml-qtmultimedia-mediaplayer.html
//    MediaPlayer
//    {
//        id: mediaPlayer
//        source: "http://techslides.com/demos/sample-videos/small.mp4"
//        //source: "http://upload.wikimedia.org/wikipedia/commons/7/75/Big_Buck_Bunny_Trailer_400p.ogg"
//        //source: "Big_Buck_Bunny_Trailer_400p.ogg"
//        //source: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.ogv"
//        //source: "big_buck_bunny.ogv"
//        //source: "http://cache1.asset-cache.net/xd/470913691.mp4?v=1&c=IWSAsset&k=2&d=52BDE445D70F4D691B9E8FE1D63C72035145F92974FB5D8686569D9242CE71A03CBE17C280201F25"
//        //source: "http://ak6.picdn.net/shutterstock/videos/3899120/preview/stock-footage-sailing-in-the-wind-through-the-waves-hd-sailing-boat-shot-in-full-hd-at-the-sailing-in-the.mp4"
//        //source: "stock-footage-sailing-in-the-wind-through-the-waves-hd-sailing-boat-shot-in-full-hd-at-the-sailing-in-the.mp4"
//        //source : "http://img.vserv.mobi/i/320x480_d/d32c2f691de24bd371e85e0eb3358ea6.jpg"
//        //autoPlay: false
//        //autoLoad: true
//        loops: MediaPlayer.Infinite

//        onBufferProgressChanged: {
//            console.debug("onBufferProgressChanged: ", bufferProgress)
//        }

//        onErrorChanged: {
//            console.error("onErrorChanged (code, msg): ", error)
//            console.error("MediaPlayer - content source: ", contentSourceUrl)
//            console.error("MediaPlayer - availability: ", availability)
//            console.error("MediaPlayer - metadata: ", metaData)
//        }

//        onError: {
//            console.error("onError (code, msg): ", error, errorString)
//            console.error("MediaPlayer - content source: ", contentSourceUrl)
//            console.error("MediaPlayer - availability: ", availability)
//            console.error("MediaPlayer - metadata: ", metaData)
//        }

//        onPlaying: {
//            console.debug("onPlaying")
//            console.debug("bufferProgress: ", bufferProgress)
//            console.debug("MediaPlayer - content source: ", contentSourceUrl)
//            console.debug("MediaPlayer - availability: ", availability)
//            console.debug("MediaPlayer - status: ", status)
//            console.debug("MediaPlayer - playbackState: ", playbackState)
//            console.debug("MediaPlayer - hasAudio: ", hasAudio)
//            console.debug("MediaPlayer - hasVideo: ", hasVideo)
//            console.debug("MediaPlayer - metadata: ", metaData)
//        }

//        onPaused: {
//            console.debug("onPaused")
//            console.debug("MediaPlayer - content source: ", contentSourceUrl)
//            console.debug("MediaPlayer - availability: ", availability)
//            console.debug("MediaPlayer - status: ", status)
//            console.debug("MediaPlayer - playbackState: ", playbackState)
//            console.debug("MediaPlayer - hasAudio: ", hasAudio)
//            console.debug("MediaPlayer - hasVideo: ", hasVideo)
//            console.debug("MediaPlayer - metadata: ", metaData)
//        }

//        onStatusChanged:
//        {
//            console.error("MediaPlayer - onStatusChanged: ", status)
//            //multimediaContentViewer.visible = (MediaPlayer.Loaded === mediaPlayer.status)
//            if (MediaPlayer.Loaded === mediaPlayer.status)
//            {
//                multimediaContentViewer.color = "green"
//                console.debug("bufferProgress: ", bufferProgress)
//            }
//            else
//            {
//                multimediaContentViewer.color = "gold"
//                console.debug("bufferProgress: ", bufferProgress)
//            }
//        }
//    }

//    // http://doc-snapshot.qt-project.org/qt5-5.4/qml-qtmultimedia-videooutput.html
//    // http://doc-snapshot.qt-project.org/qt5-5.4/qml-qtmultimedia-video.html
//    VideoOutput
//    {
//        anchors.fill: parent
//        source: mediaPlayer

//        MouseArea
//        {
//            anchors.fill: parent
//            onClicked: { Qt.openUrlExternally(redirectUrl) }
//        }
//    }

    MouseArea {
           id: playArea
           anchors.fill: parent
           onPressed:  { mediaPlayer.play() }
       }


    function show(contentSourceUrl, redirectUrl, clickUrl)
    {
        console.debug("Video received...")

//        multimediaContentViewer.contentSourceUrl = contentSourceUrl
//        multimediaContentViewer.redirectUrl = redirectUrl
//        multimediaContentViewer.clickUrl = clickUrl
//        mediaPlayer.play()
        multimediaContentViewer.visible = true
        //multimediaContentViewer.contentSourceUrl = "http://upload.wikimedia.org/wikipedia/commons/7/75/Big_Buck_Bunny_Trailer_400p.ogg"
        multimediaContentViewer.contentSourceUrl = "http://www.androidbegin.com/tutorial/AndroidCommercial.3gp"
        //multimediaContentViewer.contentSourceUrl = "https://ia700401.us.archive.org/19/items/ksnn_compilation_master_the_internet/ksnn_compilation_master_the_internet_512kb.mp4"
        videoOutputId.start()
    }
}

