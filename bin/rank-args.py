import sys
from difflib import SequenceMatcher

def similar(a, b):
  return SequenceMatcher(None, a, b).ratio()

source = sys.argv[1]

candidates = []
for command in sys.argv[2:]:
  ratio = similar(source, command);

  if ratio > .7:
    candidates.append({'command': command, 'ratio': ratio})

def sortRatio(entry):
  return entry['ratio']

candidates.sort(key = sortRatio, reverse = True)

if len(candidates) > 0:
  print(candidates[0]['command'])

