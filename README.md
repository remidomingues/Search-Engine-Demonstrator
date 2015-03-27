# Search-Engine-Demonstrator

Implementation of a search engine, indexing PDF and text files to process queries. The index can be stored on disk to speed up the initialization.

Queries
---------------
- Unigram (OR)
- Bigram (OR)
- Multiword (AND operator)
- Phrase

Ranking
---------------
- TF-IDF (Relevance feedback)
- Weighted TF-IDF and PageRank
- PageRank
    - Power iterations (default, highest accuracy)
    - MC end-point with random start
    - MC end-point with cyclic start
    - MC complete path
    - MC complete path stopping at dangling nodes
    - MC complete path with random start (recommended)
