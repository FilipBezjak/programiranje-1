def simetricen(niz):
    if len(niz) <2:
        return True
    elif niz[0] == niz[-1]:
        return simetricen(niz[1:-1])
    else: return False
    
print(simetricen("0010100"))

def stevilo_delov(niz):
    def stevilo(niz)