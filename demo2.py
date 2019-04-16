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
        'database':'yinzheng',
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
        self.tab2 = QWidget()
        self.tab3 = QWidget()
        self.tab4 = QWidget()

        self.tab1UI()
        self.tab2UI()
        self.tab3UI()
        self.tab4UI()

        self.addTab(self.tab1, "Read")
        self.addTab(self.tab2, "Insert")
        self.addTab(self.tab3, "Delete")
        self.addTab(self.tab4, "Update")
        

    def tab1UI(self):
        ###################### set tab 1-1
        self.tab11 = QWidget()

        self.text11 = QLabel('please input a team')

        self.input_text11 = QLineEdit()
        self.input_text11.selectAll()
        self.input_text11.setFocus()

        self.bt11 = QPushButton('OK', self)
        self.bt11.clicked.connect(self.readTeam)

        self.table11 = QTableWidget(1,5)
        self.table11.setHorizontalHeaderLabels(['current name', 'name initial', 'win', 'lose', 'conference'])
        for i in range(0,5):
            self.table11.setColumnWidth(i,100)
        
        grid11 = QGridLayout()
        grid11.addWidget(self.text11, 0,1,1,1)
        grid11.addWidget(self.input_text11, 0,2,1,2)
        grid11.addWidget(self.bt11,1,2,1,2)
        grid11.addWidget(self.table11, 2,0,2,5)
        grid11.setSpacing(10)
        self.tab11.setLayout(grid11)

        # vbox1 = QVBoxLayout()
        # vbox1.addWidget(self.input_text11)
        # vbox1.addWidget(self.bt11)
        # vbox1.addWidget(self.table11)
        # self.tab11.setLayout(vbox1)

        self.tab1.addTab(self.tab11, 'Team')

        ####################### set tab 1-2
        self.tab12 = QWidget()

        self.text12 = QLabel('please input a player')

        self.input_text12 = QLineEdit()
        self.input_text12.selectAll()
        self.input_text12.setFocus()

        self.bt12 = QPushButton('OK', self)
        self.bt12.clicked.connect(self.readPlayer)

        self.table12 = QTableWidget(3,7)
        self.table12.setHorizontalHeaderLabels(['player name', 'player number', 'team', 'age', 'game played', 'game start up', 'minutes played', 'FG'])
        for i in range(0,8):
            self.table12.setColumnWidth(i,100)

        grid12 = QGridLayout()
        grid12.addWidget(self.text12, 0,2,1,1)
        grid12.addWidget(self.input_text12, 0,3,1,2)
        grid12.addWidget(self.bt12, 1,3,1,2)
        grid12.addWidget(self.table12, 2,0,3,8)
        self.tab12.setLayout(grid12)

        self.tab1.addTab(self.tab12, 'Player')

        ################ set tab 1-3
        # self.tab13 = QWidget()

        # self.text13 = QLabel('please input a coach')
        
        # self.input_text13 = QLineEdit()
        # self.input_text13.selectAll()
        # self.input_text13.setFocus()

        # self.bt13 = QPushButton('OK', self)
        # # self.bt13.clicked.connect(self.readCoach)

        # self.table13 = QTableWidget()

    def tab2UI(self):
        ########### set tab 2, for insert pkayer

        self.text21 = QLabel('please fill in the attributes of player:')

        self.text22 = QLabel('player name:')
        self.input_text22 = QLineEdit()
        self.text23 = QLabel('player number:')
        self.input_text23 = QLineEdit()
        self.text24 = QLabel('team initial:')
        self.input_text24 = QLineEdit()
        self.text25 = QLabel('age:')
        self.input_text25 = QLineEdit()

        self.bt21 = QPushButton('Submit', self)
        self.bt21.clicked.connect(self.addPlayer)

        grid2 = QGridLayout()
        grid2.addWidget(self.text21, 0,0,1,2)
        grid2.addWidget(self.text22, 1,0,1,2)
        grid2.addWidget(self.input_text22, 1,2,1,2)
        grid2.addWidget(self.text23, 2,0,1,2)
        grid2.addWidget(self.input_text23, 2,2,1,2)
        grid2.addWidget(self.text24, 3,0,1,2)
        grid2.addWidget(self.input_text24, 3,2,1,2)
        grid2.addWidget(self.text25, 4,0,1,2)
        grid2.addWidget(self.input_text25, 4,2,1,2)
        grid2.addWidget(self.bt21, 8,1,1,2)

        vbox = QVBoxLayout()
        vbox.addLayout(grid2)
        vbox.addStretch(1)

        self.tab2.setLayout(vbox)

    def tab3UI(self):
        self.text31 = QLabel("please enter the player you want to delete:")

        self.input_text31 = QLineEdit()
        
        self.bt31 = QPushButton("OK", self)
        self.bt31.clicked.connect(self.deletePlayer)


        grid = QGridLayout()
        grid.addWidget(QLabel(" "), 0,0,1,1)
        grid.addWidget(self.text31, 0,1,1,1)
        grid.addWidget(QLabel(" "),0,2,1,2)
        grid.addWidget(self.input_text31, 1,1,1,2)
        grid.addWidget(self.bt31, 2,1,1,2)

        vbox = QVBoxLayout()
        vbox.addLayout(grid)
        vbox.addStretch(1)

        self.tab3.setLayout(vbox)
    
    def tab4UI(self):
        self.text41 = QLabel("please enter the winner and loser of this game:")

        self.text42 = QLabel("winner(team initial):")
        self.input_text42 = QLineEdit()
        self.input_text42.setFocus()
        
        self.text43 = QLabel("loser(team initial):")
        self.input_text43 = QLineEdit()

        self.bt41 = QPushButton("OK", self)
        self.bt41.clicked.connect(self.updateTeam)

        grid = QGridLayout()
        grid.addWidget(QLabel(" "), 0,0,1,2)
        grid.addWidget(self.text41, 0,2,1,2)
        grid.addWidget(QLabel(" "), 0,3,1,2)
        grid.addWidget(self.text42, 1,2,1,1)
        grid.addWidget(self.input_text42, 1,3,1,1)
        grid.addWidget(self.text43, 2,2,1,1)
        grid.addWidget(self.input_text43, 2,3,1,1)
        grid.addWidget(self.bt41, 3,2,1,2)

        grid.setSpacing(10)

        vbox = QVBoxLayout()
        vbox.addLayout(grid)
        vbox.addStretch(1)

        self.tab4.setLayout(vbox)



    def readTeam(self):
        team = self.input_text11.text()
        team_str = "select * from team where current_name = '%s'"%team
        cursor = self.conx.cursor()
        cursor.execute(team_str)
        temp_res = cursor.fetchall()
        team_profile = []
        for i in temp_res:
            for j in i:
                team_profile.append(j)
        cursor.close()
        # cursor2 = self.conx.cursor()
        # cursor2.execute('select current_name from team')
        # team_list = cursor2.fetchall()
        cursor.close()
        if team_profile:            
            self.table11.setItem(0,0,QTableWidgetItem(team_profile[0]))
            self.table11.setItem(0,1,QTableWidgetItem(team_profile[1]))
            self.table11.setItem(0,2,QTableWidgetItem(team_profile[2]))
            self.table11.setItem(0,3,QTableWidgetItem(team_profile[3]))
            self.table11.setItem(0,4,QTableWidgetItem(team_profile[4]))
        self.input_text11.clear()

    def readPlayer(self):
        player = self.input_text12.text()
        player_str = "select * from player where player_name = '%s'"%player
        cursor = self.conx.cursor()
        cursor.execute(player_str)
        temp_res = cursor.fetchall()
        player_profile = []
        for i in temp_res:
            for j in i:
                player_profile.append(j)
        cursor.close()
        # cursor2 = self.conx.cursor()
        # cursor2.execute('select player_name from player')
        # player_list = cursor2.fetchall()
        # cursor2.close()
        if player_profile:
            self.table12.setItem(0,0,QTableWidgetItem(player_profile[2]))
            self.table12.setItem(0,1,QTableWidgetItem(str(player_profile[1])))
            self.table12.setItem(0,2,QTableWidgetItem(player_profile[3]))
            self.table12.setItem(0,3,QTableWidgetItem(str(player_profile[4])))
            self.table12.setItem(0,4,QTableWidgetItem(str(player_profile[5])))
            self.table12.setItem(0,5,QTableWidgetItem(str(player_profile[6])))
            self.table12.setItem(0,6,QTableWidgetItem(str(player_profile[7])))
        self.input_text12.clear()

    def addPlayer(self):
        name = self.input_text22.text()
        number = self.input_text23.text()
        team = self.input_text24.text()
        age = self.input_text25.text()

        add_player_sql = "INSERT INTO player(player_number, player_name, team_initial, age, game_played,game_start_up, minutes_played, FG) VALUES (%d, '%s', '%s', %d, %d ,%d, %d)" % (int(number), name, team, int(age), 0, 0 , 0)
        # add_player_sql = "INSERT INTO player("+number+", '"+name+"', '"+team+"', "+age+", 0, 0, 0, 0)" 
        # #    VALUES (%d, '%s', '%s', %d, %d ,%d, %d)" % \
        # #   (number, name, team, age, 0, 0, 0)
        cursor = self.conx.cursor()
        try:            
            cursor.execute(add_player_sql)
            self.conx.commit()
        except:
            self.conx.rollback()
        cursor.close()
        self.input_text22.clear()
        self.input_text23.clear()
        self.input_text24.clear()
        self.input_text25.clear()

    def deletePlayer(self):
        comfirm = QMessageBox.question(self, "Question", "Da you really want to delete this player?", QMessageBox.Yes|QMessageBox.No)

        if comfirm == QMessageBox.Yes:
            player = self.input_text31.text()
            cursor = self.conx.cursor()
            delete_player_sql = sql = "DELETE FROM PLAYER WHERE PLAYER_NAME = '%s'" % (player)
            try:
                cursor.execute(delete_player_sql)
                self.conx.commit()
            except:
                self.conx.rollback()
            cursor.close()
            self.input_text31.clear()

    def updateTeam(self):
        winner = self.input_text42.text()
        loser = self.input_text43.text()

        winner = winner.capitalize()
        loser = loser.capitalize()

        winner_sql = "UPDATE regular_season_current_state SET WIN=WIN+1, GAMES=GAMES+1 WHERE TEAM = '%s'" % (winner)
        loser_sql = "UPDATE regular_season_current_state SET LOSE=LOSE+1, GAMES=GAMES+1 WHERE TEAM = '%s'" % (loser)

        cursor1 = self.conx.cursor()
        try:
            cursor1.execute(winner_sql)
            self.conx.commit()
        except:
            self.conx.rollback()
        cursor1.close()

        cursor2 = self.conx.cursor()
        try:
            cursor2.execute(loser_sql)
            self.conx.commit()
        except:
            self.conx.rollback()
        cursor2.close()

        self.input_text42.clear()
        self.input_text43.clear()
        
    # def tab4UI(self):
        

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = mainUI()
    ex.show()
    app.exit(app.exec_())
