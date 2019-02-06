# Builtins make your parser slower. For efficiency, use lexer like Moo

# https://github.com/no-context/moo/issues/113
# suggests
# include the moo JS file in your page, and then use `var moo = window.moo` in your Nearley grammar instead of require().
# instead of
# const moo = require("moo"); // this 'require' creates a node dependency


@{%

const moo = require("moo"); // this 'require' creates a node dependency

const lexer = moo.compile({
  functionkeyword: ['doze', 'perk', 'nap', 'shake', 'swap', '>shift', 'shift<', 'inverse', 'expand', 'reverse'],
  functionname: /[a-zA-Z][a-zA-Z0-9]*/,
  number: /[-+]?[0-9]*\.?[0-9]+/,
  ws: {match: /\s+/, lineBreaks: true},
  lparen: /\(/,
  rparen: /\)/,
  lbrack: /\[/,
  rbrack: /\]/,
  lbrace: /\{/,
  rbrace: /\}/,
  pipe: /\|/,
  mult: /\*/,
  div: /\\/,
  add: /\+/,
  dot: /\./,
  assign: /->/,
  effectin: />>/,
  effectout: /<</,
  ampmore: /\(\(/,
  ampless: /\)\)/,
  silence: /!/,
  transpmore: /\+/,
  transpless: /\-/
});
%}


# Pass your lexer object using the @lexer option
@lexer lexer

main -> _ Statement _

Statement ->
          Agent _ Operator _ Mode {%
                                  function(d) {
                                    return {
                                      agentName: d[0],
                                      operator: d[2],
                                      mode: d[4]
                                    };
                                  }
                                  %}
          | Agent _ Operator _ Name {%
                                    function(d) {
                                      return {
                                        agentName: d[0],
                                        operator: d[2],
                                        effect: d[4]
                                      };
                                    }
                                    %}

Agent -> Name {% id %}

Mode ->
     Melodic {% id %}
     | Percussive {% id %}
     | Concrete {% id %}

Melodic -> Name %lbrack [0-9 ]:+ %rbrack PostScoreOperator  {%
                                                            function(d) {
                                                              return{
                                                                scoreType: "Melodic",
                                                                instrument: d[0],
                                                                score: d[2].join(),
                                                                postScoreOperator: d[4] //
                                                              };
                                                            }
                                                            %}

Percussive -> %pipe [a-zA-Z0-9 ]:+ %pipe PostScoreOperator  {%
                                                            function(d) {
                                                              return{
                                                                scoreType: "Percussive",
                                                                score: d[1].join(),
                                                                postScoreOperator: d[3] //
                                                              };
                                                            }
                                                            %}

Concrete -> Name %lbrace [0-9 ]:+ %rbrace PostScoreOperator {%
                                                            function(d) {
                                                              return{
                                                                scoreType: "Concrete",
                                                                instrument: d[0],
                                                                score: d[2].join(),
                                                                postScoreOperator: d[4] //
                                                              };
                                                            }
                                                            %}

Name ->
     %functionname {% id %}
     | %functionkeyword {% id %}

Operator ->
         %assign {% id %}
         | %effectin {% id %}
         | %effectout {% id %}
         | %ampmore {% id %}
         | %ampless {% id %}

PostScoreOperator ->
                  %silence {% id %}
                  | %transpmore {% id %}
                  | %transpless {% id %}
                  | %mult {% id %}
                  | null

# Whitespace
_  -> wschar:* {% function(d) {return null;} %}
__ -> wschar:+ {% function(d) {return null;} %}

wschar -> %ws {% id %}
