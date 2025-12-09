import mysql.connector
from mysql.connector import errorcode
import pathlib

class DBConnect:
    """
    Classe utilizzata per creare e gestire un pool di connessioni al database.
    Implementa un metodo di classe che funge da factory per fornire connessioni
    prese in prestito dal pool.
    """

    # Manteniamo il pool di connessioni come attributo di classe, non di istanza
    _pool_connessioni = None

    def __init__(self):
        raise RuntimeError("Non creare un'istanza, usa il metodo di classe ottieni_connessione()!")

    @classmethod
    def get_connection(cls, nome_pool="mio_pool", dimensione_pool=3) -> mysql.connector.pooling.PooledMySQLConnection | None:
        """
        Metodo factory per ottenere una connessione dal pool.
        Inizializza il pool se non esiste ancora.

        :param nome_pool: nome del pool
        :param dimensione_pool: numero di connessioni nel pool
        :return: mysql.connector.connection oppure None in caso di errore di connessione
        """
        if cls._pool_connessioni is None:
            try:
                cls._pool_connessioni = mysql.connector.pooling.MySQLConnectionPool(
                    pool_name=nome_pool,
                    pool_size=dimensione_pool,
                    option_files=f"{pathlib.Path(__file__).resolve().parent}/connector.cnf"
                )
                return cls._pool_connessioni.get_connection()

            except mysql.connector.Error as err:
                if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                    print("Errore: nome utente o password non corretti.")
                    return None
                elif err.errno == errorcode.ER_BAD_DB_ERROR:
                    print("Errore: il database specificato non esiste.")
                    return None
                else:
                    print(f"Errore di connessione: {err}")
                    return None
        else:
            return cls._pool_connessioni.get_connection()
