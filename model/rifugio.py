from dataclasses import dataclass


@dataclass
class Rifugio:
    id : int
    nome :str
    localita : str
    altitudine : int
    capienza : int
    aperto : int

    def __eq__(self, other):
        return isinstance(other, Rifugio) and self.id == other.id

    def __str__(self):
        return f"{self.nome} ({self.localita})"

    def __repr__(self):
        return f"{self.nome} ({self.localita})"

    def __hash__(self):
        return hash(self.id)