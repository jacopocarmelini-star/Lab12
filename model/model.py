import networkx as nx
from sympy.strategies import minimize

from database.dao import DAO


class Model:
    def __init__(self):
        """Definire le strutture dati utili"""
        # TODO
        self.G = nx.Graph()
        self._id_map = {}
        self._lista_rifugi = []


    def build_weighted_graph(self, year: int):
        """
        Costruisce il grafo pesato dei rifugi considerando solo le connessioni con campo `anno` <= year passato
        come argomento.
        Il peso del grafo è dato dal prodotto "distanza * fattore_difficolta"
        """
        # TODO
        self.G.clear()
        self._id_map.clear()
        self._lista_rifugi.clear()

        self._lista_rifugi = DAO.get_rifugio()
        for rifugio in self._lista_rifugi:
            self._id_map[rifugio.id] = rifugio

        connessioni = DAO.get_connessione()
        for c in connessioni:
            if c.anno <= year:
                if c.id_rifugio1 in self._id_map and c.id_rifugio2 in self._id_map:
                    r1 = self._id_map[c.id_rifugio1]
                    r2 = self._id_map[c.id_rifugio2]
                    peso = float(c.distanza) * c.fattore_difficolta()

                    self.G.add_edge(r1, r2, weight=peso)

    def get_edges_weight_min_max(self):
        """
        Restituisce min e max peso degli archi nel grafo
        :return: il peso minimo degli archi nel grafo
        :return: il peso massimo degli archi nel grafo
        """
        # TODO
        pesi =[]
        for sentiero in self.G.edges(data=True):
            pesi.append(sentiero[2]["weight"])
        return min(pesi), max(pesi)


    def count_edges_by_threshold(self, soglia):
        """
        Conta il numero di archi con peso < soglia e > soglia
        :param soglia: soglia da considerare nel conteggio degli archi
        :return minori: archi con peso < soglia
        :return maggiori: archi con peso > soglia
        """
        # TODO
        # controllo correttezza soglia nel controller

        minori = []
        maggiori = []

        for sentiero in self.G.edges(data=True):
            if sentiero[2]["weight"] < soglia:
                minori.append(sentiero)
            elif sentiero[2]["weight"] > soglia:
                maggiori.append(sentiero)

        return len(minori), len(maggiori)

    """Implementare la parte di ricerca del cammino minimo"""
    # TODO
    def get_shortest_path(self, soglia):
        floyd_warshall_predecessor_and_distance(G, weight='weight')

