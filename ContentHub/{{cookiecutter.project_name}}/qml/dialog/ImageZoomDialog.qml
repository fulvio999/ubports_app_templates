import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

/*
   Show the provided image in a dedicated Dialog
*/
Dialog {
       id: imageZoomDialog

       /* the full path to image to display */
       property string targetImagePath;
       property string imageName;

       text: "<b>"+ i18n.tr("Image")+": "+ imageName+" ("+i18n.tr("tap to close")+")"
       contentHeight : root.height - units.gu(2);
       contentWidth : root.width - units.gu(2);

       Rectangle {
            id: conteiner
            width: root.width - units.gu(1);
            height: imageZoomDialog.height - units.gu(1);
            border.color: "black"

            Image {
                id: targetImage
                source: targetImagePath
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectCrop
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                   PopupUtils.close(imageZoomDialog)
                }
            }
       }
   }
