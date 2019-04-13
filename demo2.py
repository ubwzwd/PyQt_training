import sys
import mysql.connector
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
class mainUI(QTabWidget):
    def __init__(self):
        super().__init__()
        config = {
        'host':'localhost',
        'port':3306,
        'database':'lotrfinalzhengw',
        'user':'root',
        'password':'gaw3y9',
        'charset':'utf8',
        'use_unicode':True,
        'get_warnings':True,
        }
        self.conx = mysql.connector.connect(**config)
        self.initUI()

    def initUI(self):
        self.setGeometry(300,300,400,100)
        self.setWindowTitle('NBA enquiry')

        self.tab1 = QWidget()
        # self.tab2 = QWidget()
        # self.tab3 = QWidget()
        # self.tab4 = QWidget()

        self.tab1UI()

        self.addTab(self.tab1, "Tab 1")
        

    def tab1UI(self):
        self.text1 = QLabel('Please inpute a name of team, player or coach')
        self.input_text1 = QTextEdit('input here')
        self.input_text1.selectAll()
        self.input_text1.setFocus()
        self.bt1 = QPushButton('OK', self)

        vbox = QVBoxLayout()
        vbox.addWidget(self.text1)
        vbox.addWidget(self.input_text1)
        vbox.addWidget(self.bt1)

        self.tab1.setLayout(vbox)

    
    # def tab2UI(self):
        

    # def tab3UI(self):
        

    # def tab4UI(self):
        

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = mainUI()
    ex.show()
    app.exit(app.exec_())
