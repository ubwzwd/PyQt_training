import mysql.connector
import flask

def main(config):
    # 7.2 connect to database
    conx = mysql.connector.connect(**config)
    # 7.3 get a character name and store it
    character_name = input('Please input a character name: ').capitalize()
    # 7.4 data validation
    cursor = conx.cursor()
    cursor.execute('SELECT character_name FROM lotr_character')
    # get the list of characters
    characters_list = cursor.fetchall()
    # if not valide, input again
    while (character_name,) not in characters_list:
        print('The character does not exist. The characters are listed below: ')
        for i in characters_list:
            print(i)
        character_name = input('Please input again: ')
        character_name = character_name.capitalize()
    cursor.close()
    cursor2 = conx.cursor()
    cursor2.callproc('track_character', args = [character_name])
    for result in cursor2.stored_results():
        print(result.fetchall())
    cursor2.close()



if __name__ == '__main__':
    # 7.1 prompt to get username and password
    username = input('Please input username: ')
    password = input('Please input password: ')
    config = {
        'host':'localhost',
        'port':3306,
        'database':'lotrfinalzhengw',
        'user':username,
        'password':password,
        'charset':'utf8',
        'use_unicode':True,
        'get_warnings':True,
    }
    main(config)