def najdaljse_narascajoce_podzaporedje(l):
    def podzaporedje(i, zadnji):
        if i >= len(l):
            return []
        if l[i] >= zadnji:
            vzamemo = [l[i]] + podzaporedje(i+1, l[i])
            ne_vzamemo = podzaporedje(i+1, zadnji)
            if len(vzamemo) >= len(ne_vzamemo):
                return vzamemo
        else:
            return podzaporedje(i+1, zadnji)
    return podzaporedje(0, -10)


najdaljse_narascajoce_podzaporedje([2, 3, 6, 8, 4, 4, 6, 7, 12, 8, 9])