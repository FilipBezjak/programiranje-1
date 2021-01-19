from functools import lru_cache

test_matrix = [[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0], [2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0], [2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0], [2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],[2, 4, 1, 1,2,4,5,6], [3, 2, 0, 5,4,5,6,7], [8, 0, 7, 2,7,8,9,0],]
test = [[2, 4], [0, 5]]

def alg(sadovnjak, n):
    dimx= len(sadovnjak[0]) - 1
    dimy = len(sadovnjak) - 1
    
    @lru_cache(maxsize=None)
    def lisicka(x, y, i):
        if x > dimx:
            return lisicka(0, y + 1, i)
        elif y > dimy:
            return 0
        elif i>=n:
            return 0
        else:
            return sadovnjak[y][x] + max(
                    lisicka(x + 1, y, i + 1),
                    lisicka(0, y + 1, i + 1))
    return lisicka(0,0,0)


print(alg(test_matrix, 100000))

























# def max_points(matrix, max_steps):

#     @lru_cache(maxsize=None)
#     def jumper(r, c, k):
#         val = matrix[r][c]
#         # No more steps
#         if (k == 0):
#             return 0
#         # Hit boundaries
#         elif (r == len(matrix) - 1):
#             # Can't go down
#             if (c == len(matrix[r]) - 1):
#                 # Can't go right
#                 return val
#             else:
#                 # Can go right
#                 return val + jumper(r, c+1, k-1)
#         else:
#             # Can go down
#             if (c == len(matrix[r]) - 1):
#                 # Can't go right
#                 return val + jumper(r+1, 0, k-1)
#             else:
#                 # Can go right
#                 return val + max(jumper(r, c+1, k-1), jumper(r+1, 0, k-1))

#     # Call function
#     return jumper(0, 0, max_steps)


# print(max_points(test_matrix,9))