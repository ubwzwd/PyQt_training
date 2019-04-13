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
        self.setGeometry(300,300,800,400)
        self.setWindowTitle('NBA enquiry')

        self.tab1 = QTabWidget()
        # self.tab2 = QWidget()
        # self.tab3 = QWidget()
        # self.tab4 = QWidget()

        self.tab1UI()

        self.addTab(self.tab1, "Read")
        

    def tab1UI(self):
        self.tab11 = QWidget()
        self.text11 = QLabel('input here:')
        self.input_text11 = QLineEdit()
        self.input_text11.selectAll()
        self.input_text11.setFocus()
        self.bt11 = QPushButton('OK', self)
        self.table11 = QTableWidget(2,8)
        for i in range(0,8):
            self.table11.setColumnWidth(i,100)
        
        grid1 = QGridLayout()
        grid1.addWidget(self.text11, 0,2,1,1)
        grid1.addWidget(self.input_text11, 1,3,1,2)
        grid1.addWidget(self.bt11,2,3,1,2)
        grid1.addWidget(self.table11, 3,0,2,8)
        grid1.setSpacing(10)
        self.tab11.setLayout(grid1)

        # vbox1 = QVBoxLayout()
        # vbox1.addWidget(self.input_text11)
        # vbox1.addWidget(self.bt11)
        # vbox1.addWidget(self.table11)
        # self.tab11.setLayout(vbox1)

        self.tab1.addTab(self.tab11, 'Team')
        

        

        

    
    # def tab2UI(self):
        

    # def tab3UI(self):
        

    # def tab4UI(self):
        

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = mainUI()
    ex.show()
    app.exit(app.exec_())
