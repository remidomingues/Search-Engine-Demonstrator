import matplotlib.pyplot as plt

# university rowing team
words1 = [1, 2, 3]
time1 = [3039700, 1968621, 1115864]
results1 = [2417, 215, 5]

# old historic monument in Davis
words2 = [1, 2, 3, 4]
time2 = [20393893, 17334132, 11092855, 2348351]
results2 = [13272, 9405, 1705, 1]

plt.axis([1, 4, 0, max([max(time1), max(time2)])*1.1 ])
plt.xlabel('Query words required in each document (or more)')
plt.ylabel('Query time (nanoseconds)')
plt.plot(words1, time1, label="university rowing team")
plt.plot(words2, time2, label="old historic monument in Davis")
plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc=3,
           ncol=2, mode="expand", borderaxespad=0.)
plt.title("Query time for N words required per document")
plt.show()

plt.axis([1, 4, 0, max([max(results1), max(results2)])*1.1 ])
plt.xlabel('Query words required in each document (or more)')
plt.ylabel('Retrieved documents')
plt.plot(words1, results1, label="university rowing team")
plt.plot(words2, results2, label="old historic monument in Davis")
plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc=3,
           ncol=2, mode="expand", borderaxespad=0.)
plt.title("Number of retrieved document per word requirement")
plt.show()
