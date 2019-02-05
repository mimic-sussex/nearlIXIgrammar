# NearlIXIgrammar


Compile nearlIXIgrammar files to a JavaScript module
```
$ nearleyc nearlIXIgrammar.ne -o nearlIXIprocessor.js
```

Test nearlIXIprocessor against input
```
$ nearley-test ./nearlIXIprocessor.js --input 'perc -> |x xo xox xox|'          # Percussive mode
$ nearley-test ./nearlIXIprocessor.js --input 'mel -> fle[1 3 45 67 2]'         # Melodic mode
$ nearley-test ./nearlIXIprocessor.js --input 'connie -> marimba{1 3 45 67 2}!' # Concréte mode with Silence Post-score Operator

$ nearley-test ./nearlIXIprocessor.js --input 'joe >> reverb'                   # Routing agent through reverb
```

Generate a railroad diagram for nearlIXIgrammar
```
$ nearley-railroad nearlIXIgrammar.ne -o nearlIXIgrammar.html
```

Run unit tests
```
$ yarn run test
```




## License
MIT
