from functools import lru_cache

        # n je st. skokov, energija je energija, 
#        ki jo ma zaba preden poje muho. Mocvara pa je samo od trenutnega
#  mesta naprej
def zabica(mocvara):
    @lru_cache(maxsize=None)
    def zaba(i, energija): 
        if i + energija > len(mocvara):
            return 0
        else:
            energija += mocvara[i]
            return 1 + min([zaba(i+j , energija - j) for j in range(1,energija)])
    return zaba(0, mocvara[0])

print(zabica([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,10, 10, 10, 10, 10, 10,]))
