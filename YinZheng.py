# 导入MySQL驱动:
import mysql.connector
import flask

def main(config):
    #delete
    db = mysql.connector.connect(**config)
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    # SQL 插入语句
    number =int( input('Please input a player number: '))
    name = input('Please input a player name: ')
    team = input('Please input a team initial: ')
    age = int(input('Please input a player age: '))


    sql = "INSERT INTO player(player_number, \
           player_name, team_initial, age, game_played, game_start_up, minutes_played) \
           VALUES (%d, '%s', '%s', %d, %d ,%d, %d)" % \
          (number, name, team, age, 0, 0, 0)
    try:
        # 执行sql语句
        cursor.execute(sql)
        # 提交到数据库执行
        db.commit()
    except:
        # 发生错误时回滚
        db.rollback()

    # 关闭数据库连接
    db.close()

    #insert
    db = mysql.connector.connect(**config)
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    
    name = input('Please input a deleting player: ')
    sql = "DELETE FROM PLAYER WHERE PLAYER_NAME = '%s'" % (name)
    
    try:
        # 执行sql语句
        cursor.execute(sql)
        # 提交到数据库执行
        db.commit()
    except:
        # 发生错误时回滚
        db.rollback()

    # 关闭数据库连接
    db.close()

    # update
    db = mysql.connector.connect(**config)

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()

    winning=input('Please input a winning team: ').capitalize()
    losing=input('Please input a winning team: ').capitalize()

    # SQL 更新语句
    sql = "UPDATE regular_season_current_state SET WIN=WIN+1, GAMES=GAMES+1 WHERE TEAM = '%s'" % (winning)
    sql = "UPDATE regular_season_current_state SET LOSE=LOSE+1, GAMES=GAMES+1 WHERE TEAM = '%s'" % (losing)
    try:
        # 执行SQL语句
        cursor.execute(sql)
        # 提交到数据库执行
        db.commit()
    except:
        # 发生错误时回滚
        db.rollback()

    # 关闭数据库连接
    db.close()


if __name__ == '__main__':
    # 7.1 prompt to get username and password
    #username = input('Please input username: ')
    #password = input('Please input password: ')
    config = {
        'host':'localhost',
        'port':3306,
        'database':'YinZheng',
        'user':'root',
        'password':'Yinyichen95',
        'charset':'utf8',
        'use_unicode':True,
        'get_warnings':True,
    }
    main(config)