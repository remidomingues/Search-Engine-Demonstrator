import matplotlib.pyplot as plt

# university rowing team
words1 = [10, 50, 100, 1000]
time1 = [351739, 576591, 1417688, 3050431]
results1 = [5, 5, 216, 1722]

# old historic monument in Davis
words2 = [10, 50, 100, 1000]
time1 = [1919173, 2061922, 2414594, 3861204]
results2 = [1, 1, 403, 2679]

plt.axis([1, 4, 0, max([max(time1), max(time2)])*1.1 ])
plt.xlabel('Highest ranked documents stored')
plt.ylabel('Query time (nanoseconds)')
plt.plot(words1, time1, label="university rowing team")
plt.plot(words2, time2, label="old historic monument in Davis")
plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc=3,
           ncol=2, mode="expand", borderaxespad=0.)
plt.title("Query time for N highest ranked documents computed")
plt.show()

plt.axis([1, 4, 0, max([max(results1), max(results2)])*1.1 ])
plt.xlabel('Highest ranked documents stored')
plt.ylabel('Retrieved documents')
plt.plot(words1, results1, label="university rowing team")
plt.plot(words2, results2, label="old historic monument in Davis")
plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc=3,
           ncol=2, mode="expand", borderaxespad=0.)
plt.title("Number of retrieved document for N highest ranked documents computed")
plt.show()
