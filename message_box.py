#!/usr/bin/python3

# coding = utf-8

import sys
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QMessageBox, QLineEdit
from PyQt5.QtGui import QIcon
from random import randint


class Example(QWidget):

    def __init__(self):
        # inheritance and polymorphism
        super().__init__()
        self.initUI()
        self.num = randint(1, 100)

    def initUI(self):

        self.setGeometry(400, 400, 800, 300)
        self.setWindowTitle('学点编程吧--猜数字')
        # self.setWindowIcon(QIcon('xdbcb8.ico'))

        # 设置猜数字的按钮，并配上悬浮提示，也就是当鼠标放到‘我猜’按钮上时显示
        self.bt1 = QPushButton('我猜', self)
        self.bt1.setGeometry(350, 200, 100, 30)
        # 这句就是悬浮提示
        self.bt1.setToolTip('点击这里猜数字')
        # 单击按钮调用showMessage方法
        self.bt1.clicked.connect(self.showMessage)

        # 创建一个输入窗
        self.text = QLineEdit('please input a number between 1 and 100', self)
        # 将默认字符全选
        self.text.selectAll()
        # 让焦点置于此文本栏
        self.text.setFocus()
        # 设置位置
        self.text.setGeometry(200, 70, 400, 30)

        self.show()

    def showMessage(self):
        
        # 读取输入
        guessnumber = int(self.text.text())
        print(self.num)    
    
        if guessnumber > self.num:
            QMessageBox.about(self, '看结果','     猜大了!     ')
            self.text.selectAll()
            self.text.setFocus()        
        elif guessnumber < self.num:
            QMessageBox.about(self, '看结果','     猜小了!     ')
            self.text.selectAll()
            self.text.setFocus()       
        else:
            QMessageBox.about(self, '看结果','答对了!进入下一轮!')
            self.num = randint(1,100)
            self.text.clear()
            self.text.setFocus()    
        
    def closeEvent(self, event):

        reply = QMessageBox.question(self, '确认', '确认退出吗', QMessageBox.Yes | QMessageBox.No, QMessageBox.No)
        if reply == QMessageBox.Yes:
            event.accept()        
        else:
            event.ignore()

if __name__ == '__main__':

    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
