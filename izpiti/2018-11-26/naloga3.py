from functools import lru_cache

def f(k,n):
    @lru_cache(maxsize=None)
    def g(prvi,k,n, j): #k je razmak, j je st elementov
        if j == n:
            return 1
        else:
            stevila = [i for i in range(prvi - k,prvi + 1+ k) if i >= 0]
            return sum([g(i,k,n, j+1) for i in stevila])
    return g(0,k,n,1)

print(f(2, 5))



