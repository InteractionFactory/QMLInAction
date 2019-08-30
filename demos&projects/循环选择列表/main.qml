import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id:mainWindow
    visible: true
    width: 450
    height: 200
    title: qsTr("Day Selection") // ���ڱ���
    color: "#161616"  // ���ڱ���

    // Map �����洢Ҫ��ʾ������
    property var daysMap: {
        0:qsTr("Sunday"),
        1:qsTr("Monday"),
        2:qsTr("Tuesday"),
        3:qsTr("Wednesday"),
        4:qsTr("Thursday"),
        5:qsTr("Friday"),
        6:qsTr("Saturday")
    }

    Tumbler {
          id: tumbler
          anchors.centerIn: parent
          width: parent.width
          model: [daysMap[0],daysMap[1],daysMap[2],daysMap[3],daysMap[4],daysMap[5],daysMap[6]]

          // ���� daysMap[tumbler.currentIndex]===modelData�����ж��Ƿ�Ϊ��ǰѡ�е�item
          delegate:Text {
                text: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "microsoft yahei"
                font.bold: daysMap[tumbler.currentIndex]===modelData ? true : false;
                font.pixelSize: daysMap[tumbler.currentIndex]===modelData ? 30 : 16
                color:daysMap[tumbler.currentIndex]===modelData ? "yellow" : "white"
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (tumbler.visibleItemCount / 2)
          }

          // ѡ��������¼�
          onCurrentIndexChanged: {
              if(tumbler.currentIndex >= 0){
                  mainWindow.title = qsTr("Day Selection : current selected is ") + daysMap[tumbler.currentIndex]
              }
          }

          // ѡ�е�item�еı���
          Rectangle {
              anchors.horizontalCenter: tumbler.horizontalCenter
              y: tumbler.height * 0.4
              width: tumbler.width
              height: tumbler.height*0.2
              color: "#333333"
          }
    }
}
