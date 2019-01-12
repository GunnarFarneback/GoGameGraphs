# Go Game Graphs - a Family of Sparse Directed Graphs with Cycles

## Summary
The game of Go is normally played on a 19x19 board, and sometimes on
smaller quadratic boards. However, the board mechanics naturally
generalize to arbitrary undirected graphs. The attainable positions in
a game can be considered as the nodes of a new graph, and the moves as
directed edges between the positions. This induced graph is called the
game graph.

Thus every undirected graph induces a Go Game Graph. This repository
aims to explore this family of graphs for small board graphs. Of
particular interest is finding the longest simple path starting from
the empty position, which corresponds to the longest game of go that
can be played on the specific board graph.

Go Game Graphs are sparse directed graphs with an abundance of cycles.
They range from very small up to arbitrarily large sizes and could
be useful for testing various graph algorithms applicable to this kind
of graph.

This repository provides:
* Code in Julia and C to generate all Go Game Graphs induced from
Board Graphs with up to 12 nodes.
* A list of properties of all Go Game Graphs induced from Board Graphs
with up to 7 nodes, and a selection of larger ones.
* Sample maximum length paths.


### Table of Small Go Game Graphs

This table contains all unique Go Game Graphs (up to isomorphism)
induced from board graphs with up to 7 nodes, and a selection of
larger ones. More explanations follow after the table.

id | board graph | board nodes | board edges | game nodes | game edges | longest path
--- | ---------- | ----------- | ----------- | ---------- | ---------- | ------------
[1](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph1) | ![graph1](http://www.lysator.liu.se/~gunnar/graphs/graph1.svg) | 2 | 1 | 5 | 12 | [2](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1)
[3](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph3) | ![graph3](http://www.lysator.liu.se/~gunnar/graphs/graph3.svg) | 3 | 2 | 15 | 42 | [14](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3)
[7](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph7) | ![graph7](http://www.lysator.liu.se/~gunnar/graphs/graph7.svg) | 3 | 3 | 19 | 54 | [18](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7)
[11](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph11) | ![graph11](http://www.lysator.liu.se/~gunnar/graphs/graph11.svg) | 4 | 3 | 41 | 138 | [32](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path11)
[12](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph12) | ![graph12](http://www.lysator.liu.se/~gunnar/graphs/graph12.svg) | 4 | 2 | 25 | 120 | [24](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path12)
[13](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph13) | ![graph13](http://www.lysator.liu.se/~gunnar/graphs/graph13.svg) | 4 | 3 | 41 | 144 | [40](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path13)
[15](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph15) | ![graph15](http://www.lysator.liu.se/~gunnar/graphs/graph15.svg) | 4 | 4 | 49 | 166 | [42](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path15)
[30](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph30) | ![graph30](http://www.lysator.liu.se/~gunnar/graphs/graph30.svg) | 4 | 4 | 57 | 192 | [48](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path30)
[31](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph31) | ![graph31](http://www.lysator.liu.se/~gunnar/graphs/graph31.svg) | 4 | 5 | 61 | 204 | [50](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path31)
[63](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph63) | ![graph63](http://www.lysator.liu.se/~gunnar/graphs/graph63.svg) | 4 | 6 | 65 | 216 | [56](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path63)
75 | ![graph75](http://www.lysator.liu.se/~gunnar/graphs/graph75.svg) | 5 | 4 | 111 | 450 | [59](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path75)
76 | ![graph76](http://www.lysator.liu.se/~gunnar/graphs/graph76.svg) | 5 | 3 | 75 | 390 | [74](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path76)
77 | ![graph77](http://www.lysator.liu.se/~gunnar/graphs/graph77.svg) | 5 | 4 | 107 | 442 | [94](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path77)
79 | ![graph79](http://www.lysator.liu.se/~gunnar/graphs/graph79.svg) | 5 | 5 | 127 | 514 | [79](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path79)
86 | ![graph86](http://www.lysator.liu.se/~gunnar/graphs/graph86.svg) | 5 | 4 | 113 | 492 | [112](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path86)
87 | ![graph87](http://www.lysator.liu.se/~gunnar/graphs/graph87.svg) | 5 | 5 | 125 | 508 | [102](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path87)
94 | ![graph94](http://www.lysator.liu.se/~gunnar/graphs/graph94.svg) | 5 | 5 | 143 | 578 | [104](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path94)
95 | ![graph95](http://www.lysator.liu.se/~gunnar/graphs/graph95.svg) | 5 | 6 | 151 | 602 | [99](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path95)
116 | ![graph116](http://www.lysator.liu.se/~gunnar/graphs/graph116.svg) | 5 | 4 | 95 | 498 | [94](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path116)
117 | ![graph117](http://www.lysator.liu.se/~gunnar/graphs/graph117.svg) | 5 | 5 | 131 | 558 | [122](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path117)
119 | ![graph119](http://www.lysator.liu.se/~gunnar/graphs/graph119.svg) | 5 | 6 | 151 | 606 | [108](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path119)
127 | ![graph127](http://www.lysator.liu.se/~gunnar/graphs/graph127.svg) | 5 | 7 | 159 | 630 | [111](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path127)
222 | ![graph222](http://www.lysator.liu.se/~gunnar/graphs/graph222.svg) | 5 | 6 | 183 | 720 | [116](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path222)
223 | ![graph223](http://www.lysator.liu.se/~gunnar/graphs/graph223.svg) | 5 | 7 | 187 | 732 | [118](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path223)
235 | ![graph235](http://www.lysator.liu.se/~gunnar/graphs/graph235.svg) | 5 | 6 | 151 | 626 | [103](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path235)
236 | ![graph236](http://www.lysator.liu.se/~gunnar/graphs/graph236.svg) | 5 | 5 | 161 | 660 | [130](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path236)
237 | ![graph237](http://www.lysator.liu.se/~gunnar/graphs/graph237.svg) | 5 | 6 | 173 | 692 | [122](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path237)
239 | ![graph239](http://www.lysator.liu.se/~gunnar/graphs/graph239.svg) | 5 | 7 | 183 | 722 | [116](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path239)
254 | ![graph254](http://www.lysator.liu.se/~gunnar/graphs/graph254.svg) | 5 | 7 | 191 | 748 | [130](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path254)
255 | ![graph255](http://www.lysator.liu.se/~gunnar/graphs/graph255.svg) | 5 | 8 | 195 | 760 | [130](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path255)
507 | ![graph507](http://www.lysator.liu.se/~gunnar/graphs/graph507.svg) | 5 | 8 | 203 | 786 | [134](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path507)
511 | ![graph511](http://www.lysator.liu.se/~gunnar/graphs/graph511.svg) | 5 | 9 | 207 | 798 | [142](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path511)
1023 | ![graph1023](http://www.lysator.liu.se/~gunnar/graphs/graph1023.svg) | 5 | 10 | 211 | 810 | [150](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1023)
1099 | ![graph1099](http://www.lysator.liu.se/~gunnar/graphs/graph1099.svg) | 6 | 5 | 305 | 1466 | [94](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1099)
1100 | ![graph1100](http://www.lysator.liu.se/~gunnar/graphs/graph1100.svg) | 6 | 4 | 205 | 1182 | [204](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1100)
1101 | ![graph1101](http://www.lysator.liu.se/~gunnar/graphs/graph1101.svg) | 6 | 5 | 281 | 1356 | [171](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1101)
1103 | ![graph1103](http://www.lysator.liu.se/~gunnar/graphs/graph1103.svg) | 6 | 6 | 337 | 1610 | [130](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1103)
1108 | ![graph1108](http://www.lysator.liu.se/~gunnar/graphs/graph1108.svg) | 6 | 4 | 225 | 1260 | [224](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1108)
1109 | ![graph1109](http://www.lysator.liu.se/~gunnar/graphs/graph1109.svg) | 6 | 5 | 273 | 1308 | [192](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1109)
1110 | ![graph1110](http://www.lysator.liu.se/~gunnar/graphs/graph1110.svg) | 6 | 5 | 295 | 1476 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1110)
1111 | ![graph1111](http://www.lysator.liu.se/~gunnar/graphs/graph1111.svg) | 6 | 6 | 319 | 1514 | [207](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1111)
1118 | ![graph1118](http://www.lysator.liu.se/~gunnar/graphs/graph1118.svg) | 6 | 6 | 365 | 1732 | [189](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1118)
1119 | ![graph1119](http://www.lysator.liu.se/~gunnar/graphs/graph1119.svg) | 6 | 7 | 385 | 1810 | [171](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1119)
1140 | ![graph1140](http://www.lysator.liu.se/~gunnar/graphs/graph1140.svg) | 6 | 5 | 285 | 1608 | [284](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1140)
1141 | ![graph1141](http://www.lysator.liu.se/~gunnar/graphs/graph1141.svg) | 6 | 6 | 337 | 1660 | [279](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1141)
1143 | ![graph1143](http://www.lysator.liu.se/~gunnar/graphs/graph1143.svg) | 6 | 7 | 381 | 1796 | [197](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1143)
1151 | ![graph1151](http://www.lysator.liu.se/~gunnar/graphs/graph1151.svg) | 6 | 8 | 401 | 1874 | [192](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1151)
1182 | ![graph1182](http://www.lysator.liu.se/~gunnar/graphs/graph1182.svg) | 6 | 6 | 363 | 1732 | [248](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1182)
1183 | ![graph1183](http://www.lysator.liu.se/~gunnar/graphs/graph1183.svg) | 6 | 7 | 375 | 1752 | [219](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1183)
1184 | ![graph1184](http://www.lysator.liu.se/~gunnar/graphs/graph1184.svg) | 6 | 3 | 125 | 900 | [124](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1184)
1185 | ![graph1185](http://www.lysator.liu.se/~gunnar/graphs/graph1185.svg) | 6 | 4 | 205 | 1212 | [204](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1185)
1187 | ![graph1187](http://www.lysator.liu.se/~gunnar/graphs/graph1187.svg) | 6 | 5 | 283 | 1412 | [256](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1187)
1191 | ![graph1191](http://www.lysator.liu.se/~gunnar/graphs/graph1191.svg) | 6 | 6 | 311 | 1476 | [246](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1191)
1194 | ![graph1194](http://www.lysator.liu.se/~gunnar/graphs/graph1194.svg) | 6 | 5 | 245 | 1418 | [244](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1194)
1195 | ![graph1195](http://www.lysator.liu.se/~gunnar/graphs/graph1195.svg) | 6 | 6 | 329 | 1612 | [235](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1195)
1196 | ![graph1196](http://www.lysator.liu.se/~gunnar/graphs/graph1196.svg) | 6 | 5 | 313 | 1620 | [312](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1196)
1197 | ![graph1197](http://www.lysator.liu.se/~gunnar/graphs/graph1197.svg) | 6 | 6 | 357 | 1696 | [234](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1197)
1198 | ![graph1198](http://www.lysator.liu.se/~gunnar/graphs/graph1198.svg) | 6 | 6 | 339 | 1686 | [318](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1198)
1199 | ![graph1199](http://www.lysator.liu.se/~gunnar/graphs/graph1199.svg) | 6 | 7 | 373 | 1750 | [229](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1199)
1214 | ![graph1214](http://www.lysator.liu.se/~gunnar/graphs/graph1214.svg) | 6 | 7 | 379 | 1796 | [262](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1214)
1215 | ![graph1215](http://www.lysator.liu.se/~gunnar/graphs/graph1215.svg) | 6 | 8 | 391 | 1816 | [239](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1215)
1246 | ![graph1246](http://www.lysator.liu.se/~gunnar/graphs/graph1246.svg) | 6 | 7 | 449 | 2082 | [217](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1246)
1247 | ![graph1247](http://www.lysator.liu.se/~gunnar/graphs/graph1247.svg) | 6 | 8 | 457 | 2106 | [212](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1247)
1259 | ![graph1259](http://www.lysator.liu.se/~gunnar/graphs/graph1259.svg) | 6 | 7 | 385 | 1858 | [184](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1259)
1260 | ![graph1260](http://www.lysator.liu.se/~gunnar/graphs/graph1260.svg) | 6 | 6 | 403 | 1936 | [286](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1260)
1261 | ![graph1261](http://www.lysator.liu.se/~gunnar/graphs/graph1261.svg) | 6 | 7 | 427 | 2004 | [237](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1261)
1263 | ![graph1263](http://www.lysator.liu.se/~gunnar/graphs/graph1263.svg) | 6 | 8 | 449 | 2082 | [210](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1263)
1268 | ![graph1268](http://www.lysator.liu.se/~gunnar/graphs/graph1268.svg) | 6 | 6 | 363 | 1856 | [356](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1268)
1269 | ![graph1269](http://www.lysator.liu.se/~gunnar/graphs/graph1269.svg) | 6 | 7 | 387 | 1890 | [289](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1269)
1270 | ![graph1270](http://www.lysator.liu.se/~gunnar/graphs/graph1270.svg) | 6 | 7 | 429 | 2028 | [265](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1270)
1271 | ![graph1271](http://www.lysator.liu.se/~gunnar/graphs/graph1271.svg) | 6 | 8 | 447 | 2074 | [231](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1271)
1278 | ![graph1278](http://www.lysator.liu.se/~gunnar/graphs/graph1278.svg) | 6 | 8 | 465 | 2146 | [241](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1278)
1279 | ![graph1279](http://www.lysator.liu.se/~gunnar/graphs/graph1279.svg) | 6 | 9 | 473 | 2170 | [236](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1279)
1456 | ![graph1456](http://www.lysator.liu.se/~gunnar/graphs/graph1456.svg) | 6 | 5 | 285 | 1644 | [284](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1456)
1457 | ![graph1457](http://www.lysator.liu.se/~gunnar/graphs/graph1457.svg) | 6 | 6 | 383 | 1898 | [333](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1457)
1459 | ![graph1459](http://www.lysator.liu.se/~gunnar/graphs/graph1459.svg) | 6 | 7 | 445 | 2068 | [240](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1459)
1460 | ![graph1460](http://www.lysator.liu.se/~gunnar/graphs/graph1460.svg) | 6 | 6 | 305 | 1752 | [304](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1460)
1461 | ![graph1461](http://www.lysator.liu.se/~gunnar/graphs/graph1461.svg) | 6 | 7 | 401 | 1972 | [323](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1461)
1463 | ![graph1463](http://www.lysator.liu.se/~gunnar/graphs/graph1463.svg) | 6 | 8 | 453 | 2096 | [244](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1463)
1465 | ![graph1465](http://www.lysator.liu.se/~gunnar/graphs/graph1465.svg) | 6 | 7 | 431 | 2040 | [289](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1465)
1467 | ![graph1467](http://www.lysator.liu.se/~gunnar/graphs/graph1467.svg) | 6 | 8 | 463 | 2134 | [257](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1467)
1468 | ![graph1468](http://www.lysator.liu.se/~gunnar/graphs/graph1468.svg) | 6 | 7 | 407 | 2014 | [355](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1468)
1469 | ![graph1469](http://www.lysator.liu.se/~gunnar/graphs/graph1469.svg) | 6 | 8 | 451 | 2112 | [268](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1469)
1471 | ![graph1471](http://www.lysator.liu.se/~gunnar/graphs/graph1471.svg) | 6 | 9 | 471 | 2162 | [257](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1471)
1531 | ![graph1531](http://www.lysator.liu.se/~gunnar/graphs/graph1531.svg) | 6 | 9 | 489 | 2230 | [244](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1531)
1532 | ![graph1532](http://www.lysator.liu.se/~gunnar/graphs/graph1532.svg) | 6 | 8 | 469 | 2184 | [275](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1532)
1533 | ![graph1533](http://www.lysator.liu.se/~gunnar/graphs/graph1533.svg) | 6 | 9 | 489 | 2234 | [255](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1533)
1535 | ![graph1535](http://www.lysator.liu.se/~gunnar/graphs/graph1535.svg) | 6 | 10 | 497 | 2258 | [260](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1535)
1972 | ![graph1972](http://www.lysator.liu.se/~gunnar/graphs/graph1972.svg) | 6 | 7 | 325 | 1860 | [324](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1972)
1973 | ![graph1973](http://www.lysator.liu.se/~gunnar/graphs/graph1973.svg) | 6 | 8 | 425 | 2088 | [359](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1973)
1975 | ![graph1975](http://www.lysator.liu.se/~gunnar/graphs/graph1975.svg) | 6 | 9 | 477 | 2212 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1975)
1983 | ![graph1983](http://www.lysator.liu.se/~gunnar/graphs/graph1983.svg) | 6 | 10 | 497 | 2262 | [270](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1983)
2047 | ![graph2047](http://www.lysator.liu.se/~gunnar/graphs/graph2047.svg) | 6 | 11 | 505 | 2286 | [275](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path2047)
3294 | ![graph3294](http://www.lysator.liu.se/~gunnar/graphs/graph3294.svg) | 6 | 8 | 561 | 2544 | [256](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3294)
3295 | ![graph3295](http://www.lysator.liu.se/~gunnar/graphs/graph3295.svg) | 6 | 9 | 565 | 2556 | [258](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3295)
3306 | ![graph3306](http://www.lysator.liu.se/~gunnar/graphs/graph3306.svg) | 6 | 7 | 437 | 2128 | [276](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3306)
3307 | ![graph3307](http://www.lysator.liu.se/~gunnar/graphs/graph3307.svg) | 6 | 8 | 457 | 2206 | [249](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3307)
3308 | ![graph3308](http://www.lysator.liu.se/~gunnar/graphs/graph3308.svg) | 6 | 7 | 507 | 2368 | [290](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3308)
3309 | ![graph3309](http://www.lysator.liu.se/~gunnar/graphs/graph3309.svg) | 6 | 8 | 519 | 2404 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3309)
3310 | ![graph3310](http://www.lysator.liu.se/~gunnar/graphs/graph3310.svg) | 6 | 8 | 535 | 2458 | [254](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3310)
3311 | ![graph3311](http://www.lysator.liu.se/~gunnar/graphs/graph3311.svg) | 6 | 9 | 545 | 2490 | [251](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3311)
3326 | ![graph3326](http://www.lysator.liu.se/~gunnar/graphs/graph3326.svg) | 6 | 9 | 577 | 2608 | [278](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3326)
3327 | ![graph3327](http://www.lysator.liu.se/~gunnar/graphs/graph3327.svg) | 6 | 10 | 581 | 2620 | [280](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3327)
3440 | ![graph3440](http://www.lysator.liu.se/~gunnar/graphs/graph3440.svg) | 6 | 6 | 449 | 2196 | [370](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3440)
3441 | ![graph3441](http://www.lysator.liu.se/~gunnar/graphs/graph3441.svg) | 6 | 7 | 481 | 2300 | [338](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3441)
3443 | ![graph3443](http://www.lysator.liu.se/~gunnar/graphs/graph3443.svg) | 6 | 8 | 509 | 2380 | [280](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3443)
3447 | ![graph3447](http://www.lysator.liu.se/~gunnar/graphs/graph3447.svg) | 6 | 9 | 533 | 2448 | [246](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3447)
3448 | ![graph3448](http://www.lysator.liu.se/~gunnar/graphs/graph3448.svg) | 6 | 7 | 489 | 2312 | [292](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3448)
3449 | ![graph3449](http://www.lysator.liu.se/~gunnar/graphs/graph3449.svg) | 6 | 8 | 513 | 2400 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3449)
3451 | ![graph3451](http://www.lysator.liu.se/~gunnar/graphs/graph3451.svg) | 6 | 9 | 537 | 2482 | [252](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3451)
3452 | ![graph3452](http://www.lysator.liu.se/~gunnar/graphs/graph3452.svg) | 6 | 8 | 545 | 2508 | [298](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3452)
3453 | ![graph3453](http://www.lysator.liu.se/~gunnar/graphs/graph3453.svg) | 6 | 9 | 559 | 2548 | [284](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3453)
3455 | ![graph3455](http://www.lysator.liu.se/~gunnar/graphs/graph3455.svg) | 6 | 10 | 569 | 2578 | [276](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3455)
3576 | ![graph3576](http://www.lysator.liu.se/~gunnar/graphs/graph3576.svg) | 6 | 8 | 553 | 2524 | [274](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3576)
3577 | ![graph3577](http://www.lysator.liu.se/~gunnar/graphs/graph3577.svg) | 6 | 9 | 561 | 2552 | [280](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3577)
3578 | ![graph3578](http://www.lysator.liu.se/~gunnar/graphs/graph3578.svg) | 6 | 9 | 583 | 2640 | [292](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3578)
3579 | ![graph3579](http://www.lysator.liu.se/~gunnar/graphs/graph3579.svg) | 6 | 10 | 593 | 2670 | [286](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3579)
3582 | ![graph3582](http://www.lysator.liu.se/~gunnar/graphs/graph3582.svg) | 6 | 10 | 601 | 2696 | [304](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3582)
3583 | ![graph3583](http://www.lysator.liu.se/~gunnar/graphs/graph3583.svg) | 6 | 11 | 605 | 2708 | [304](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3583)
3873 | ![graph3873](http://www.lysator.liu.se/~gunnar/graphs/graph3873.svg) | 6 | 6 | 361 | 2052 | [360](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3873)
3875 | ![graph3875](http://www.lysator.liu.se/~gunnar/graphs/graph3875.svg) | 6 | 7 | 417 | 2108 | [363](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3875)
3879 | ![graph3879](http://www.lysator.liu.se/~gunnar/graphs/graph3879.svg) | 6 | 8 | 461 | 2240 | [292](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3879)
3885 | ![graph3885](http://www.lysator.liu.se/~gunnar/graphs/graph3885.svg) | 6 | 8 | 513 | 2412 | [290](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3885)
3887 | ![graph3887](http://www.lysator.liu.se/~gunnar/graphs/graph3887.svg) | 6 | 9 | 537 | 2484 | [262](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3887)
3903 | ![graph3903](http://www.lysator.liu.se/~gunnar/graphs/graph3903.svg) | 6 | 10 | 569 | 2580 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3903)
3947 | ![graph3947](http://www.lysator.liu.se/~gunnar/graphs/graph3947.svg) | 6 | 9 | 481 | 2318 | [275](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3947)
3948 | ![graph3948](http://www.lysator.liu.se/~gunnar/graphs/graph3948.svg) | 6 | 8 | 531 | 2480 | [320](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3948)
3949 | ![graph3949](http://www.lysator.liu.se/~gunnar/graphs/graph3949.svg) | 6 | 9 | 559 | 2570 | [281](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3949)
3950 | ![graph3950](http://www.lysator.liu.se/~gunnar/graphs/graph3950.svg) | 6 | 9 | 543 | 2516 | [310](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3950)
3951 | ![graph3951](http://www.lysator.liu.se/~gunnar/graphs/graph3951.svg) | 6 | 10 | 569 | 2602 | [279](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3951)
3958 | ![graph3958](http://www.lysator.liu.se/~gunnar/graphs/graph3958.svg) | 6 | 9 | 573 | 2612 | [294](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3958)
3959 | ![graph3959](http://www.lysator.liu.se/~gunnar/graphs/graph3959.svg) | 6 | 10 | 589 | 2660 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3959)
3966 | ![graph3966](http://www.lysator.liu.se/~gunnar/graphs/graph3966.svg) | 6 | 10 | 591 | 2668 | [308](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3966)
3967 | ![graph3967](http://www.lysator.liu.se/~gunnar/graphs/graph3967.svg) | 6 | 11 | 601 | 2698 | [300](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3967)
4094 | ![graph4094](http://www.lysator.liu.se/~gunnar/graphs/graph4094.svg) | 6 | 11 | 609 | 2724 | [318](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path4094)
4095 | ![graph4095](http://www.lysator.liu.se/~gunnar/graphs/graph4095.svg) | 6 | 12 | 613 | 2736 | [318](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path4095)
7672 | ![graph7672](http://www.lysator.liu.se/~gunnar/graphs/graph7672.svg) | 6 | 9 | 617 | 2760 | [300](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7672)
7673 | ![graph7673](http://www.lysator.liu.se/~gunnar/graphs/graph7673.svg) | 6 | 10 | 625 | 2788 | [316](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7673)
7675 | ![graph7675](http://www.lysator.liu.se/~gunnar/graphs/graph7675.svg) | 6 | 11 | 637 | 2826 | [322](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7675)
7679 | ![graph7679](http://www.lysator.liu.se/~gunnar/graphs/graph7679.svg) | 6 | 12 | 641 | 2838 | [332](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7679)
7902 | ![graph7902](http://www.lysator.liu.se/~gunnar/graphs/graph7902.svg) | 6 | 10 | 601 | 2720 | [304](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7902)
7903 | ![graph7903](http://www.lysator.liu.se/~gunnar/graphs/graph7903.svg) | 6 | 11 | 605 | 2732 | [308](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7903)
7915 | ![graph7915](http://www.lysator.liu.se/~gunnar/graphs/graph7915.svg) | 6 | 10 | 605 | 2726 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7915)
7916 | ![graph7916](http://www.lysator.liu.se/~gunnar/graphs/graph7916.svg) | 6 | 9 | 593 | 2688 | [300](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7916)
7917 | ![graph7917](http://www.lysator.liu.se/~gunnar/graphs/graph7917.svg) | 6 | 10 | 613 | 2752 | [304](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7917)
7919 | ![graph7919](http://www.lysator.liu.se/~gunnar/graphs/graph7919.svg) | 6 | 11 | 625 | 2790 | [310](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7919)
7934 | ![graph7934](http://www.lysator.liu.se/~gunnar/graphs/graph7934.svg) | 6 | 11 | 633 | 2816 | [318](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7934)
7935 | ![graph7935](http://www.lysator.liu.se/~gunnar/graphs/graph7935.svg) | 6 | 12 | 637 | 2828 | [328](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7935)
8185 | ![graph8185](http://www.lysator.liu.se/~gunnar/graphs/graph8185.svg) | 6 | 11 | 633 | 2816 | [332](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path8185)
8187 | ![graph8187](http://www.lysator.liu.se/~gunnar/graphs/graph8187.svg) | 6 | 12 | 645 | 2854 | [336](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path8187)
8191 | ![graph8191](http://www.lysator.liu.se/~gunnar/graphs/graph8191.svg) | 6 | 13 | 649 | 2866 | [346](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path8191)
16350 | ![graph16350](http://www.lysator.liu.se/~gunnar/graphs/graph16350.svg) | 6 | 12 | 653 | 2880 | [342](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path16350)
16351 | ![graph16351](http://www.lysator.liu.se/~gunnar/graphs/graph16351.svg) | 6 | 13 | 657 | 2892 | [352](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path16351)
16383 | ![graph16383](http://www.lysator.liu.se/~gunnar/graphs/graph16383.svg) | 6 | 14 | 661 | 2904 | [362](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path16383)
32767 | ![graph32767](http://www.lysator.liu.se/~gunnar/graphs/graph32767.svg) | 6 | 15 | 665 | 2916 | [372](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path32767)
33867 |  | 7 | 6 | 855 | 4770 | 137
33868 |  | 7 | 5 | 555 | 3582 | 554
33869 |  | 7 | 6 | 755 | 4206 | 291
33871 |  | 7 | 7 | 919 | 5090 | 206
33876 |  | 7 | 5 | 615 | 3792 | 614
33877 |  | 7 | 6 | 707 | 3902 | 370
33878 |  | 7 | 6 | 773 | 4422 | 645
33879 |  | 7 | 7 | 833 | 4566 | 368
33886 |  | 7 | 7 | 959 | 5270 | 319
33887 |  | 7 | 8 | 1015 | 5538 | 276
33908 |  | 7 | 6 | 779 | 4836 | 778
33909 |  | 7 | 7 | 875 | 4946 | 584
33911 |  | 7 | 8 | 991 | 5414 | 346
33919 |  | 7 | 9 | 1047 | 5682 | 306
33942 |  | 7 | 6 | 769 | 4348 | 706
33943 |  | 7 | 7 | 805 | 4384 | 406
33950 |  | 7 | 7 | 925 | 5068 | 517
33951 |  | 7 | 8 | 949 | 5114 | 426
33952 |  | 7 | 4 | 375 | 2850 | 374
33953 |  | 7 | 5 | 535 | 3494 | 534
33955 |  | 7 | 6 | 721 | 4082 | 484
33956 |  | 7 | 5 | 615 | 3882 | 614
33957 |  | 7 | 6 | 725 | 4108 | 598
33959 |  | 7 | 7 | 781 | 4246 | 476
33962 |  | 7 | 6 | 635 | 4094 | 634
33963 |  | 7 | 7 | 851 | 4766 | 408
33964 |  | 7 | 6 | 819 | 4766 | 806
33965 |  | 7 | 7 | 903 | 4930 | 461
33966 |  | 7 | 7 | 869 | 4922 | 726
33967 |  | 7 | 8 | 943 | 5100 | 430
33972 |  | 7 | 6 | 735 | 4548 | 734
33973 |  | 7 | 7 | 835 | 4670 | 543
33974 |  | 7 | 7 | 877 | 4950 | 760
33975 |  | 7 | 8 | 935 | 5052 | 449
33982 |  | 7 | 8 | 957 | 5212 | 551
33983 |  | 7 | 9 | 981 | 5258 | 464
34014 |  | 7 | 8 | 1139 | 6124 | 367
34015 |  | 7 | 9 | 1159 | 6202 | 348
34027 |  | 7 | 8 | 1015 | 5634 | 305
34028 |  | 7 | 7 | 1025 | 5658 | 552
34029 |  | 7 | 8 | 1085 | 5884 | 415
34031 |  | 7 | 9 | 1143 | 6146 | 341
34036 |  | 7 | 7 | 949 | 5468 | 900
34037 |  | 7 | 8 | 985 | 5500 | 645
34038 |  | 7 | 8 | 1083 | 5904 | 511
34039 |  | 7 | 9 | 1125 | 6044 | 409
34046 |  | 7 | 9 | 1171 | 6268 | 403
34047 |  | 7 | 10 | 1191 | 6346 | 382
34224 |  | 7 | 6 | 855 | 5274 | 854
34225 |  | 7 | 7 | 985 | 5550 | 773
34227 |  | 7 | 8 | 1111 | 5974 | 426
34228 |  | 7 | 7 | 915 | 5622 | 914
34229 |  | 7 | 8 | 1027 | 5758 | 755
34231 |  | 7 | 9 | 1127 | 6038 | 430
34233 |  | 7 | 8 | 1085 | 5910 | 571
34235 |  | 7 | 9 | 1157 | 6180 | 439
34236 |  | 7 | 8 | 1049 | 5902 | 844
34237 |  | 7 | 9 | 1129 | 6102 | 527
34239 |  | 7 | 10 | 1173 | 6244 | 447
34299 |  | 7 | 10 | 1223 | 6482 | 398
34300 |  | 7 | 9 | 1175 | 6326 | 508
34301 |  | 7 | 10 | 1219 | 6468 | 423
34303 |  | 7 | 11 | 1239 | 6546 | 420
34740 |  | 7 | 8 | 975 | 5970 | 974
34741 |  | 7 | 9 | 1091 | 6110 | 843
34743 |  | 7 | 10 | 1191 | 6390 | 526
34751 |  | 7 | 11 | 1235 | 6532 | 445
34815 |  | 7 | 12 | 1255 | 6610 | 442
35038 |  | 7 | 8 | 1109 | 5928 | 485
35039 |  | 7 | 9 | 1121 | 5948 | 456
35040 |  | 7 | 5 | 565 | 3816 | 564
35041 |  | 7 | 6 | 625 | 4040 | 624
35042 |  | 7 | 6 | 783 | 4580 | 756
35043 |  | 7 | 7 | 837 | 4712 | 627
35046 |  | 7 | 7 | 889 | 4858 | 558
35047 |  | 7 | 8 | 913 | 4906 | 510
35050 |  | 7 | 7 | 909 | 5250 | 810
35051 |  | 7 | 8 | 969 | 5386 | 540
35052 |  | 7 | 7 | 1017 | 5616 | 691
35053 |  | 7 | 8 | 1053 | 5680 | 509
35054 |  | 7 | 8 | 1067 | 5796 | 583
35055 |  | 7 | 9 | 1097 | 5854 | 474
35070 |  | 7 | 9 | 1141 | 6072 | 527
35071 |  | 7 | 10 | 1153 | 6092 | 494
35128 |  | 7 | 6 | 759 | 4506 | 690
35129 |  | 7 | 7 | 847 | 4810 | 776
35131 |  | 7 | 8 | 923 | 5000 | 564
35135 |  | 7 | 9 | 951 | 5064 | 542
35176 |  | 7 | 6 | 715 | 4606 | 714
35177 |  | 7 | 7 | 949 | 5338 | 616
35178 |  | 7 | 7 | 755 | 4822 | 754
35179 |  | 7 | 8 | 995 | 5558 | 574
35180 |  | 7 | 7 | 983 | 5582 | 846
35181 |  | 7 | 8 | 1091 | 5840 | 487
35182 |  | 7 | 8 | 1009 | 5660 | 792
35183 |  | 7 | 9 | 1107 | 5896 | 478
35184 |  | 7 | 6 | 867 | 5190 | [866](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path35184)
35185 |  | 7 | 7 | 999 | 5514 | 647
35186 |  | 7 | 7 | 941 | 5466 | 920
35187 |  | 7 | 8 | 1053 | 5710 | 544
35190 |  | 7 | 8 | 1001 | 5628 | 804
35191 |  | 7 | 9 | 1089 | 5816 | 492
35192 |  | 7 | 7 | 965 | 5482 | 803
35193 |  | 7 | 8 | 1053 | 5710 | 577
35194 |  | 7 | 8 | 1013 | 5706 | 828
35195 |  | 7 | 9 | 1101 | 5916 | 516
35196 |  | 7 | 8 | 1079 | 5900 | 697
35197 |  | 7 | 9 | 1129 | 6000 | 523
35198 |  | 7 | 9 | 1111 | 5986 | 607
35199 |  | 7 | 10 | 1145 | 6054 | 516
35320 |  | 7 | 8 | 1093 | 5882 | 556
35321 |  | 7 | 9 | 1121 | 5946 | 542
35322 |  | 7 | 9 | 1149 | 6158 | 619
35323 |  | 7 | 10 | 1183 | 6226 | 522
35326 |  | 7 | 10 | 1189 | 6272 | 557
35327 |  | 7 | 11 | 1201 | 6292 | 536
35616 |  | 7 | 5 | 475 | 3630 | 474
35617 |  | 7 | 6 | 779 | 4950 | 778
35618 |  | 7 | 6 | 655 | 4362 | 654
35619 |  | 7 | 7 | 897 | 5196 | 801
35622 |  | 7 | 7 | 865 | 5042 | 660
35623 |  | 7 | 8 | 957 | 5350 | 708
35626 |  | 7 | 7 | 755 | 4842 | 754
35627 |  | 7 | 8 | 997 | 5594 | 662
35628 |  | 7 | 7 | 923 | 5406 | 896
35629 |  | 7 | 8 | 1055 | 5754 | 588
35630 |  | 7 | 8 | 1001 | 5640 | 794
35631 |  | 7 | 9 | 1093 | 5872 | 548
35646 |  | 7 | 9 | 1109 | 5946 | 564
35647 |  | 7 | 10 | 1137 | 6010 | 548
35690 |  | 7 | 8 | 795 | 5058 | 794
35691 |  | 7 | 9 | 1043 | 5814 | 640
35692 |  | 7 | 8 | 1031 | 5838 | 899
35693 |  | 7 | 9 | 1139 | 6096 | 552
35694 |  | 7 | 9 | 1057 | 5916 | 858
35695 |  | 7 | 10 | 1155 | 6152 | 546
35702 |  | 7 | 9 | 1125 | 6108 | 690
35703 |  | 7 | 10 | 1181 | 6224 | 530
35710 |  | 7 | 10 | 1165 | 6222 | 636
35711 |  | 7 | 11 | 1199 | 6290 | 546
35838 |  | 7 | 11 | 1205 | 6336 | 581
35839 |  | 7 | 12 | 1217 | 6356 | 560
36062 |  | 7 | 9 | 1367 | 7186 | 446
36063 |  | 7 | 10 | 1375 | 7210 | 441
36074 |  | 7 | 8 | 1103 | 6134 | 485
36075 |  | 7 | 9 | 1159 | 6402 | 422
36076 |  | 7 | 8 | 1249 | 6726 | 566
36077 |  | 7 | 9 | 1273 | 6800 | 518
36078 |  | 7 | 9 | 1313 | 6976 | 451
36079 |  | 7 | 10 | 1335 | 7058 | 428
36084 |  | 7 | 8 | 1121 | 6284 | 763
36085 |  | 7 | 9 | 1145 | 6330 | 668
36086 |  | 7 | 9 | 1307 | 6950 | 504
36087 |  | 7 | 10 | 1325 | 6998 | 474
36094 |  | 7 | 10 | 1399 | 7330 | 488
36095 |  | 7 | 11 | 1407 | 7354 | 483
36208 |  | 7 | 7 | 1125 | 6298 | 868
36209 |  | 7 | 8 | 1189 | 6518 | 686
36211 |  | 7 | 9 | 1253 | 6742 | 513
36212 |  | 7 | 8 | 1205 | 6634 | 787
36213 |  | 7 | 9 | 1253 | 6756 | 582
36215 |  | 7 | 10 | 1301 | 6902 | 461
36216 |  | 7 | 8 | 1203 | 6536 | 560
36217 |  | 7 | 9 | 1259 | 6776 | 511
36219 |  | 7 | 10 | 1319 | 7034 | 426
36220 |  | 7 | 9 | 1331 | 7084 | 547
36221 |  | 7 | 10 | 1361 | 7180 | 493
36223 |  | 7 | 11 | 1383 | 7258 | 466
36272 |  | 7 | 7 | 1063 | 6166 | 1016
36273 |  | 7 | 8 | 1125 | 6316 | 802
36274 |  | 7 | 8 | 1249 | 6756 | 653
36275 |  | 7 | 9 | 1297 | 6886 | 503
36276 |  | 7 | 8 | 1113 | 6424 | 1035
36277 |  | 7 | 9 | 1173 | 6548 | 758
36278 |  | 7 | 9 | 1275 | 6858 | 626
36279 |  | 7 | 10 | 1317 | 6960 | 494
36280 |  | 7 | 8 | 1221 | 6678 | 706
36281 |  | 7 | 9 | 1261 | 6796 | 627
36282 |  | 7 | 9 | 1327 | 7056 | 588
36283 |  | 7 | 10 | 1353 | 7128 | 528
36284 |  | 7 | 9 | 1277 | 6930 | 691
36285 |  | 7 | 10 | 1313 | 7012 | 565
36286 |  | 7 | 10 | 1355 | 7152 | 550
36287 |  | 7 | 11 | 1373 | 7198 | 516
36344 |  | 7 | 9 | 1339 | 7074 | 519
36345 |  | 7 | 10 | 1355 | 7128 | 516
36346 |  | 7 | 10 | 1409 | 7388 | 519
36347 |  | 7 | 11 | 1431 | 7466 | 492
36348 |  | 7 | 10 | 1411 | 7412 | 548
36349 |  | 7 | 11 | 1429 | 7458 | 514
36350 |  | 7 | 11 | 1447 | 7530 | 530
36351 |  | 7 | 12 | 1455 | 7554 | 525
36641 |  | 7 | 7 | 931 | 5800 | 930
36643 |  | 7 | 8 | 1035 | 5922 | 776
36644 |  | 7 | 7 | 1007 | 5962 | 1000
36645 |  | 7 | 8 | 1085 | 6250 | 999
36646 |  | 7 | 8 | 1095 | 6134 | 703
36647 |  | 7 | 9 | 1143 | 6348 | 717
36651 |  | 7 | 9 | 1151 | 6382 | 529
36652 |  | 7 | 8 | 1195 | 6582 | 764
36653 |  | 7 | 9 | 1259 | 6816 | 602
36654 |  | 7 | 9 | 1251 | 6734 | 558
36655 |  | 7 | 10 | 1307 | 6968 | 491
36660 |  | 7 | 8 | 1131 | 6546 | 1083
36661 |  | 7 | 9 | 1193 | 6692 | 870
36662 |  | 7 | 9 | 1271 | 6896 | 675
36663 |  | 7 | 10 | 1311 | 7006 | 573
36670 |  | 7 | 10 | 1355 | 7138 | 531
36671 |  | 7 | 11 | 1371 | 7192 | 524
36715 |  | 7 | 10 | 1207 | 6650 | 468
36716 |  | 7 | 9 | 1297 | 6974 | 623
36717 |  | 7 | 10 | 1361 | 7224 | 501
36718 |  | 7 | 10 | 1321 | 7048 | 571
36719 |  | 7 | 11 | 1383 | 7306 | 478
36724 |  | 7 | 9 | 1317 | 7132 | 738
36725 |  | 7 | 10 | 1365 | 7262 | 585
36726 |  | 7 | 10 | 1389 | 7334 | 559
36727 |  | 7 | 11 | 1421 | 7434 | 505
36734 |  | 7 | 11 | 1425 | 7452 | 541
36735 |  | 7 | 12 | 1447 | 7530 | 514
36788 |  | 7 | 9 | 1181 | 6804 | 1117
36789 |  | 7 | 10 | 1241 | 6924 | 852
36790 |  | 7 | 10 | 1343 | 7234 | 719
36791 |  | 7 | 11 | 1385 | 7336 | 587
36798 |  | 7 | 11 | 1427 | 7476 | 572
36799 |  | 7 | 12 | 1445 | 7522 | 538
36862 |  | 7 | 12 | 1463 | 7594 | 553
36863 |  | 7 | 13 | 1471 | 7618 | 548
39344 |  | 7 | 7 | 915 | 5796 | 914
39345 |  | 7 | 8 | 1193 | 6660 | 802
39347 |  | 7 | 9 | 1343 | 7070 | 502
39348 |  | 7 | 8 | 935 | 5904 | 934
39349 |  | 7 | 9 | 1211 | 6734 | 792
39351 |  | 7 | 10 | 1351 | 7098 | 506
39352 |  | 7 | 8 | 1201 | 6730 | 894
39353 |  | 7 | 9 | 1317 | 7052 | 634
39355 |  | 7 | 10 | 1381 | 7228 | 546
39356 |  | 7 | 9 | 1225 | 6846 | 912
39357 |  | 7 | 10 | 1337 | 7130 | 614
39359 |  | 7 | 11 | 1389 | 7256 | 546
39416 |  | 7 | 9 | 1357 | 7226 | 633
39417 |  | 7 | 10 | 1405 | 7372 | 595
39419 |  | 7 | 11 | 1437 | 7466 | 568
39420 |  | 7 | 10 | 1381 | 7342 | 659
39421 |  | 7 | 11 | 1425 | 7444 | 573
39423 |  | 7 | 12 | 1445 | 7494 | 568
39572 |  | 7 | 7 | 755 | 4942 | 754
39573 |  | 7 | 8 | 995 | 5702 | 573
39574 |  | 7 | 8 | 1057 | 6110 | 957
39575 |  | 7 | 9 | 1135 | 6300 | 661
39582 |  | 7 | 9 | 1255 | 6806 | 636
39583 |  | 7 | 10 | 1299 | 6920 | 516
39584 |  | 7 | 6 | 805 | 5232 | 804
39585 |  | 7 | 7 | 1083 | 6198 | 909
39587 |  | 7 | 8 | 1241 | 6710 | 648
39588 |  | 7 | 7 | 865 | 5536 | 864
39589 |  | 7 | 8 | 1137 | 6406 | 818
39591 |  | 7 | 9 | 1265 | 6790 | 620
39594 |  | 7 | 8 | 1205 | 6650 | 846
39595 |  | 7 | 9 | 1315 | 6980 | 588
39596 |  | 7 | 8 | 1157 | 6546 | 917
39597 |  | 7 | 9 | 1299 | 6934 | 558
39598 |  | 7 | 9 | 1265 | 6866 | 712
39599 |  | 7 | 10 | 1343 | 7074 | 560
39604 |  | 7 | 8 | 915 | 5806 | 914
39605 |  | 7 | 9 | 1187 | 6630 | 766
39606 |  | 7 | 9 | 1197 | 6696 | 856
39607 |  | 7 | 10 | 1319 | 7006 | 546
39614 |  | 7 | 10 | 1311 | 7018 | 616
39615 |  | 7 | 11 | 1363 | 7144 | 548
39644 |  | 7 | 9 | 1169 | 6532 | 817
39645 |  | 7 | 10 | 1193 | 6578 | 725
39646 |  | 7 | 10 | 1355 | 7198 | 558
39647 |  | 7 | 11 | 1373 | 7246 | 530
39657 |  | 7 | 9 | 1295 | 6964 | 694
39659 |  | 7 | 10 | 1381 | 7270 | 553
39660 |  | 7 | 9 | 1285 | 7010 | 768
39661 |  | 7 | 10 | 1355 | 7200 | 609
39663 |  | 7 | 11 | 1413 | 7382 | 532
39664 |  | 7 | 8 | 1171 | 6630 | 983
39665 |  | 7 | 9 | 1275 | 6922 | 720
39666 |  | 7 | 9 | 1339 | 7172 | 673
39667 |  | 7 | 10 | 1399 | 7334 | 558
39668 |  | 7 | 9 | 1225 | 6890 | 973
39669 |  | 7 | 10 | 1327 | 7142 | 658
39670 |  | 7 | 10 | 1369 | 7282 | 638
39671 |  | 7 | 11 | 1419 | 7404 | 546
39673 |  | 7 | 10 | 1323 | 7068 | 684
39674 |  | 7 | 10 | 1385 | 7306 | 601
39675 |  | 7 | 11 | 1417 | 7400 | 574
39676 |  | 7 | 10 | 1333 | 7182 | 690
39677 |  | 7 | 11 | 1377 | 7284 | 611
39678 |  | 7 | 11 | 1417 | 7420 | 567
39679 |  | 7 | 12 | 1437 | 7470 | 562
39856 |  | 7 | 8 | 955 | 6032 | 954
39857 |  | 7 | 9 | 1241 | 6916 | 874
39859 |  | 7 | 10 | 1391 | 7326 | 572
39860 |  | 7 | 9 | 975 | 6140 | 974
39861 |  | 7 | 10 | 1259 | 6990 | 862
39863 |  | 7 | 11 | 1399 | 7354 | 574
39864 |  | 7 | 9 | 1245 | 6940 | 928
39865 |  | 7 | 10 | 1371 | 7294 | 666
39867 |  | 7 | 11 | 1435 | 7464 | 576
39868 |  | 7 | 10 | 1269 | 7056 | 948
39869 |  | 7 | 11 | 1391 | 7366 | 644
39871 |  | 7 | 12 | 1443 | 7492 | 576
39928 |  | 7 | 10 | 1373 | 7290 | 656
39929 |  | 7 | 11 | 1421 | 7436 | 619
39931 |  | 7 | 12 | 1453 | 7530 | 592
39932 |  | 7 | 11 | 1397 | 7406 | 678
39933 |  | 7 | 12 | 1441 | 7508 | 597
39935 |  | 7 | 13 | 1461 | 7558 | 592
40440 |  | 7 | 10 | 1475 | 7660 | 550
40441 |  | 7 | 11 | 1493 | 7726 | 569
40443 |  | 7 | 12 | 1519 | 7822 | 559
40444 |  | 7 | 11 | 1499 | 7776 | 586
40445 |  | 7 | 12 | 1519 | 7826 | 568
40447 |  | 7 | 13 | 1527 | 7850 | 575
40670 |  | 7 | 11 | 1447 | 7578 | 540
40671 |  | 7 | 12 | 1455 | 7602 | 537
40683 |  | 7 | 11 | 1455 | 7590 | 488
40684 |  | 7 | 10 | 1431 | 7520 | 582
40685 |  | 7 | 11 | 1469 | 7642 | 549
40687 |  | 7 | 12 | 1495 | 7738 | 538
40692 |  | 7 | 10 | 1407 | 7490 | 671
40693 |  | 7 | 11 | 1455 | 7608 | 561
40694 |  | 7 | 11 | 1473 | 7680 | 578
40695 |  | 7 | 12 | 1493 | 7730 | 560
40702 |  | 7 | 12 | 1511 | 7802 | 562
40703 |  | 7 | 13 | 1519 | 7826 | 569
40880 |  | 7 | 9 | 1269 | 7110 | 987
40881 |  | 7 | 10 | 1385 | 7428 | 721
40883 |  | 7 | 11 | 1449 | 7604 | 631
40884 |  | 7 | 10 | 1293 | 7226 | 1011
40885 |  | 7 | 11 | 1405 | 7506 | 707
40887 |  | 7 | 12 | 1457 | 7632 | 639
40888 |  | 7 | 10 | 1423 | 7530 | 652
40889 |  | 7 | 11 | 1471 | 7668 | 595
40891 |  | 7 | 12 | 1509 | 7790 | 574
40892 |  | 7 | 11 | 1447 | 7646 | 687
40893 |  | 7 | 12 | 1497 | 7768 | 595
40895 |  | 7 | 13 | 1517 | 7818 | 590
40952 |  | 7 | 11 | 1491 | 7724 | 575
40953 |  | 7 | 12 | 1509 | 7790 | 594
40955 |  | 7 | 13 | 1535 | 7886 | 583
40956 |  | 7 | 12 | 1515 | 7840 | 610
40957 |  | 7 | 13 | 1535 | 7890 | 592
40959 |  | 7 | 14 | 1543 | 7914 | 599
48020 |  | 7 | 9 | 1015 | 6366 | 1014
48021 |  | 7 | 10 | 1307 | 7234 | 912
48022 |  | 7 | 10 | 1313 | 7276 | 944
48023 |  | 7 | 11 | 1445 | 7614 | 652
48030 |  | 7 | 11 | 1463 | 7686 | 661
48031 |  | 7 | 12 | 1515 | 7812 | 587
48052 |  | 7 | 10 | 1035 | 6474 | 1034
48053 |  | 7 | 11 | 1331 | 7350 | 954
48055 |  | 7 | 12 | 1471 | 7714 | 671
48063 |  | 7 | 13 | 1523 | 7840 | 603
48086 |  | 7 | 11 | 1443 | 7630 | 673
48087 |  | 7 | 12 | 1495 | 7756 | 605
48094 |  | 7 | 12 | 1513 | 7828 | 609
48095 |  | 7 | 13 | 1533 | 7878 | 604
48116 |  | 7 | 11 | 1337 | 7392 | 985
48117 |  | 7 | 12 | 1469 | 7730 | 693
48119 |  | 7 | 13 | 1521 | 7856 | 625
48127 |  | 7 | 14 | 1541 | 7906 | 620
49118 |  | 7 | 13 | 1551 | 7950 | 606
49119 |  | 7 | 14 | 1559 | 7974 | 613
49140 |  | 7 | 12 | 1487 | 7802 | 701
49141 |  | 7 | 13 | 1539 | 7928 | 627
49143 |  | 7 | 14 | 1559 | 7978 | 622
49151 |  | 7 | 15 | 1567 | 8002 | 629
64436 |  | 7 | 11 | 1055 | 6582 | 1054
64437 |  | 7 | 12 | 1355 | 7466 | 995
64439 |  | 7 | 13 | 1495 | 7830 | 711
64447 |  | 7 | 14 | 1547 | 7956 | 643
64511 |  | 7 | 15 | 1567 | 8006 | 638
65535 |  | 7 | 16 | 1575 | 8030 | 645
101598 |  | 7 | 10 | 1695 | 8744 | 549
101599 |  | 7 | 11 | 1699 | 8756 | 551
101610 |  | 7 | 9 | 1355 | 7464 | 612
101611 |  | 7 | 10 | 1375 | 7542 | 584
101612 |  | 7 | 9 | 1541 | 8148 | 628
101613 |  | 7 | 10 | 1553 | 8184 | 618
101614 |  | 7 | 10 | 1613 | 8418 | 527
101615 |  | 7 | 11 | 1623 | 8450 | 524
101630 |  | 7 | 11 | 1727 | 8888 | 587
101631 |  | 7 | 12 | 1731 | 8900 | 589
101736 |  | 7 | 8 | 1265 | 7096 | [726, 727]
101737 |  | 7 | 9 | 1319 | 7358 | [670, 674]
101739 |  | 7 | 10 | 1375 | 7626 | [593, 604]
101740 |  | 7 | 9 | 1545 | 8156 | 561
101741 |  | 7 | 10 | 1573 | 8258 | 535
101743 |  | 7 | 11 | 1599 | 8354 | 511
101744 |  | 7 | 8 | 1399 | 7662 | 860
101745 |  | 7 | 9 | 1431 | 7782 | 812
101746 |  | 7 | 9 | 1475 | 7926 | 671
101747 |  | 7 | 10 | 1503 | 8020 | 621
101750 |  | 7 | 10 | 1539 | 8124 | 520
101751 |  | 7 | 11 | 1563 | 8200 | 496
101752 |  | 7 | 9 | 1495 | 8012 | 634
101753 |  | 7 | 10 | 1519 | 8106 | 623
101754 |  | 7 | 10 | 1559 | 8276 | 567
101755 |  | 7 | 11 | 1583 | 8366 | 541
101756 |  | 7 | 10 | 1631 | 8520 | 609
101757 |  | 7 | 11 | 1645 | 8564 | 595
101758 |  | 7 | 11 | 1661 | 8618 | 572
101759 |  | 7 | 12 | 1671 | 8650 | 566
101880 |  | 7 | 10 | 1643 | 8542 | 578
101881 |  | 7 | 11 | 1651 | 8570 | 582
101882 |  | 7 | 11 | 1733 | 8938 | 600
101883 |  | 7 | 12 | 1743 | 8970 | 594
101886 |  | 7 | 12 | 1775 | 9088 | 634
101887 |  | 7 | 13 | 1779 | 9100 | 634
102176 |  | 7 | 7 | 1083 | 6726 | 1082
102177 |  | 7 | 8 | 1159 | 7170 | 1158
102178 |  | 7 | 8 | 1221 | 7026 | 1042
102179 |  | 7 | 9 | 1275 | 7306 | 1029
102182 |  | 7 | 9 | 1351 | 7470 | 707
102183 |  | 7 | 10 | 1375 | 7582 | 721
102186 |  | 7 | 9 | 1337 | 7492 | 801
102187 |  | 7 | 10 | 1391 | 7754 | [751, 752]
102188 |  | 7 | 9 | 1487 | 8026 | 714
102189 |  | 7 | 10 | 1519 | 8154 | 680
102190 |  | 7 | 10 | 1555 | 8258 | 584
102191 |  | 7 | 11 | 1579 | 8350 | 568
102206 |  | 7 | 11 | 1659 | 8606 | 590
102207 |  | 7 | 12 | 1667 | 8634 | 592
102250 |  | 7 | 10 | 1391 | 7754 | [750, 754]
102251 |  | 7 | 11 | 1447 | 8022 | [670, 684]
102252 |  | 7 | 10 | 1617 | 8552 | 638
102253 |  | 7 | 11 | 1645 | 8654 | 610
102254 |  | 7 | 11 | 1645 | 8654 | 617
102255 |  | 7 | 12 | 1671 | 8750 | 593
102262 |  | 7 | 11 | 1707 | 8852 | 588
102263 |  | 7 | 12 | 1723 | 8904 | 576
102270 |  | 7 | 12 | 1749 | 9002 | 624
102271 |  | 7 | 13 | 1759 | 9034 | 618
102398 |  | 7 | 13 | 1791 | 9152 | 657
102399 |  | 7 | 14 | 1795 | 9164 | 657
103864 |  | 7 | 9 | 1539 | 8208 | 680
103865 |  | 7 | 10 | 1579 | 8336 | 636
103867 |  | 7 | 11 | 1611 | 8428 | 580
103871 |  | 7 | 12 | 1635 | 8496 | 548
103928 |  | 7 | 10 | 1663 | 8680 | 616
103929 |  | 7 | 11 | 1687 | 8768 | 609
103931 |  | 7 | 12 | 1711 | 8850 | 582
103932 |  | 7 | 11 | 1719 | 8876 | 639
103933 |  | 7 | 12 | 1733 | 8916 | 625
103935 |  | 7 | 13 | 1743 | 8946 | 618
104011 |  | 7 | 9 | 1159 | 6546 | 443
104012 |  | 7 | 8 | 1233 | 6962 | 787
104013 |  | 7 | 9 | 1293 | 7184 | 651
104015 |  | 7 | 10 | 1351 | 7442 | 558
104020 |  | 7 | 8 | 1409 | 7664 | 750
104021 |  | 7 | 9 | 1445 | 7772 | 660
104022 |  | 7 | 9 | 1479 | 7934 | 663
104023 |  | 7 | 10 | 1509 | 8030 | 613
104030 |  | 7 | 10 | 1549 | 8196 | 543
104031 |  | 7 | 11 | 1575 | 8290 | 519
104052 |  | 7 | 9 | 1533 | 8184 | 735
104053 |  | 7 | 10 | 1577 | 8316 | 635
104055 |  | 7 | 11 | 1613 | 8428 | 581
104063 |  | 7 | 12 | 1639 | 8514 | 552
104082 |  | 7 | 8 | 1169 | 6852 | 1127
104083 |  | 7 | 9 | 1205 | 6880 | 903
104086 |  | 7 | 9 | 1311 | 7324 | 766
104087 |  | 7 | 10 | 1353 | 7464 | 673
104094 |  | 7 | 10 | 1549 | 8204 | 562
104095 |  | 7 | 11 | 1573 | 8280 | 540
104096 |  | 7 | 7 | 1247 | 7098 | [1120](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path104096)
104097 |  | 7 | 8 | 1335 | 7458 | 1034
104099 |  | 7 | 9 | 1409 | 7720 | 826
104100 |  | 7 | 8 | 1363 | 7526 | 844
104101 |  | 7 | 9 | 1433 | 7784 | 694
104103 |  | 7 | 10 | 1489 | 7976 | 616
104106 |  | 7 | 9 | 1425 | 7808 | 839
104107 |  | 7 | 10 | 1493 | 8038 | 647
104108 |  | 7 | 9 | 1553 | 8232 | 662
104109 |  | 7 | 10 | 1597 | 8364 | 578
104110 |  | 7 | 10 | 1583 | 8336 | 640
104111 |  | 7 | 11 | 1617 | 8434 | 582
104114 |  | 7 | 9 | 1425 | 7832 | 878
104115 |  | 7 | 10 | 1485 | 8004 | 654
104118 |  | 7 | 10 | 1495 | 8056 | 672
104119 |  | 7 | 11 | 1549 | 8220 | 548
104126 |  | 7 | 11 | 1613 | 8436 | 604
104127 |  | 7 | 12 | 1637 | 8504 | 572
104154 |  | 7 | 10 | 1403 | 7712 | 658
104155 |  | 7 | 11 | 1423 | 7790 | 632
104156 |  | 7 | 10 | 1589 | 8396 | 690
104157 |  | 7 | 11 | 1601 | 8432 | 676
104158 |  | 7 | 11 | 1661 | 8666 | 584
104159 |  | 7 | 12 | 1671 | 8698 | 580
104168 |  | 7 | 9 | 1445 | 7848 | 723
104169 |  | 7 | 10 | 1505 | 8104 | 652
104171 |  | 7 | 11 | 1567 | 8362 | 561
104172 |  | 7 | 10 | 1657 | 8656 | 647
104173 |  | 7 | 11 | 1685 | 8746 | 611
104175 |  | 7 | 12 | 1711 | 8834 | 582
104176 |  | 7 | 9 | 1511 | 8142 | 786
104177 |  | 7 | 10 | 1549 | 8274 | 731
104178 |  | 7 | 10 | 1585 | 8424 | 659
104179 |  | 7 | 11 | 1619 | 8534 | 607
104180 |  | 7 | 10 | 1627 | 8572 | 680
104181 |  | 7 | 11 | 1659 | 8668 | 622
104182 |  | 7 | 11 | 1675 | 8722 | 600
104183 |  | 7 | 12 | 1699 | 8792 | 570
104184 |  | 7 | 10 | 1557 | 8290 | 692
104185 |  | 7 | 11 | 1581 | 8378 | 681
104186 |  | 7 | 11 | 1623 | 8556 | 615
104187 |  | 7 | 12 | 1647 | 8638 | 588
104188 |  | 7 | 11 | 1695 | 8796 | 655
104189 |  | 7 | 12 | 1709 | 8836 | 641
104190 |  | 7 | 12 | 1725 | 8892 | 619
104191 |  | 7 | 13 | 1735 | 8922 | 612
104368 |  | 7 | 9 | 1471 | 8058 | 941
104369 |  | 7 | 10 | 1547 | 8322 | 743
104371 |  | 7 | 11 | 1611 | 8520 | 592
104372 |  | 7 | 10 | 1503 | 8178 | 905
104373 |  | 7 | 11 | 1575 | 8416 | 701
104375 |  | 7 | 12 | 1635 | 8596 | 576
104376 |  | 7 | 10 | 1609 | 8518 | 660
104377 |  | 7 | 11 | 1653 | 8664 | 614
104379 |  | 7 | 12 | 1691 | 8784 | 564
104380 |  | 7 | 11 | 1665 | 8714 | 690
104381 |  | 7 | 12 | 1699 | 8812 | 632
104383 |  | 7 | 13 | 1723 | 8880 | 600
104440 |  | 7 | 11 | 1679 | 8744 | 640
104441 |  | 7 | 12 | 1703 | 8832 | 633
104443 |  | 7 | 13 | 1727 | 8914 | 606
104444 |  | 7 | 12 | 1735 | 8940 | 663
104445 |  | 7 | 13 | 1749 | 8980 | 649
104447 |  | 7 | 14 | 1759 | 9010 | 642
105976 |  | 7 | 11 | 1799 | 9212 | 644
105977 |  | 7 | 12 | 1807 | 9240 | 650
105978 |  | 7 | 12 | 1829 | 9328 | 667
105979 |  | 7 | 13 | 1839 | 9358 | 661
105982 |  | 7 | 13 | 1847 | 9384 | 683
105983 |  | 7 | 14 | 1851 | 9396 | 683
106206 |  | 7 | 12 | 1775 | 9136 | 643
106207 |  | 7 | 13 | 1779 | 9148 | 645
106208 |  | 7 | 9 | 1533 | 8190 | 706
106209 |  | 7 | 10 | 1557 | 8302 | 724
106210 |  | 7 | 10 | 1641 | 8602 | 638
106211 |  | 7 | 11 | 1665 | 8690 | 626
106214 |  | 7 | 11 | 1705 | 8814 | 634
106215 |  | 7 | 12 | 1713 | 8842 | 642
106218 |  | 7 | 11 | 1725 | 8964 | 611
106219 |  | 7 | 12 | 1751 | 9054 | 584
106220 |  | 7 | 11 | 1757 | 9072 | 640
106221 |  | 7 | 12 | 1773 | 9120 | 628
106222 |  | 7 | 12 | 1797 | 9212 | 647
106223 |  | 7 | 13 | 1807 | 9242 | 640
106238 |  | 7 | 13 | 1839 | 9360 | 679
106239 |  | 7 | 14 | 1843 | 9372 | 679
106273 |  | 7 | 9 | 1301 | 7474 | 1124
106274 |  | 7 | 9 | 1325 | 7406 | 849
106275 |  | 7 | 10 | 1381 | 7670 | 816
106278 |  | 7 | 10 | 1401 | 7700 | 723
106279 |  | 7 | 11 | 1425 | 7812 | 743
106280 |  | 7 | 9 | 1451 | 7918 | [774](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path106280)
106281 |  | 7 | 10 | 1515 | 8206 | 734
106282 |  | 7 | 10 | 1509 | 8132 | 704
106283 |  | 7 | 11 | 1569 | 8382 | 622
106284 |  | 7 | 10 | 1585 | 8426 | 674
106285 |  | 7 | 11 | 1621 | 8554 | 630
106286 |  | 7 | 11 | 1621 | 8544 | 628
106287 |  | 7 | 12 | 1645 | 8628 | 608
106296 |  | 7 | 10 | 1603 | 8462 | 616
106297 |  | 7 | 11 | 1627 | 8574 | 634
106298 |  | 7 | 11 | 1677 | 8730 | 616
106299 |  | 7 | 12 | 1701 | 8816 | 596
106302 |  | 7 | 12 | 1725 | 8884 | 632
106303 |  | 7 | 13 | 1733 | 8912 | 632
106344 |  | 7 | 10 | 1567 | 8408 | 713
106345 |  | 7 | 11 | 1631 | 8672 | 641
106346 |  | 7 | 11 | 1591 | 8502 | 714
106347 |  | 7 | 12 | 1655 | 8762 | 622
106348 |  | 7 | 11 | 1703 | 8916 | 681
106349 |  | 7 | 12 | 1733 | 9014 | 644
106350 |  | 7 | 12 | 1717 | 8960 | 675
106351 |  | 7 | 13 | 1743 | 9046 | 646
106352 |  | 7 | 10 | 1679 | 8812 | 654
106353 |  | 7 | 11 | 1715 | 8940 | 620
106354 |  | 7 | 11 | 1735 | 9012 | 654
106355 |  | 7 | 12 | 1765 | 9110 | 618
106358 |  | 7 | 12 | 1779 | 9152 | 640
106359 |  | 7 | 13 | 1795 | 9200 | 628
106360 |  | 7 | 11 | 1743 | 9030 | 636
106361 |  | 7 | 12 | 1767 | 9116 | 624
106362 |  | 7 | 12 | 1773 | 9146 | 663
106363 |  | 7 | 13 | 1799 | 9234 | 634
106364 |  | 7 | 12 | 1803 | 9244 | 658
106365 |  | 7 | 13 | 1819 | 9292 | 646
106366 |  | 7 | 13 | 1821 | 9300 | 677
106367 |  | 7 | 14 | 1831 | 9330 | 670
106488 |  | 7 | 12 | 1815 | 9276 | 670
106489 |  | 7 | 13 | 1823 | 9304 | 678
106490 |  | 7 | 13 | 1845 | 9392 | 694
106491 |  | 7 | 14 | 1855 | 9422 | 687
106494 |  | 7 | 14 | 1863 | 9448 | 709
106495 |  | 7 | 15 | 1867 | 9460 | 709
111558 |  | 7 | 10 | 1561 | 8294 | 714
111559 |  | 7 | 11 | 1585 | 8406 | 728
111563 |  | 7 | 11 | 1625 | 8546 | 626
111564 |  | 7 | 10 | 1609 | 8520 | 686
111565 |  | 7 | 11 | 1653 | 8668 | 628
111566 |  | 7 | 11 | 1677 | 8736 | 662
111567 |  | 7 | 12 | 1701 | 8820 | 644
111582 |  | 7 | 12 | 1741 | 8944 | 658
111583 |  | 7 | 13 | 1749 | 8972 | 660
111585 |  | 7 | 10 | 1417 | 7936 | 885
111587 |  | 7 | 11 | 1573 | 8412 | 652
111591 |  | 7 | 12 | 1649 | 8658 | 638
111597 |  | 7 | 12 | 1693 | 8808 | 588
111599 |  | 7 | 13 | 1725 | 8904 | 624
111615 |  | 7 | 14 | 1757 | 9000 | 660
112459 |  | 7 | 11 | 1471 | 8026 | 670
112460 |  | 7 | 10 | 1611 | 8560 | 759
112461 |  | 7 | 11 | 1683 | 8822 | 631
112462 |  | 7 | 11 | 1643 | 8664 | 707
112463 |  | 7 | 12 | 1711 | 8926 | 610
112468 |  | 7 | 10 | 1721 | 8940 | 666
112469 |  | 7 | 11 | 1765 | 9088 | 606
112470 |  | 7 | 11 | 1759 | 9082 | 676
112471 |  | 7 | 12 | 1789 | 9178 | 640
112478 |  | 7 | 12 | 1797 | 9216 | 680
112479 |  | 7 | 13 | 1823 | 9302 | 651
112481 |  | 7 | 10 | 1431 | 7918 | 795
112483 |  | 7 | 11 | 1475 | 8060 | 717
112485 |  | 7 | 11 | 1687 | 8854 | 644
112487 |  | 7 | 12 | 1711 | 8928 | 620
112491 |  | 7 | 12 | 1495 | 8138 | 706
112492 |  | 7 | 11 | 1661 | 8744 | 755
112493 |  | 7 | 12 | 1733 | 9014 | 648
112494 |  | 7 | 12 | 1673 | 8780 | 743
112495 |  | 7 | 13 | 1743 | 9046 | 646
112500 |  | 7 | 11 | 1745 | 9052 | 694
112501 |  | 7 | 12 | 1789 | 9200 | 634
112502 |  | 7 | 12 | 1787 | 9188 | 680
112503 |  | 7 | 13 | 1819 | 9292 | 646
112510 |  | 7 | 13 | 1805 | 9244 | 698
112511 |  | 7 | 14 | 1831 | 9330 | 669
112524 |  | 7 | 10 | 1653 | 8740 | 708
112525 |  | 7 | 11 | 1705 | 8904 | 608
112526 |  | 7 | 11 | 1719 | 8962 | 668
112527 |  | 7 | 12 | 1757 | 9080 | 614
112542 |  | 7 | 12 | 1787 | 9192 | 672
112543 |  | 7 | 13 | 1811 | 9260 | 640
112545 |  | 7 | 10 | 1567 | 8470 | 798
112546 |  | 7 | 10 | 1585 | 8488 | 782
112547 |  | 7 | 11 | 1661 | 8774 | 648
112550 |  | 7 | 11 | 1687 | 8856 | 634
112551 |  | 7 | 12 | 1735 | 9016 | 580
112554 |  | 7 | 11 | 1635 | 8672 | 785
112555 |  | 7 | 12 | 1707 | 8934 | 657
112556 |  | 7 | 11 | 1705 | 8932 | 680
112557 |  | 7 | 12 | 1757 | 9100 | 604
112558 |  | 7 | 12 | 1747 | 9068 | 672
112559 |  | 7 | 13 | 1787 | 9192 | 620
112574 |  | 7 | 13 | 1795 | 9220 | 688
112575 |  | 7 | 14 | 1819 | 9288 | 656
112590 |  | 7 | 12 | 1765 | 9116 | 655
112591 |  | 7 | 13 | 1791 | 9202 | 626
112598 |  | 7 | 12 | 1797 | 9220 | 682
112599 |  | 7 | 13 | 1813 | 9268 | 670
112606 |  | 7 | 13 | 1837 | 9360 | 688
112607 |  | 7 | 14 | 1847 | 9390 | 681
112609 |  | 7 | 11 | 1635 | 8702 | 670
112610 |  | 7 | 11 | 1637 | 8660 | 698
112611 |  | 7 | 12 | 1703 | 8920 | 612
112612 |  | 7 | 11 | 1723 | 8982 | 666
112613 |  | 7 | 12 | 1761 | 9114 | 626
112614 |  | 7 | 12 | 1767 | 9120 | 654
112615 |  | 7 | 13 | 1791 | 9204 | 636
112618 |  | 7 | 12 | 1667 | 8776 | 735
112619 |  | 7 | 13 | 1735 | 9038 | 638
112620 |  | 7 | 12 | 1779 | 9180 | 672
112621 |  | 7 | 13 | 1811 | 9284 | 638
112622 |  | 7 | 13 | 1797 | 9236 | 691
112623 |  | 7 | 14 | 1823 | 9322 | 662
112628 |  | 7 | 12 | 1783 | 9194 | 702
112629 |  | 7 | 13 | 1813 | 9290 | 666
112630 |  | 7 | 13 | 1827 | 9332 | 686
112631 |  | 7 | 14 | 1843 | 9380 | 674
112638 |  | 7 | 14 | 1845 | 9388 | 705
112639 |  | 7 | 15 | 1855 | 9418 | 698
114654 |  | 7 | 14 | 1879 | 9508 | 719
114655 |  | 7 | 15 | 1883 | 9520 | 719
114656 |  | 7 | 11 | 1715 | 8938 | 660
114657 |  | 7 | 12 | 1739 | 9050 | 678
114658 |  | 7 | 12 | 1791 | 9212 | 674
114659 |  | 7 | 13 | 1815 | 9296 | 656
114662 |  | 7 | 13 | 1839 | 9364 | 688
114663 |  | 7 | 14 | 1847 | 9392 | 690
114666 |  | 7 | 13 | 1821 | 9328 | 711
114667 |  | 7 | 14 | 1847 | 9414 | 682
114668 |  | 7 | 13 | 1851 | 9424 | 704
114669 |  | 7 | 14 | 1867 | 9472 | 692
114670 |  | 7 | 14 | 1869 | 9480 | 722
114671 |  | 7 | 15 | 1879 | 9510 | 715
114686 |  | 7 | 15 | 1887 | 9536 | 737
114687 |  | 7 | 16 | 1891 | 9548 | 737
127777 |  | 7 | 9 | 1235 | 7614 | 1234
127779 |  | 7 | 10 | 1355 | 7754 | 1123
127783 |  | 7 | 11 | 1471 | 8198 | 841
127787 |  | 7 | 11 | 1455 | 8030 | 821
127789 |  | 7 | 11 | 1599 | 8598 | 774
127791 |  | 7 | 12 | 1659 | 8794 | 662
127806 |  | 7 | 12 | 1723 | 8966 | 672
127807 |  | 7 | 13 | 1747 | 9078 | 686
127851 |  | 7 | 12 | 1499 | 8172 | 747
127853 |  | 7 | 12 | 1711 | 8966 | 670
127855 |  | 7 | 13 | 1735 | 9040 | 648
127862 |  | 7 | 12 | 1751 | 9088 | 674
127863 |  | 7 | 13 | 1791 | 9228 | 636
127870 |  | 7 | 13 | 1799 | 9240 | 690
127871 |  | 7 | 14 | 1823 | 9324 | 672
127998 |  | 7 | 14 | 1847 | 9392 | 704
127999 |  | 7 | 15 | 1855 | 9420 | 706
128875 |  | 7 | 13 | 1519 | 8250 | [738, 741]
128876 |  | 7 | 12 | 1685 | 8856 | 783
128877 |  | 7 | 13 | 1757 | 9126 | 676
128878 |  | 7 | 13 | 1697 | 8892 | 771
128879 |  | 7 | 14 | 1767 | 9158 | 674
128884 |  | 7 | 12 | 1769 | 9164 | 720
128885 |  | 7 | 13 | 1813 | 9312 | 660
128886 |  | 7 | 13 | 1811 | 9300 | 708
128887 |  | 7 | 14 | 1843 | 9404 | 674
128894 |  | 7 | 14 | 1829 | 9356 | 727
128895 |  | 7 | 15 | 1855 | 9442 | 698
128958 |  | 7 | 14 | 1859 | 9452 | 720
128959 |  | 7 | 15 | 1875 | 9500 | 708
129022 |  | 7 | 15 | 1877 | 9508 | 739
129023 |  | 7 | 16 | 1887 | 9538 | 732
131070 |  | 7 | 16 | 1895 | 9564 | 754
131071 |  | 7 | 17 | 1899 | 9576 | 754
237048 |  | 7 | 12 | 1935 | 9768 | 708
237049 |  | 7 | 13 | 1943 | 9796 | 726
237051 |  | 7 | 14 | 1955 | 9834 | 734
237055 |  | 7 | 15 | 1959 | 9846 | 746
237274 |  | 7 | 12 | 1805 | 9334 | 674
237275 |  | 7 | 13 | 1815 | 9366 | 674
237278 |  | 7 | 13 | 1847 | 9484 | 710
237279 |  | 7 | 14 | 1851 | 9496 | 714
237288 |  | 7 | 11 | 1823 | 9364 | 656
237289 |  | 7 | 12 | 1851 | 9470 | 662
237291 |  | 7 | 13 | 1883 | 9586 | 657
237292 |  | 7 | 12 | 1871 | 9548 | 674
237293 |  | 7 | 13 | 1891 | 9612 | 686
237295 |  | 7 | 14 | 1903 | 9650 | 695
237304 |  | 7 | 12 | 1885 | 9590 | 684
237305 |  | 7 | 13 | 1893 | 9618 | 700
237306 |  | 7 | 13 | 1915 | 9704 | 700
237307 |  | 7 | 14 | 1927 | 9742 | 711
237310 |  | 7 | 14 | 1935 | 9768 | 721
237311 |  | 7 | 15 | 1939 | 9780 | 733
237560 |  | 7 | 13 | 1951 | 9832 | 732
237561 |  | 7 | 14 | 1959 | 9860 | 750
237563 |  | 7 | 15 | 1971 | 9898 | 758
237567 |  | 7 | 16 | 1975 | 9910 | 770
241483 |  | 7 | 12 | 1771 | 9210 | 580
241484 |  | 7 | 11 | 1761 | 9182 | 650
241485 |  | 7 | 12 | 1807 | 9338 | 634
241487 |  | 7 | 13 | 1839 | 9454 | 634
241492 |  | 7 | 11 | 1793 | 9276 | 658
241493 |  | 7 | 12 | 1831 | 9408 | 658
241494 |  | 7 | 12 | 1841 | 9456 | 664
241495 |  | 7 | 13 | 1861 | 9520 | 678
241502 |  | 7 | 13 | 1883 | 9604 | 676
241503 |  | 7 | 14 | 1895 | 9642 | 690
241524 |  | 7 | 12 | 1857 | 9504 | 670
241525 |  | 7 | 13 | 1895 | 9636 | 678
241527 |  | 7 | 14 | 1915 | 9700 | 702
241535 |  | 7 | 15 | 1927 | 9738 | 725
241611 |  | 7 | 13 | 1863 | 9522 | 654
241612 |  | 7 | 12 | 1831 | 9428 | 654
241613 |  | 7 | 13 | 1859 | 9512 | 648
241614 |  | 7 | 13 | 1883 | 9604 | 680
241615 |  | 7 | 14 | 1895 | 9642 | 690
241630 |  | 7 | 14 | 1927 | 9760 | 718
241631 |  | 7 | 15 | 1931 | 9772 | 730
241633 |  | 7 | 12 | 1847 | 9476 | 684
241634 |  | 7 | 12 | 1869 | 9540 | 692
241635 |  | 7 | 13 | 1897 | 9644 | 694
241638 |  | 7 | 13 | 1909 | 9680 | 716
241639 |  | 7 | 14 | 1917 | 9708 | 732
241642 |  | 7 | 13 | 1899 | 9652 | 710
241643 |  | 7 | 14 | 1931 | 9766 | 703
241644 |  | 7 | 13 | 1919 | 9728 | 708
241645 |  | 7 | 14 | 1939 | 9792 | 718
241646 |  | 7 | 14 | 1939 | 9792 | 732
241647 |  | 7 | 15 | 1951 | 9830 | 740
241662 |  | 7 | 15 | 1959 | 9856 | 750
241663 |  | 7 | 16 | 1963 | 9868 | 762
245707 |  | 7 | 14 | 1943 | 9802 | 724
245708 |  | 7 | 13 | 1909 | 9702 | 712
245709 |  | 7 | 14 | 1939 | 9792 | 718
245711 |  | 7 | 15 | 1951 | 9830 | 740
245720 |  | 7 | 13 | 1933 | 9772 | 730
245721 |  | 7 | 14 | 1941 | 9800 | 748
245722 |  | 7 | 14 | 1963 | 9884 | 746
245723 |  | 7 | 15 | 1975 | 9922 | 754
245726 |  | 7 | 15 | 1983 | 9948 | 764
245727 |  | 7 | 16 | 1987 | 9960 | 776
245752 |  | 7 | 14 | 1975 | 9920 | 762
245753 |  | 7 | 15 | 1983 | 9948 | 780
245755 |  | 7 | 16 | 1995 | 9986 | 786
245759 |  | 7 | 17 | 1999 | 9998 | 798
255567 |  | 7 | 12 | 1527 | 8466 | [756, 776]
255574 |  | 7 | 11 | 1697 | 8996 | 710
255575 |  | 7 | 12 | 1725 | 9098 | 694
255583 |  | 7 | 13 | 1751 | 9194 | 678
255605 |  | 7 | 12 | 1787 | 9296 | 660
255607 |  | 7 | 13 | 1829 | 9446 | 700
255613 |  | 7 | 13 | 1803 | 9348 | 660
255615 |  | 7 | 14 | 1839 | 9478 | 702
255655 |  | 7 | 12 | 1809 | 9366 | 670
255662 |  | 7 | 12 | 1821 | 9400 | 644
255663 |  | 7 | 13 | 1861 | 9542 | 674
255678 |  | 7 | 13 | 1871 | 9568 | 646
255679 |  | 7 | 14 | 1891 | 9632 | 684
255727 |  | 7 | 14 | 1895 | 9666 | 690
255734 |  | 7 | 13 | 1895 | 9660 | 674
255735 |  | 7 | 14 | 1915 | 9724 | 702
255743 |  | 7 | 15 | 1927 | 9762 | 725
255925 |  | 7 | 13 | 1875 | 9582 | 688
255927 |  | 7 | 14 | 1917 | 9730 | 728
255933 |  | 7 | 14 | 1927 | 9756 | 696
255935 |  | 7 | 15 | 1947 | 9820 | 734
255999 |  | 7 | 16 | 1959 | 9858 | 756
257758 |  | 7 | 14 | 1871 | 9596 | 738
257759 |  | 7 | 15 | 1875 | 9608 | 742
257771 |  | 7 | 14 | 1907 | 9698 | 687
257772 |  | 7 | 13 | 1895 | 9660 | 702
257773 |  | 7 | 14 | 1915 | 9724 | 716
257774 |  | 7 | 14 | 1939 | 9816 | 728
257775 |  | 7 | 15 | 1951 | 9854 | 741
257787 |  | 7 | 15 | 1927 | 9762 | 725
257790 |  | 7 | 15 | 1959 | 9880 | 751
257791 |  | 7 | 16 | 1963 | 9892 | 763
257905 |  | 7 | 13 | 1909 | 9700 | 688
257907 |  | 7 | 14 | 1951 | 9848 | 712
257911 |  | 7 | 15 | 1971 | 9912 | 748
257913 |  | 7 | 14 | 1929 | 9764 | 726
257915 |  | 7 | 15 | 1963 | 9886 | 735
257916 |  | 7 | 14 | 1951 | 9848 | 726
257917 |  | 7 | 15 | 1971 | 9912 | 748
257919 |  | 7 | 16 | 1983 | 9950 | 770
258041 |  | 7 | 15 | 1949 | 9828 | 764
258042 |  | 7 | 15 | 1971 | 9912 | 762
258043 |  | 7 | 16 | 1983 | 9950 | 770
258046 |  | 7 | 16 | 1991 | 9976 | 780
258047 |  | 7 | 17 | 1995 | 9988 | 792
262136 |  | 7 | 15 | 1983 | 9948 | 778
262137 |  | 7 | 16 | 1991 | 9976 | 796
262139 |  | 7 | 17 | 2003 | 10014 | 802
262143 |  | 7 | 18 | 2007 | 10026 | 814
507851 |  | 7 | 15 | 2011 | 10050 | 786
507852 |  | 7 | 14 | 1975 | 9944 | 760
507853 |  | 7 | 15 | 2007 | 10040 | 780
507855 |  | 7 | 16 | 2019 | 10078 | 802
507870 |  | 7 | 16 | 2027 | 10104 | 810
507871 |  | 7 | 17 | 2031 | 10116 | 822
507903 |  | 7 | 18 | 2035 | 10128 | 834
515577 |  | 7 | 15 | 1983 | 9972 | 778
515579 |  | 7 | 16 | 1995 | 10010 | 788
515583 |  | 7 | 17 | 1999 | 10022 | 800
515806 |  | 7 | 15 | 1995 | 10004 | 760
515807 |  | 7 | 16 | 1999 | 10016 | 772
515819 |  | 7 | 15 | 1987 | 9978 | 750
515820 |  | 7 | 14 | 1975 | 9940 | 728
515821 |  | 7 | 15 | 1995 | 10004 | 762
515823 |  | 7 | 16 | 2007 | 10042 | 784
515838 |  | 7 | 16 | 2015 | 10068 | 794
515839 |  | 7 | 17 | 2019 | 10080 | 806
516089 |  | 7 | 16 | 2015 | 10068 | 796
516091 |  | 7 | 17 | 2027 | 10106 | 816
516095 |  | 7 | 18 | 2031 | 10118 | 828
524239 |  | 7 | 17 | 2027 | 10106 | 818
524254 |  | 7 | 17 | 2035 | 10132 | 826
524255 |  | 7 | 18 | 2039 | 10144 | 838
524287 |  | 7 | 19 | 2043 | 10156 | 850
1048059 |  | 7 | 18 | 2047 | 10170 | 846
1048063 |  | 7 | 19 | 2051 | 10182 | 858
1048575 |  | 7 | 20 | 2055 | 10194 | 870
2097151 |  | 7 | 21 | 2059 | 10206 | [882](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path2097151)
2168480 |  | 8 | 7 | 2401 | 16320 | [2400](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path2168480)
6466304 |  | 8 | 8 | 3457 | 22464 | 3256
6533952 |  | 8 | 10 | 4125 | 25608 | [2118, 2120]
6709089 |  | 8 | 13 | 4627 | 28128 | [1860, 1868]
15054720 |  | 8 | 12 | 5273 | 30912 | [1457, 1488]
15062688 |  | 8 | 12 | 5313 | 30992 | [1448, 1488]
15071136 |  | 8 | 14 | 5569 | 32168 | [1512, 1528]
33150580 |  | 8 | 16 | 5865 | 33504 | 1560
268435455 |  | 8 | 28 | 6305 | 34992 | 2032
272804608 |  | 9 | 8 | 6649 | 50592 | 6648
816133056 |  | 9 | 12 | 12675 | 86200 | [4692, 4810]
816140800 |  | 9 | 9 | 9577 | 69984 | [9230, 9264]
820437760 |  | 9 | 12 | 12305 | 85384 | [6333, 6562]
830985889 |  | 9 | 15 | 14715 | 96876 | [3253, 3638]
1932875168 |  | 9 | 15 | 16387 | 105516 | [3215, 3378]
1932907696 |  | 9 | 16 | 16891 | 107960 | [0, 3378]
1932908036 |  | 9 | 15 | 15579 | 102576 | [3796, 3920]
4076070560 |  | 9 | 18 | 17923 | 113076 | [3343, 3402]
4135458444 |  | 9 | 18 | 17767 | 112572 | [3140, 3276]
68719476735 |  | 9 | 36 | 19171 | 118098 | 4590
69267182080 |  | 10 | 9 | 18413 | 155052 | 18412
207522258944 |  | 10 | 10 | 26525 | 215340 | [25933, 26044]
208065556480 |  | 10 | 13 | 35117 | 269608 | [18344, 19398]
209488594209 |  | 10 | 17 | 40413 | 303976 | [0, 18952]
484034048000 |  | 10 | 15 | 45285 | 329600 | [9356, 11090]
484034564608 |  | 10 | 15 | 45245 | 329640 | [9358, 10310]
484048828416 |  | 10 | 17 | 48677 | 347336 | [7490, 8876]
35184372088831 |  | 10 | 45 | 58025 | 393660 | 10220
35323174871040 |  | 11 | 10 | 50991 | 470778 | 50990
105899441274880 |  | 11 | 11 | 73459 | 655974 | [31100, 72688]
106037702582272 |  | 11 | 15 | 104951 | 881642 | [0, 63720]
36028797018963967 |  | 11 | 55 | 175099 | 1299078 | 22506
36099512088150016 |  | 12 | 11 | 141209 | 1418352 | 141208
108263005566271488 |  | 12 | 12 | 203433 | 1981728 | [96974, 202032]
108263350782918656 |  | 12 | 17 | 321689 | 2873612 | [99104, 131416]
108333582633402368 |  | 12 | 16 | 299681 | 2737544 | [153661, 192074]
108511984910469665 |  | 12 | 21 | 387763 | 3350876 | [0, 85226]
108512163153855521 |  | 12 | 21 | 354189 | 3167808 | [0, 184646]
252590061719912448 |  | 12 | 18 | 386229 | 3374784 | [51261, 97928]
252590061786513408 |  | 12 | 18 | 386225 | 3374352 | [0, 105292]
252590612549468160 |  | 12 | 20 | 415865 | 3565936 | [0, 75426]
252590612683702272 |  | 12 | 22 | 437593 | 3725240 | [0, 74100]
253083261389635584 |  | 12 | 20 | 419065 | 3575408 | [0, 69448]
253084088995282944 |  | 12 | 21 | 433353 | 3673776 | [0, 65132]
253084155833548800 |  | 12 | 22 | 448765 | 3774336 | [0, 52014]
253158749555917124 |  | 12 | 21 | 407501 | 3538188 | [0, 109136]
541243891326517248 |  | 12 | 24 | 480897 | 3987024 | [0, 40892]
542232239771271200 |  | 12 | 24 | 474585 | 3956640 | [32878, 46040]
542232240836624416 |  | 12 | 24 | 475001 | 3957424 | [0, 45560]
73786976294838206463 |  | 12 | 66 | 527345 | 4251528 | 49128

Column | Description
------ | -----------
id | Written in binary this encodes the edges in the board graph. Multiple id numbers describe isomorphic graphs; only the smallest id for each isomorphy class is listed.
board graph | Depiction of the board graph.
board nodes | Number of nodes in the board graph.
board edges | Number of edges in the board graph.
game nodes | Number of nodes in the game graph. Corresponds to the number of legal positions.
game edges | Number of edges in the game graph. Corresponds to the number of distinct moves.
longest path | Length of the longest simple path starting at node 1 (empty position). This is measured by the number of edges, or equivalently go moves, in the path. Written as an interval if there is a gap between the lower and the upper bound. A lower bound of 0 means that no serious attempt to find a long path has been made.

Note: The table contains no board graphs with isolated nodes since
they induce game graphs isomorphic to the same graph without the
isolated nodes.

## Go Game Mechanics for Mathematicians
The game mechanics of go can be described in terms of graph theory. We
leave aside the questions about how to compute scores or determine the
winner, which are certainly very interesting in themselves but not
needed to derive the game graphs.

Go is played on a board which in abstract form is an undirected graph.
Normally this forms a 19x19 cartesian grid but here we consider any
such graph.

Call the board graph `B`. Two nodes in `B` are called neighbors if
there is an edge between them. Each node has one of three labels,
`Empty`, `White`, or `Black`, and we call a configuration of labels
on `B` a position. The game starts from the position where all labels
are `Empty` (the empty position). Moves consist of turning one `Empty`
node into `White` or `Black`, which can have side effects for the
labels elsewhere on the board graph. Specifically, making a `Black`
move at node `N` consists of the following steps:
 * Change the label of `N` from `Empty` to `Black`.
 * For each neighbor `N'` of `N` with `White` label, find the maximum
   connected component `C` of `White` labelled nodes that includes
   `N'`. If no node of `C` has a neighbor with `Empty` label, change
   the label of all nodes in `C` to `Empty`.
 * Find the maximum connected component `C` of `Black` labelled
   nodes that includes `N`. If no node of `C` has a neighbor with
   `Empty` label, change the label of all nodes in `C` to `Empty`.

Making a `White` move is done conversely, with opposite roles of the
`White` and `Black` labels.

A position can be reached by a sequence of moves if and only if each
maximum connected component of `White` or `Black` nodes is neighbor
to at least one `Empty` node. These positions are called legal
positions.

Now we can form a secondary graph structure called a Game Graph `G`,
with the set of legal positions on `B` as nodes and an edge from `p1`
to `p2` if and only if `p1 != p2` and there is a move transforming
`p1` into `p2`.

Remarks:
 * If a move made at node `N` results in `N` becoming empty, it is
   called a suicide in go terminology and is forbidden by some go rule
   variants.
 * Here suicide moves are allowed unless they lead to the same position
   being immediately repeated (single stone suicide in go
   terminology). The latter prevents self-edges in the game graphs.
 * Normal go is played with alternating colors. This is not taken into
   account here, neither are passes. In fact, consecutive moves by the
   same color can be simulated by the other color passing.
 * Isolated nodes in the board graph can never be labeled anything
   other than `Empty` and the induced game graph will be isomorphic to
   the one induced from a board where the isolated node is removed.
