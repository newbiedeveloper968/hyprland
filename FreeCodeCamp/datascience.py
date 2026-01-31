import numpy as np

# a = np.array([1,2,3,4,5])
# 
# a1 = np.array([
#     [1,2,3],
#     [4,5,6],
#     ])
# 
# a2 = np.array([
#     [
#         [1,2,3],
#         [4,5,6]
#     ],
# 
#     [
#         [1,2,3],
#         [4,5,6]
#     ]
# ])
# 
# print("a.ndim =", a.ndim)
# print("a.shape =", a.shape[0])
# 
# print("\n")
# 
# print("a1.ndim =", a1.ndim)
# print("a1.shape =", a1.shape)
# 
# print("\n")
# 
# sum = np.sum(a2, axis = 0)
# print(sum)
# sum = np.sum(a2, axis = 1)
# print(sum)
# sum = np.sum(a2, axis = 2)
# print(sum)
# print("a2.ndim =", a2.ndim)
# print("a2.shape =", a2.shape[2])

# A = np.arange(10)
# print(A)
# 
# A_randomized = np.random.permutation(np.arange(10))
# print(A_randomized)

# A = np.arange(9)
# print(A)
# 
# B = A.reshape(3,1,3)
# print(B)

# A = np.random.rand(3,3)
# print(A)
# B = np.random.randn(2,5)
# print(B)
# zeros = np.zeros((2,2), dtype=np.int32)
# print(zeros)
# ones = np.ones((2,2), dtype=np.int32)
# print(ones)

# A = np.arange(100)
# b = A[3:10]
# b[0] = -1200
# print(b)
# 
# b = A[3:10].copy()
# b[0] = 14
# print(b)


# A = np.arange(100)
# b = A[3:10]
# b[0] = -1200
# print(A)

# A = np.array([
#     [
#         [1,2,3],
#         [4,5,6]
#     ],
# 
#     [   # Block 1
#         [7,8,9], # Row 0, Column 2
#         [10,11,12]
#     ]
# ])
# print(A)

# block_idx, row_idx, col_idx = np.argwhere(A == 9)[0]
# print(idx)
# print(idx.ndim)

# print(block_idx)
# print(row_idx)
# print(col_idx)

# A[block_idx][row_idx][col_idx] = 69
# print(A)

# A = np.round(10*np.random.rand(2,3))
# print(A)
# B = np.array([2,3,4])
# A = A+B
# print(A)

# a = np.array([1,2,3])
# b = np.array([4,5,6])
# print(np.hstack((a,b)))
# 
# a = np.array([
#     [1],
#     [2],
#     [3]
#     ])
# b = np.array([
#     [4],
#     [5],
#     [6]
#     ])
# print(np.hstack((a,b)))
