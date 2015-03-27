import matplotlib.pyplot as plt

documents = [3, 10]
# UNIGRAMS
# zombie attack, money transfer, sleeping on campus
# BIGRAMS
# zombie attack, money transfer, sleeping on campus
query_type = ['Unigrams', 'Bigrams']
query = ['zombie attack', 'money transfer', 'sleeping on campus']
precision = [[2/3.0, 4/10.0],
    [0, 0],
    [0, 0],
    [2/3.0, 6/10.0],
    [0, 0],
    [0, 2/10.0]]

recall = [[2/20.0, 4/20.0],
    [0, 0],
    [0, 0],
    [2/20.0, 6/20.0],
    [0, 0],
    [0, 2/20.0]]

_type = 0
_query = 0

for count in xrange(0, 6):
    plt.axis([min(documents), max(documents), 0, max(max(precision[count]), max(recall[count]))])
    plt.xlabel('Retrieved documents')
    plt.ylabel('Measure')
    plt.plot(documents, precision[count], label="precision")
    plt.plot(documents, recall[count], label="recal")
    plt.legend()
    plt.title("{} - {} - Precision and recall curves".format(query_type[_type], query[_query]))
    plt.show()

    _query = (_query+1)%3
    if _query == 0:
        _type += 1
