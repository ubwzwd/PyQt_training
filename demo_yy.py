import sys
import MySQLdb
from PyQt5.QtWidgets import QWidget, QLabel, QPushButton, QVBoxLayout, QLineEdit, QApplication


class Example(QWidget):
    def __init__(self):
        super().__init__()
        self.con = MySQLdb.connect(host='localhost', user='root', passwd='3323390583Yy@@', db='lotrfinal')
        self.cursor = self.con.cursor()
        self.initUI()

    def initUI(self):
        lbl1 = QLabel('Please enter a book id')
        self.lbl2=QLabel(self)
        self.qle = QLineEdit(self)
        okButton = QPushButton("OK")
        okButton.clicked.connect(self.buttonClicked)

        vbox = QVBoxLayout()
        vbox.addStretch(1)
        vbox.addWidget(lbl1)
        vbox.addWidget(self.qle)
        vbox.addWidget(self.lbl2)
        vbox.addWidget(okButton)

        self.setLayout(vbox)
        self.setGeometry(300, 300, 300, 150)
        self.setWindowTitle('test 1.0')
        self.show()

    def buttonClicked(self):
        result = self.select_id(self.qle.text())
        self.lbl2.setText(result[0][0])

    def select_id(self, id):
        table = "lotr_book"
        sql = "select title from " + table + " where book_id = " + id
        self.cursor.execute(sql)
        result = self.cursor.fetchall()
        return result


if __name__ == '__test1.0__':
    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
    ex.cursor.close()
    ex.con.close()
