from copy import deepcopy
import networkx as nx
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
        # creo grafo temporaneo ed elimino edges < della soglia
        grafo_temp = self.G.copy()
        edgesDaRimuovere = []
        for u,v, data in grafo_temp.edges(data=True):
            if data['weight'] <= soglia:
                edgesDaRimuovere.append((u,v))

        grafo_temp.remove_edges_from(edgesDaRimuovere)

        best_percorso = []
        costo_min = float('inf')

        for nodo_start in grafo_temp.nodes():
            distanze, percorsi = nx.single_source_dijkstra(grafo_temp, source=nodo_start, weight='weight')
            for nodo_end, costo in distanze.items(): # distanze è dizionario
                if len(percorsi[nodo_end])>=3:
                    if costo < costo_min:
                        costo_min = costo
                        best_percorso = percorsi[nodo_end]

        # formattazione
        result = []
        for i in range(len(best_percorso) - 1):
            u = best_percorso[i]
            v = best_percorso[i + 1]
            peso = grafo_temp[u][v]['weight']
            result.append((u, v, peso))

        return result

    def get_shortest_paths_ricorsione(self, soglia):
        self.best_percorso = []
        self.costo_min = float('inf')
        for nodo_start in self.G.nodes():
            parziale = [nodo_start]
            self._ricorsione(parziale, soglia, 0)

        result = []
        for i in range(len(self.best_percorso) - 1):
            u = self.best_percorso[i]
            v = self.best_percorso[i + 1]
            peso = self.G[u][v]['weight']
            result.append((u, v, peso))
        return result

    def _ricorsione(self, parziale, soglia, peso_attuale):
        if peso_attuale > self.costo_min:
            return
        if len(parziale) >=3:
            if peso_attuale < self.costo_min:
                self.costo_min = peso_attuale
                self.best_percorso = deepcopy(parziale)

        ultimo_nodo = parziale[-1]

        for vicino in self.G.neighbors(ultimo_nodo):
            if vicino not in parziale:
                peso_arco = self.G[ultimo_nodo][vicino]['weight']
                if peso_arco > soglia:
                    parziale.append(vicino)
                    self._ricorsione(parziale, soglia, peso_attuale + peso_arco)
                    parziale.pop()
