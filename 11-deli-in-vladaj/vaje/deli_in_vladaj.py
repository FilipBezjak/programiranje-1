import random
# my_randoms = random.sample(range(50), 50)
# print(my_randoms)

###############################################################################
# Želimo definirati pivotiranje na mestu za tabelo [a]. Ker bi želeli
# pivotirati zgolj dele tabele, se omejimo na del tabele, ki se nahaja med
# indeksoma [start] in [end] (vključujoč oba robova).
#
# Primer: za [start = 1] in [end = 7] tabelo
#
#     [10, 4, 5, 15, 11, 2, 17, 0, 18]
#
# preuredimo v
#
#     [10, 0, 2, 4, 11, 5, 17, 15, 18]
#
# (Možnih je več različnih rešitev, pomembno je, da je element 4 pivot.)
#
# Sestavi funkcijo [pivot(a, start, end)], ki preuredi tabelo [a] tako, da bo
# element [ a[start] ] postal pivot za del tabele med indeksoma [start] in
# [end]. Funkcija naj vrne indeks, na katerem je po preurejanju pristal pivot.
# Funkcija naj deluje v času O(n), kjer je n dolžina tabele [a].
#
# Primer:
#
#     >>> a = [10, 4, 5, 15, 11, 2, 17, 0, 18]
#     >>> pivot(a, 1, 7)
#     3
#     >>> a
#     [10, 0, 2, 4, 11, 5, 17, 15, 18]
###############################################################################



def pivot(a, start, end):
    p = a[start]
    left = start
    right = end
    
    while left < right:
        if a[left+1] <= p: # Move left inside
            left += 1
        elif p < a[right]: # Move right inside
            right -= 1
        else: # Swap
            a[left+1], a[right] = a[right], a[left+1]

    # Put pivot in the correct place
    a[start], a[left] = a[left], a[start]
    return left

# print(pivot(my_randoms, 1, 48))
# print(my_randoms)
# ###############################################################################
# V tabeli želimo poiskati vrednost k-tega elementa po velikosti.
#
# Primer: Če je
#
#     >>> a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
#
# potem je tretji element po velikosti enak 5, ker so od njega manši elementi
#  2, 3 in 4. Pri tem štejemo indekse od 0 naprej, torej je "ničti" element 2.
#
# Sestavite funkcijo [kth_element(a, k)], ki v tabeli [a] poišče [k]-ti element
# po velikosti. Funkcija sme spremeniti tabelo [a]. Cilj naloge je, da jo
# rešite brez da v celoti uredite tabelo [a].
###############################################################################

a = [10, 4, 15, 5, 11, 3, 17, 2, 18]

# poiscemo element, ki bi dal k pri pivotiranju s pivot, ce bi bil na zacetku 
#tabele
def kth_element(a, k):
    if k > len(a) - 1:
        return None
    else:
        return delni(a,k,0,len(a)-1)

def delni(a, k, start, end):
    p = pivot(a, start, end)
    if p == k:
        return a[k]
    elif p > k:
        return delni(a, k, start, p - 1)
    else:
        return delni(a, k, p + 1, end)
        

# print(kth_element([5, 10, 4, 15, 11, 3, 17, 2, 18],3))
# print(pivot(a,0,8))
# print(a)

###############################################################################
# Tabelo a želimo urediti z algoritmom hitrega urejanja (quicksort).
#
# Napišite funkcijo [quicksort(a)], ki uredi tabelo [a] s pomočjo pivotiranja.
# Poskrbi, da algoritem deluje 'na mestu', torej ne uporablja novih tabel.
#
# Namig: Definirajte pomožno funkcijo [quicksort_part(a, start, end)], ki
#        uredi zgolj del tabele [a].
#
#     >>> a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
#     >>> quicksort(a)
#     >>> a
#     [2, 3, 4, 5, 10, 11, 15, 17, 18]
###############################################################################

def quicksort_part(a,start,end):
    if start >= end:
        return a
    else:
        i = pivot(a, start, end)
        quicksort_part(a, start, i-1)
        quicksort_part(a, i + 1, end)
    
    
def quicksort(a):
    l= len(a) -1
    quicksort_part(a,0,l)
    
# quicksort(my_randoms)
# print(my_randoms)

###############################################################################
# Če imamo dve urejeni tabeli, potem urejeno združeno tabelo dobimo tako, da
# urejeni tabeli zlijemo. Pri zlivanju vsakič vzamemo manjšega od začetnih
# elementov obeh tabel. Zaradi učinkovitosti ne ustvarjamo nove tabele, ampak
# rezultat zapisujemo v že pripravljeno tabelo (ustrezne dolžine).
#
# Funkcija naj deluje v času O(n), kjer je n dolžina tarčne tabele.
#
# Sestavite funkcijo [merge(target, list_1, list_2)], ki v tabelo [target]
# zlije tabeli [list_1] in [list_2]. V primeru, da sta elementa v obeh tabelah
# enaka, naj bo prvi element iz prve tabele.
#
# Primer:
#
#     >>> list_1 = [1, 3, 5, 7, 10]
#     >>> list_2 = [1, 2, 3, 4, 5, 6, 7]
#     >>> target = [-1 for _ in range(len(list_1) + len(list_2))]
#     >>> merge(target, list_1, list_2)
#     >>> target
#     [1, 1, 2, 3, 3, 4, 5, 5, 6, 7, 7, 10]
#
###############################################################################
 #target je ze ustrrezne dolzine
def merge(target, list_1, list_2):
    pr=0
    dr=0
    for i in range(len(list_1) + len(list_2)):
        if len(list_2) <= dr or (len(list_1) > pr   and list_1[pr] <= list_2[dr]):
            target[i] = list_1[pr]
            pr += 1
        else:
            target[i] = list_2[dr]
            dr += 1


# list_1 = [1, 3, 5, 7, 10]
# list_2 = [1, 2, 3, 4, 5, 6, 7]
# target = [-1 for _ in range(len(list_1) + len(list_2))]
# merge(target, list_1, list_2)
# print(target)

###############################################################################
# Tabelo želimo urediti z zlivanjem (merge sort). Tabelo razdelimo na polovici,
# ju rekurzivno uredimo in nato zlijemo z uporabo funkcije [zlij].
#
# Namig: prazna tabela in tabela z enim samim elementom sta vedno urejeni.
#
# Napišite funkcijo [mergesort(a)], ki uredi tabelo [a] s pomočjo zlivanja. Za
# razliko od hitrega urejanja tu tabele lahko kopirate, zlivanje pa je potrebno
# narediti na mestu.
#
#     >>> a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
#     >>> mergesort(a)
#     >>> a
#     [2, 3, 4, 5, 10, 11, 15, 17, 18]
###############################################################################

def mergesort(a):
    l = len(a)
    if l == 1:
        pass
    else:
        a1, a2 = a[:l//2], a[l//2:]
        mergesort(a1)
        mergesort(a2)
        merge(a,a1,a2)
        
a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
mergesort(a)
print(a)