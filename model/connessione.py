from dataclasses import dataclass

@dataclass
class Connessione:
    id : int
    id_rifugio1 : int
    id_rifugio2 : int
    distanza : float
    difficolta : str
    durata : str
    anno : int

    def fattore_difficolta(self) -> float:
        if self.difficolta == 'facile':
            return 1.0
        elif self.difficolta == 'media':
            return 1.5
        elif self.difficolta == 'difficile':
            return 2.0


    def __eq__(self, other):
        return isinstance(other, Connessione) and self.id == other.id

    def __hash__(self):
        return hash(self.id)

    def __str__(self):
        return f"Connessione {self.id}: {self.id_rifugio1} - {self.id_rifugio2}"

    def __repr__(self):
        return f"Connessione {self.id}: {self.id_rifugio1} - {self.id_rifugio2}"