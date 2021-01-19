from functools import lru_cache

zabojniki = [1, 3, 4, 7, 10]

def ladja(nosilnost, zabojniki):
    @lru_cache(maxsize=None)
    def tovor(trenutna, zadnja):
        if trenutna < 0:
            return 0
        elif trenutna==0:
            return 1
        else:
            sez = [tovor(trenutna - i, i) for i in zabojniki if i <= zadnja]
            return sum(sez)
    return tovor(nosilnost,float("inf"))

print(ladja(300, zabojniki))