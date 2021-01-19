from functools import lru_cache

def finska(mesta):
    def finska2(i, denar):
        if denar >= 0 and i >= len(mesta):
            return [5]
        elif denar < 0 and i >= len(mesta):
            return None
        else:
            poti = [finska2(ind, denar + cena) for (ind, cena) in mesta[i] if finska2(ind, denar+cena)]
            if poti == []: 
                return None
            else:
                return [i] + min(poti, key= lambda z: len(z))
    return finska2(0,0)


mesta = [
    [(1, 10), (3, -10)],
    [(2, 10), (5, -20)],
    [(3, -10)],
    [(4, 15)],
    [(5, 0)],
    ]

print(finska(mesta))