import pandas as pd
import numpy as np
import nltk 
import nltk.corpus
text = "in brazil they drive on the right-hand side of the road.\
    brail has a large coastline on the eastern side of south america"
from nltk.tokenize import word_tokenize
token = word_tokenize(text)
token
token_ex = word_tokenize("i eat on apple,and apple was biten by me!")
token_ex
