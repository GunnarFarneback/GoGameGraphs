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
They range from very small up to arbitrarily large sizes and would
be useful for testing various graph algorithms applicable to this kind
of graph.

This repository provides:
* Code in Julia and C to generate all Go Game Graphs induced from
Board Graphs with up to 12 nodes.
* A list of properties of all Go Game Graphs induced from Board Graphs
with up to 6 nodes, and a selection of larger ones.
* Sample maximum length paths.


### Table of Small Go Game Graphs

This table contains all unique Go Game Graphs (up to isomorphism)
induced from board graphs with up to 6 nodes, and a selection of
larger ones. More explanations follow after the table.

id | board graph | board nodes | board edges | game nodes | game edges | longest path
--- | ---------- | ----------- | ----------- | ---------- | ---------- | ------------
[1](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph1) | ![graph1](http://www.lysator.liu.se/~gunnar/graphs/graph1.svg) | 2 | 1 | 5 | 12 | [3](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1)
[3](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph3) | ![graph3](http://www.lysator.liu.se/~gunnar/graphs/graph3.svg) | 3 | 2 | 15 | 42 | [15](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3)
[7](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph7) | ![graph7](http://www.lysator.liu.se/~gunnar/graphs/graph7.svg) | 3 | 3 | 19 | 54 | [19](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7)
[11](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph11) | ![graph11](http://www.lysator.liu.se/~gunnar/graphs/graph11.svg) | 4 | 3 | 41 | 138 | [33](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path11)
[12](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph12) | ![graph12](http://www.lysator.liu.se/~gunnar/graphs/graph12.svg) | 4 | 2 | 25 | 120 | [25](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path12)
[13](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph13) | ![graph13](http://www.lysator.liu.se/~gunnar/graphs/graph13.svg) | 4 | 3 | 41 | 144 | [41](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path13)
[15](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph15) | ![graph15](http://www.lysator.liu.se/~gunnar/graphs/graph15.svg) | 4 | 4 | 49 | 166 | [43](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path15)
[30](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph30) | ![graph30](http://www.lysator.liu.se/~gunnar/graphs/graph30.svg) | 4 | 4 | 57 | 192 | [49](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path30)
[31](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph31) | ![graph31](http://www.lysator.liu.se/~gunnar/graphs/graph31.svg) | 4 | 5 | 61 | 204 | [51](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path31)
[63](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/graphs/graph63) | ![graph63](http://www.lysator.liu.se/~gunnar/graphs/graph63.svg) | 4 | 6 | 65 | 216 | [57](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path63)
75 | ![graph75](http://www.lysator.liu.se/~gunnar/graphs/graph75.svg) | 5 | 4 | 111 | 450 | [60](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path75)
76 | ![graph76](http://www.lysator.liu.se/~gunnar/graphs/graph76.svg) | 5 | 3 | 75 | 390 | [75](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path76)
77 | ![graph77](http://www.lysator.liu.se/~gunnar/graphs/graph77.svg) | 5 | 4 | 107 | 442 | [95](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path77)
79 | ![graph79](http://www.lysator.liu.se/~gunnar/graphs/graph79.svg) | 5 | 5 | 127 | 514 | [80](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path79)
86 | ![graph86](http://www.lysator.liu.se/~gunnar/graphs/graph86.svg) | 5 | 4 | 113 | 492 | [113](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path86)
87 | ![graph87](http://www.lysator.liu.se/~gunnar/graphs/graph87.svg) | 5 | 5 | 125 | 508 | [103](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path87)
94 | ![graph94](http://www.lysator.liu.se/~gunnar/graphs/graph94.svg) | 5 | 5 | 143 | 578 | [105](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path94)
95 | ![graph95](http://www.lysator.liu.se/~gunnar/graphs/graph95.svg) | 5 | 6 | 151 | 602 | [100](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path95)
116 | ![graph116](http://www.lysator.liu.se/~gunnar/graphs/graph116.svg) | 5 | 4 | 95 | 498 | [95](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path116)
117 | ![graph117](http://www.lysator.liu.se/~gunnar/graphs/graph117.svg) | 5 | 5 | 131 | 558 | [123](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path117)
119 | ![graph119](http://www.lysator.liu.se/~gunnar/graphs/graph119.svg) | 5 | 6 | 151 | 606 | [109](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path119)
127 | ![graph127](http://www.lysator.liu.se/~gunnar/graphs/graph127.svg) | 5 | 7 | 159 | 630 | [112](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path127)
222 | ![graph222](http://www.lysator.liu.se/~gunnar/graphs/graph222.svg) | 5 | 6 | 183 | 720 | [117](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path222)
223 | ![graph223](http://www.lysator.liu.se/~gunnar/graphs/graph223.svg) | 5 | 7 | 187 | 732 | [119](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path223)
235 | ![graph235](http://www.lysator.liu.se/~gunnar/graphs/graph235.svg) | 5 | 6 | 151 | 626 | [104](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path235)
236 | ![graph236](http://www.lysator.liu.se/~gunnar/graphs/graph236.svg) | 5 | 5 | 161 | 660 | [131](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path236)
237 | ![graph237](http://www.lysator.liu.se/~gunnar/graphs/graph237.svg) | 5 | 6 | 173 | 692 | [123](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path237)
239 | ![graph239](http://www.lysator.liu.se/~gunnar/graphs/graph239.svg) | 5 | 7 | 183 | 722 | [117](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path239)
254 | ![graph254](http://www.lysator.liu.se/~gunnar/graphs/graph254.svg) | 5 | 7 | 191 | 748 | [131](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path254)
255 | ![graph255](http://www.lysator.liu.se/~gunnar/graphs/graph255.svg) | 5 | 8 | 195 | 760 | [131](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path255)
507 | ![graph507](http://www.lysator.liu.se/~gunnar/graphs/graph507.svg) | 5 | 8 | 203 | 786 | [135](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path507)
511 | ![graph511](http://www.lysator.liu.se/~gunnar/graphs/graph511.svg) | 5 | 9 | 207 | 798 | [143](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path511)
1023 | ![graph1023](http://www.lysator.liu.se/~gunnar/graphs/graph1023.svg) | 5 | 10 | 211 | 810 | [151](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1023)
1099 | ![graph1099](http://www.lysator.liu.se/~gunnar/graphs/graph1099.svg) | 6 | 5 | 305 | 1466 | [95](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1099)
1100 | ![graph1100](http://www.lysator.liu.se/~gunnar/graphs/graph1100.svg) | 6 | 4 | 205 | 1182 | [205](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1100)
1101 | ![graph1101](http://www.lysator.liu.se/~gunnar/graphs/graph1101.svg) | 6 | 5 | 281 | 1356 | [172](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1101)
1103 | ![graph1103](http://www.lysator.liu.se/~gunnar/graphs/graph1103.svg) | 6 | 6 | 337 | 1610 | [131](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1103)
1108 | ![graph1108](http://www.lysator.liu.se/~gunnar/graphs/graph1108.svg) | 6 | 4 | 225 | 1260 | [225](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1108)
1109 | ![graph1109](http://www.lysator.liu.se/~gunnar/graphs/graph1109.svg) | 6 | 5 | 273 | 1308 | [193](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1109)
1110 | ![graph1110](http://www.lysator.liu.se/~gunnar/graphs/graph1110.svg) | 6 | 5 | 295 | 1476 | [283](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1110)
1111 | ![graph1111](http://www.lysator.liu.se/~gunnar/graphs/graph1111.svg) | 6 | 6 | 319 | 1514 | [208](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1111)
1118 | ![graph1118](http://www.lysator.liu.se/~gunnar/graphs/graph1118.svg) | 6 | 6 | 365 | 1732 | [190](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1118)
1119 | ![graph1119](http://www.lysator.liu.se/~gunnar/graphs/graph1119.svg) | 6 | 7 | 385 | 1810 | [172](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1119)
1140 | ![graph1140](http://www.lysator.liu.se/~gunnar/graphs/graph1140.svg) | 6 | 5 | 285 | 1608 | [285](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1140)
1141 | ![graph1141](http://www.lysator.liu.se/~gunnar/graphs/graph1141.svg) | 6 | 6 | 337 | 1660 | [280](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1141)
1143 | ![graph1143](http://www.lysator.liu.se/~gunnar/graphs/graph1143.svg) | 6 | 7 | 381 | 1796 | [198](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1143)
1151 | ![graph1151](http://www.lysator.liu.se/~gunnar/graphs/graph1151.svg) | 6 | 8 | 401 | 1874 | [193](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1151)
1182 | ![graph1182](http://www.lysator.liu.se/~gunnar/graphs/graph1182.svg) | 6 | 6 | 363 | 1732 | [249](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1182)
1183 | ![graph1183](http://www.lysator.liu.se/~gunnar/graphs/graph1183.svg) | 6 | 7 | 375 | 1752 | [220](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1183)
1184 | ![graph1184](http://www.lysator.liu.se/~gunnar/graphs/graph1184.svg) | 6 | 3 | 125 | 900 | [125](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1184)
1185 | ![graph1185](http://www.lysator.liu.se/~gunnar/graphs/graph1185.svg) | 6 | 4 | 205 | 1212 | [205](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1185)
1187 | ![graph1187](http://www.lysator.liu.se/~gunnar/graphs/graph1187.svg) | 6 | 5 | 283 | 1412 | [257](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1187)
1191 | ![graph1191](http://www.lysator.liu.se/~gunnar/graphs/graph1191.svg) | 6 | 6 | 311 | 1476 | [247](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1191)
1194 | ![graph1194](http://www.lysator.liu.se/~gunnar/graphs/graph1194.svg) | 6 | 5 | 245 | 1418 | [245](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1194)
1195 | ![graph1195](http://www.lysator.liu.se/~gunnar/graphs/graph1195.svg) | 6 | 6 | 329 | 1612 | [236](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1195)
1196 | ![graph1196](http://www.lysator.liu.se/~gunnar/graphs/graph1196.svg) | 6 | 5 | 313 | 1620 | [313](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1196)
1197 | ![graph1197](http://www.lysator.liu.se/~gunnar/graphs/graph1197.svg) | 6 | 6 | 357 | 1696 | [235](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1197)
1198 | ![graph1198](http://www.lysator.liu.se/~gunnar/graphs/graph1198.svg) | 6 | 6 | 339 | 1686 | [319](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1198)
1199 | ![graph1199](http://www.lysator.liu.se/~gunnar/graphs/graph1199.svg) | 6 | 7 | 373 | 1750 | [230](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1199)
1214 | ![graph1214](http://www.lysator.liu.se/~gunnar/graphs/graph1214.svg) | 6 | 7 | 379 | 1796 | [263](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1214)
1215 | ![graph1215](http://www.lysator.liu.se/~gunnar/graphs/graph1215.svg) | 6 | 8 | 391 | 1816 | [240](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1215)
1246 | ![graph1246](http://www.lysator.liu.se/~gunnar/graphs/graph1246.svg) | 6 | 7 | 449 | 2082 | [218](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1246)
1247 | ![graph1247](http://www.lysator.liu.se/~gunnar/graphs/graph1247.svg) | 6 | 8 | 457 | 2106 | [213](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1247)
1259 | ![graph1259](http://www.lysator.liu.se/~gunnar/graphs/graph1259.svg) | 6 | 7 | 385 | 1858 | [185](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1259)
1260 | ![graph1260](http://www.lysator.liu.se/~gunnar/graphs/graph1260.svg) | 6 | 6 | 403 | 1936 | [287](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1260)
1261 | ![graph1261](http://www.lysator.liu.se/~gunnar/graphs/graph1261.svg) | 6 | 7 | 427 | 2004 | [238](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1261)
1263 | ![graph1263](http://www.lysator.liu.se/~gunnar/graphs/graph1263.svg) | 6 | 8 | 449 | 2082 | [211](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1263)
1268 | ![graph1268](http://www.lysator.liu.se/~gunnar/graphs/graph1268.svg) | 6 | 6 | 363 | 1856 | [357](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1268)
1269 | ![graph1269](http://www.lysator.liu.se/~gunnar/graphs/graph1269.svg) | 6 | 7 | 387 | 1890 | [290](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1269)
1270 | ![graph1270](http://www.lysator.liu.se/~gunnar/graphs/graph1270.svg) | 6 | 7 | 429 | 2028 | [266](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1270)
1271 | ![graph1271](http://www.lysator.liu.se/~gunnar/graphs/graph1271.svg) | 6 | 8 | 447 | 2074 | [232](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1271)
1278 | ![graph1278](http://www.lysator.liu.se/~gunnar/graphs/graph1278.svg) | 6 | 8 | 465 | 2146 | [242](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1278)
1279 | ![graph1279](http://www.lysator.liu.se/~gunnar/graphs/graph1279.svg) | 6 | 9 | 473 | 2170 | [237](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1279)
1456 | ![graph1456](http://www.lysator.liu.se/~gunnar/graphs/graph1456.svg) | 6 | 5 | 285 | 1644 | [285](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1456)
1457 | ![graph1457](http://www.lysator.liu.se/~gunnar/graphs/graph1457.svg) | 6 | 6 | 383 | 1898 | [334](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1457)
1459 | ![graph1459](http://www.lysator.liu.se/~gunnar/graphs/graph1459.svg) | 6 | 7 | 445 | 2068 | [241](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1459)
1460 | ![graph1460](http://www.lysator.liu.se/~gunnar/graphs/graph1460.svg) | 6 | 6 | 305 | 1752 | [305](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1460)
1461 | ![graph1461](http://www.lysator.liu.se/~gunnar/graphs/graph1461.svg) | 6 | 7 | 401 | 1972 | [324](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1461)
1463 | ![graph1463](http://www.lysator.liu.se/~gunnar/graphs/graph1463.svg) | 6 | 8 | 453 | 2096 | [245](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1463)
1465 | ![graph1465](http://www.lysator.liu.se/~gunnar/graphs/graph1465.svg) | 6 | 7 | 431 | 2040 | [290](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1465)
1467 | ![graph1467](http://www.lysator.liu.se/~gunnar/graphs/graph1467.svg) | 6 | 8 | 463 | 2134 | [258](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1467)
1468 | ![graph1468](http://www.lysator.liu.se/~gunnar/graphs/graph1468.svg) | 6 | 7 | 407 | 2014 | [356](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1468)
1469 | ![graph1469](http://www.lysator.liu.se/~gunnar/graphs/graph1469.svg) | 6 | 8 | 451 | 2112 | [269](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1469)
1471 | ![graph1471](http://www.lysator.liu.se/~gunnar/graphs/graph1471.svg) | 6 | 9 | 471 | 2162 | [258](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1471)
1531 | ![graph1531](http://www.lysator.liu.se/~gunnar/graphs/graph1531.svg) | 6 | 9 | 489 | 2230 | [245](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1531)
1532 | ![graph1532](http://www.lysator.liu.se/~gunnar/graphs/graph1532.svg) | 6 | 8 | 469 | 2184 | [276](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1532)
1533 | ![graph1533](http://www.lysator.liu.se/~gunnar/graphs/graph1533.svg) | 6 | 9 | 489 | 2234 | [256](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1533)
1535 | ![graph1535](http://www.lysator.liu.se/~gunnar/graphs/graph1535.svg) | 6 | 10 | 497 | 2258 | [261](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1535)
1972 | ![graph1972](http://www.lysator.liu.se/~gunnar/graphs/graph1972.svg) | 6 | 7 | 325 | 1860 | [325](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1972)
1973 | ![graph1973](http://www.lysator.liu.se/~gunnar/graphs/graph1973.svg) | 6 | 8 | 425 | 2088 | [360](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1973)
1975 | ![graph1975](http://www.lysator.liu.se/~gunnar/graphs/graph1975.svg) | 6 | 9 | 477 | 2212 | [283](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1975)
1983 | ![graph1983](http://www.lysator.liu.se/~gunnar/graphs/graph1983.svg) | 6 | 10 | 497 | 2262 | [271](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path1983)
2047 | ![graph2047](http://www.lysator.liu.se/~gunnar/graphs/graph2047.svg) | 6 | 11 | 505 | 2286 | [276](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path2047)
3294 | ![graph3294](http://www.lysator.liu.se/~gunnar/graphs/graph3294.svg) | 6 | 8 | 561 | 2544 | [257](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3294)
3295 | ![graph3295](http://www.lysator.liu.se/~gunnar/graphs/graph3295.svg) | 6 | 9 | 565 | 2556 | [259](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3295)
3306 | ![graph3306](http://www.lysator.liu.se/~gunnar/graphs/graph3306.svg) | 6 | 7 | 437 | 2128 | [277](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3306)
3307 | ![graph3307](http://www.lysator.liu.se/~gunnar/graphs/graph3307.svg) | 6 | 8 | 457 | 2206 | [250](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3307)
3308 | ![graph3308](http://www.lysator.liu.se/~gunnar/graphs/graph3308.svg) | 6 | 7 | 507 | 2368 | [291](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3308)
3309 | ![graph3309](http://www.lysator.liu.se/~gunnar/graphs/graph3309.svg) | 6 | 8 | 519 | 2404 | [283](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3309)
3310 | ![graph3310](http://www.lysator.liu.se/~gunnar/graphs/graph3310.svg) | 6 | 8 | 535 | 2458 | [255](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3310)
3311 | ![graph3311](http://www.lysator.liu.se/~gunnar/graphs/graph3311.svg) | 6 | 9 | 545 | 2490 | [252](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3311)
3326 | ![graph3326](http://www.lysator.liu.se/~gunnar/graphs/graph3326.svg) | 6 | 9 | 577 | 2608 | [279](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3326)
3327 | ![graph3327](http://www.lysator.liu.se/~gunnar/graphs/graph3327.svg) | 6 | 10 | 581 | 2620 | [281](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3327)
3440 | ![graph3440](http://www.lysator.liu.se/~gunnar/graphs/graph3440.svg) | 6 | 6 | 449 | 2196 | [371](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3440)
3441 | ![graph3441](http://www.lysator.liu.se/~gunnar/graphs/graph3441.svg) | 6 | 7 | 481 | 2300 | [339](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3441)
3443 | ![graph3443](http://www.lysator.liu.se/~gunnar/graphs/graph3443.svg) | 6 | 8 | 509 | 2380 | [281](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3443)
3447 | ![graph3447](http://www.lysator.liu.se/~gunnar/graphs/graph3447.svg) | 6 | 9 | 533 | 2448 | [247](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3447)
3448 | ![graph3448](http://www.lysator.liu.se/~gunnar/graphs/graph3448.svg) | 6 | 7 | 489 | 2312 | [293](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3448)
3449 | ![graph3449](http://www.lysator.liu.se/~gunnar/graphs/graph3449.svg) | 6 | 8 | 513 | 2400 | [283](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3449)
3451 | ![graph3451](http://www.lysator.liu.se/~gunnar/graphs/graph3451.svg) | 6 | 9 | 537 | 2482 | [253](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3451)
3452 | ![graph3452](http://www.lysator.liu.se/~gunnar/graphs/graph3452.svg) | 6 | 8 | 545 | 2508 | [299](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3452)
3453 | ![graph3453](http://www.lysator.liu.se/~gunnar/graphs/graph3453.svg) | 6 | 9 | 559 | 2548 | [285](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3453)
3455 | ![graph3455](http://www.lysator.liu.se/~gunnar/graphs/graph3455.svg) | 6 | 10 | 569 | 2578 | [277](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3455)
3576 | ![graph3576](http://www.lysator.liu.se/~gunnar/graphs/graph3576.svg) | 6 | 8 | 553 | 2524 | [275](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3576)
3577 | ![graph3577](http://www.lysator.liu.se/~gunnar/graphs/graph3577.svg) | 6 | 9 | 561 | 2552 | [281](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3577)
3578 | ![graph3578](http://www.lysator.liu.se/~gunnar/graphs/graph3578.svg) | 6 | 9 | 583 | 2640 | [293](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3578)
3579 | ![graph3579](http://www.lysator.liu.se/~gunnar/graphs/graph3579.svg) | 6 | 10 | 593 | 2670 | [287](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3579)
3582 | ![graph3582](http://www.lysator.liu.se/~gunnar/graphs/graph3582.svg) | 6 | 10 | 601 | 2696 | [305](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3582)
3583 | ![graph3583](http://www.lysator.liu.se/~gunnar/graphs/graph3583.svg) | 6 | 11 | 605 | 2708 | [305](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3583)
3873 | ![graph3873](http://www.lysator.liu.se/~gunnar/graphs/graph3873.svg) | 6 | 6 | 361 | 2052 | [361](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3873)
3875 | ![graph3875](http://www.lysator.liu.se/~gunnar/graphs/graph3875.svg) | 6 | 7 | 417 | 2108 | [364](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3875)
3879 | ![graph3879](http://www.lysator.liu.se/~gunnar/graphs/graph3879.svg) | 6 | 8 | 461 | 2240 | [293](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3879)
3885 | ![graph3885](http://www.lysator.liu.se/~gunnar/graphs/graph3885.svg) | 6 | 8 | 513 | 2412 | [291](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3885)
3887 | ![graph3887](http://www.lysator.liu.se/~gunnar/graphs/graph3887.svg) | 6 | 9 | 537 | 2484 | [263](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3887)
3903 | ![graph3903](http://www.lysator.liu.se/~gunnar/graphs/graph3903.svg) | 6 | 10 | 569 | 2580 | [283](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3903)
3947 | ![graph3947](http://www.lysator.liu.se/~gunnar/graphs/graph3947.svg) | 6 | 9 | 481 | 2318 | [276](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3947)
3948 | ![graph3948](http://www.lysator.liu.se/~gunnar/graphs/graph3948.svg) | 6 | 8 | 531 | 2480 | [321](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3948)
3949 | ![graph3949](http://www.lysator.liu.se/~gunnar/graphs/graph3949.svg) | 6 | 9 | 559 | 2570 | [282](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3949)
3950 | ![graph3950](http://www.lysator.liu.se/~gunnar/graphs/graph3950.svg) | 6 | 9 | 543 | 2516 | [311](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3950)
3951 | ![graph3951](http://www.lysator.liu.se/~gunnar/graphs/graph3951.svg) | 6 | 10 | 569 | 2602 | [280](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3951)
3958 | ![graph3958](http://www.lysator.liu.se/~gunnar/graphs/graph3958.svg) | 6 | 9 | 573 | 2612 | [295](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3958)
3959 | ![graph3959](http://www.lysator.liu.se/~gunnar/graphs/graph3959.svg) | 6 | 10 | 589 | 2660 | [283](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3959)
3966 | ![graph3966](http://www.lysator.liu.se/~gunnar/graphs/graph3966.svg) | 6 | 10 | 591 | 2668 | [309](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3966)
3967 | ![graph3967](http://www.lysator.liu.se/~gunnar/graphs/graph3967.svg) | 6 | 11 | 601 | 2698 | [301](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path3967)
4094 | ![graph4094](http://www.lysator.liu.se/~gunnar/graphs/graph4094.svg) | 6 | 11 | 609 | 2724 | [319](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path4094)
4095 | ![graph4095](http://www.lysator.liu.se/~gunnar/graphs/graph4095.svg) | 6 | 12 | 613 | 2736 | [319](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path4095)
7672 | ![graph7672](http://www.lysator.liu.se/~gunnar/graphs/graph7672.svg) | 6 | 9 | 617 | 2760 | [301](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7672)
7673 | ![graph7673](http://www.lysator.liu.se/~gunnar/graphs/graph7673.svg) | 6 | 10 | 625 | 2788 | [317](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7673)
7675 | ![graph7675](http://www.lysator.liu.se/~gunnar/graphs/graph7675.svg) | 6 | 11 | 637 | 2826 | [323](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7675)
7679 | ![graph7679](http://www.lysator.liu.se/~gunnar/graphs/graph7679.svg) | 6 | 12 | 641 | 2838 | [333](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7679)
7902 | ![graph7902](http://www.lysator.liu.se/~gunnar/graphs/graph7902.svg) | 6 | 10 | 601 | 2720 | [305](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7902)
7903 | ![graph7903](http://www.lysator.liu.se/~gunnar/graphs/graph7903.svg) | 6 | 11 | 605 | 2732 | [309](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7903)
7915 | ![graph7915](http://www.lysator.liu.se/~gunnar/graphs/graph7915.svg) | 6 | 10 | 605 | 2726 | [283](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7915)
7916 | ![graph7916](http://www.lysator.liu.se/~gunnar/graphs/graph7916.svg) | 6 | 9 | 593 | 2688 | [301](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7916)
7917 | ![graph7917](http://www.lysator.liu.se/~gunnar/graphs/graph7917.svg) | 6 | 10 | 613 | 2752 | [305](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7917)
7919 | ![graph7919](http://www.lysator.liu.se/~gunnar/graphs/graph7919.svg) | 6 | 11 | 625 | 2790 | [311](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7919)
7934 | ![graph7934](http://www.lysator.liu.se/~gunnar/graphs/graph7934.svg) | 6 | 11 | 633 | 2816 | [319](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7934)
7935 | ![graph7935](http://www.lysator.liu.se/~gunnar/graphs/graph7935.svg) | 6 | 12 | 637 | 2828 | [329](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path7935)
8185 | ![graph8185](http://www.lysator.liu.se/~gunnar/graphs/graph8185.svg) | 6 | 11 | 633 | 2816 | [333](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path8185)
8187 | ![graph8187](http://www.lysator.liu.se/~gunnar/graphs/graph8187.svg) | 6 | 12 | 645 | 2854 | [337](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path8187)
8191 | ![graph8191](http://www.lysator.liu.se/~gunnar/graphs/graph8191.svg) | 6 | 13 | 649 | 2866 | [347](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path8191)
16350 | ![graph16350](http://www.lysator.liu.se/~gunnar/graphs/graph16350.svg) | 6 | 12 | 653 | 2880 | [343](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path16350)
16351 | ![graph16351](http://www.lysator.liu.se/~gunnar/graphs/graph16351.svg) | 6 | 13 | 657 | 2892 | [353](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path16351)
16383 | ![graph16383](http://www.lysator.liu.se/~gunnar/graphs/graph16383.svg) | 6 | 14 | 661 | 2904 | [363](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path16383)
32767 | ![graph32767](http://www.lysator.liu.se/~gunnar/graphs/graph32767.svg) | 6 | 15 | 665 | 2916 | [373](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path32767)
35184 |  | 7 | 6 | 867 | 5190 | [867](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path35184)
104096 |  | 7 | 7 | 1247 | 7098 | [1121](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path104096)
106280 |  | 7 | 9 | 1451 | 7918 | [775](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path106280)
2097151 |  | 7 | 21 | 2059 | 10206 | [883](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path2097151)
2168480 |  | 8 | 7 | 2401 | 16320 | [2401](https://github.com/GunnarFarneback/GoGameGraphs/blob/master/sample_longest_paths/path2168480)
6466304 |  | 8 | 8 | 3457 | 22464 | 3257
6533952 |  | 8 | 10 | 4125 | 25608 | [2117, 2121]
6709089 |  | 8 | 13 | 4627 | 28128 | [1, 1917]
15054720 |  | 8 | 12 | 5273 | 30912 | [1458, 1641]
15062688 |  | 8 | 12 | 5313 | 30992 | [1436, 1489]
15071136 |  | 8 | 14 | 5569 | 32168 | [1504, 1529]
33150580 |  | 8 | 16 | 5865 | 33504 | [1, 1625]
268435455 |  | 8 | 28 | 6305 | 34992 | 2033
272804608 |  | 9 | 8 | 6649 | 50592 | 6649
816133056 |  | 9 | 12 | 12675 | 86200 | [4693, 4871]
816140800 |  | 9 | 9 | 9577 | 69984 | [9231, 9301]
820437760 |  | 9 | 12 | 12305 | 85384 | [1, 6851]
830985889 |  | 9 | 15 | 14715 | 96876 | [1, 3871]
1932875168 |  | 9 | 15 | 16387 | 105516 | [3216, 3277]
1932907696 |  | 9 | 16 | 16891 | 107960 | [1, 3631]
1932908036 |  | 9 | 15 | 15579 | 102576 | [3797, 4107]
4076070560 |  | 9 | 18 | 17923 | 113076 | [1, 3535]
4135458444 |  | 9 | 18 | 17767 | 112572 | [3091, 3403]
68719476735 |  | 9 | 36 | 19171 | 118098 | [1, 4591]
69267182080 |  | 10 | 9 | 18413 | 155052 | 18413
207522258944 |  | 10 | 10 | 26525 | 215340 | [25892, 26075]
208065556480 |  | 10 | 13 | 35117 | 269608 | [18325, 20697]
209488594209 |  | 10 | 17 | 40413 | 303976 | [1, 18953]
484034048000 |  | 10 | 15 | 45285 | 329600 | [1, 11091]
484034564608 |  | 10 | 15 | 45245 | 329640 | [1, 11411]
484048828416 |  | 10 | 17 | 48677 | 347336 | [1, 8877]
35184372088831 |  | 10 | 45 | 58025 | 393660 | [1, 10201]
35323174871040 |  | 11 | 10 | 50991 | 470778 | 50991
105899441274880 |  | 11 | 11 | 73459 | 655974 | [1, 72711]
106037702582272 |  | 11 | 15 | 104951 | 881642 | [1, 63721]
36028797018963967 |  | 11 | 55 | 175099 | 1299078 | [1, 22507]
36099512088150016 |  | 12 | 11 | 141209 | 1418352 | 141209
108263005566271488 |  | 12 | 12 | 203433 | 1981728 | [1, 202057]
108263350782918656 |  | 12 | 17 | 321689 | 2873612 | [98556, 132257]
108333582633402368 |  | 12 | 16 | 299681 | 2737544 | [152814, 192075]
108511984910469665 |  | 12 | 21 | 387763 | 3350876 | [1, 85227]
108512163153855521 |  | 12 | 21 | 354189 | 3167808 | [1, 184647]
252590061719912448 |  | 12 | 18 | 386229 | 3374784 | [1, 106137]
252590061786513408 |  | 12 | 18 | 386225 | 3374352 | [1, 105293]
252590612549468160 |  | 12 | 20 | 415865 | 3565936 | [1, 75427]
252590612683702272 |  | 12 | 22 | 437593 | 3725240 | [1, 74101]
253083261389635584 |  | 12 | 20 | 419065 | 3575408 | [1, 69449]
253084088995282944 |  | 12 | 21 | 433353 | 3673776 | [1, 65133]
253084155833548800 |  | 12 | 22 | 448765 | 3774336 | [1, 52015]
253158749555917124 |  | 12 | 21 | 407501 | 3538188 | [1, 109137]
541243891326517248 |  | 12 | 24 | 480897 | 3987024 | [1, 40893]
542232239771271200 |  | 12 | 24 | 474585 | 3956640 | [1, 46041]
542232240836624416 |  | 12 | 24 | 475001 | 3957424 | [1, 45561]
73786976294838206463 |  | 12 | 66 | 527345 | 4251528 | [1, 49129]

Column | Description
------ | -----------
id | Written in binary this encodes the edges in the board graph. Multiple id numbers describe isomorphic graphs; only the smallest id for each isomorphy class is listed.
board graph | Depiction of the board graph.
board nodes | Number of nodes in the board graph.
board edges | Number of edges in the board graph.
game nodes | Number of nodes in the game graph. Corresponds to the number of legal positions.
game edges | Number of edges in the game graph. Corresponds to the number of distinct moves.
longest path | Length of the longest simple path starting at node 1 (empty position). Written as an interval if there is a gap between the lower and the upper bound. A lower bound of 1 means that no serious attempt to find a long path has been made.

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
