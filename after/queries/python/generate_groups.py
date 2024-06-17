from collections import defaultdict
import re
from pathlib import Path

# copy text from https://docs.python.org/3/search.html?q=__
# and put into this file

SEARCH_PATH = Path(__file__).parent / "search.txt"

DUNDER_PAT = re.compile(r"((?:\w+\.)*\w+)")

IGNORE = ("__main__", "operator", "sys", "typing", "weakref")


def should_be_ignored(name: str) -> bool:
    for ig in IGNORE:
        if name.startswith(ig):
            return True
    return False


def get_dunders(text: str) -> list[str]:
    dunder_to_shortest = dict()
    for match in DUNDER_PAT.finditer(text):
        word = match.group(0)
        dund = word.rpartition(".")[2]
        if dund.startswith("__") and dund.endswith("__") and len(dund) > 4:
            shortest = dunder_to_shortest.get(dund)
            if shortest is None or len(shortest) > len(word):
                dunder_to_shortest[dund] = word

    return [k for k, v in dunder_to_shortest.items() if not should_be_ignored(v)]


def get_builtins(lst):
    return [it for it in lst if not it.startswith("__") or not it.endswith("__")]


def print_scm(lst):
    for dun in lst:
        print(f'"{dun}"', end=" ")
    print()


DIR_IDENTS = [
    "__annotations__",
    "__builtins__",
    "__doc__",
    "__loader__",
    "__name__",
    "__package__",
    "__spec__",
]  # from dir()
OBJ_IDENTS = dir(object())
OBJ_IDENTS = ["object." + it for it in OBJ_IDENTS]
BLTIN_IDENTS = dir(__builtins__)

text = SEARCH_PATH.read_text()
TO_ADD = DIR_IDENTS + OBJ_IDENTS + BLTIN_IDENTS
text += "".join("\n" + it for it in TO_ADD)
print("dunders")
print_scm(get_dunders(text))

print("builtins")
print_scm(get_builtins(BLTIN_IDENTS))

r"""
re.compile(r"\w+  \d*  [a-gdf]")
r"\w+  "
rf"\w+  {7 + 3} dfgd \d* [dfg]? {0}"

re.sub(r'def\s+([a-zA-Z_][a-zA-Z_0-9]*)\s*\(\s*\):',
       r'static PyObject*\npy_\1(void)\n{',
       'def myfunc():')

m = re.match(r"(?P<first_name> ([])+ \w+) (?P<last_name>\w+) (?P<fgh> 8*)", "Malcolm Reynolds")
# m.group('first_name')
# m.group('last_name')
"""
