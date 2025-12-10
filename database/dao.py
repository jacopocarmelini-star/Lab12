from database.DB_connect import DBConnect
from model.connessione import Connessione
from model.rifugio import Rifugio


class DAO:
    """
    Implementare tutte le funzioni necessarie a interrogare il database.
    """
    # TODO

    @staticmethod
    def get_rifugio():
        conn = DBConnect.get_connection()
        result = []
        cursor = conn.cursor(dictionary=True)
        query = """SELECT * FROM rifugio"""
        cursor.execute(query)
        for row in cursor:
            result.append(Rifugio(**row))
        cursor.close()
        conn.close()
        return result

    @staticmethod
    def get_connessione():
        conn = DBConnect.get_connection()
        result = []
        cursor = conn.cursor(dictionary=True)
        query = """SELECT * 
                    FROM connessione"""
        cursor.execute(query)
        for row in cursor:
            result.append(Connessione(**row))
        cursor.close()
        conn.close()
        return result

