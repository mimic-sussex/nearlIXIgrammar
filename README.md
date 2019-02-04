# eppgrammar


Compile eppgrammar files to a JavaScript module
```
$ nearleyc nearlIXIgrammar.ne -o nearlIXIprocessor.js
```

Test eppprocessor against input
```
$ nearley-test ./nearlIXIprocessor.js --input '|x xo xox xox|'
```

Generate a railroad diagram for eppgrammar
```
$ nearley-railroad nearlIXIgrammar.ne -o nearlIXIgrammar.html
```


## License
MIT
