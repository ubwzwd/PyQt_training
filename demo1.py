import sys
import mysql.connector
from PyQt5.QtWidgets import QWidget, QLabel, QPushButton, QVBoxLayout, QLineEdit, QApplication, QHBoxLayout

class Example(QWidget):
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

        self.text = QLineEdit('please input the book id', self)
        self.text.selectAll()
        self.text.setFocus()
        
        

        self.bt1 = QPushButton('OK',self)
        self.bt1.clicked.connect(self.buttonClicked)

        self.ql = QLabel()
        self.ql.setText('None')

        self.vbox = QVBoxLayout()
        self.vbox.addStretch(1)
        self.vbox.addWidget(self.text)
        self.vbox.addStretch(1)
        self.vbox.addWidget(self.ql)
        self.vbox.addStretch(1)
        self.vbox.addWidget(self.bt1)
        # self.vbox.addStretch(1)

        self.hbox = QHBoxLayout()
        self.hbox.addStretch(0.1)
        self.hbox.addLayout(self.vbox)
        self.hbox.addStretch(0.1)

        self.setLayout(self.hbox)


        self.show()

    def buttonClicked(self):
        res = self.select_id(self.text.text())
        self.ql.setText(res[0][0])
        self.show()

    def select_id(self, id):
        table = "lotr_book"
        sql = "select title from " + table + " where book_id = " + id
        self.cursor = self.conx.cursor()
        self.cursor.execute(sql)
        result = self.cursor.fetchall()
        return result

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())