# Builtins make your parser slower. For efficiency, use lexer like Moo
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

main -> _ Statement _ {% function(d) {return d[0]; } %}

Statement ->
  Agent _ Operator _ Mode {%
    function(d) {
      return {
        agentName: d[0],
        operator: d[1],
        effect: d[2]
      };
    }
%}
  | Agent _ Operator _ %functionkeyword {%
    function(d) {
      return {
        agentName: d[0],
        operator: d[1],
        effect: d[2]
      };
    }
%}

Agent -> Name {% function(d) {return "yay!"; } %}

Mode ->
  Melodic {% id %}
  | Percussive {% id %}
  | Concrete {% id %}

Melodic -> Name %lbrack [0-9 ]:+ %rbrack PostScoreOperator {%
  function(d) {
    return{
      scoreType: "Melodic",
      instrument: d[0],
      score:  d[2],
      postScoreOperator: d[4] //
    };
  }
%}

Percussive -> %pipe [a-zA-Z0-9 ]:+ %pipe PostScoreOperator{%
  function(d) {
    return{
      scoreType: "Percussive",
      instrument: d[0],
      score:  d[2],
      postScoreOperator: d[4] //
    };
  }
%}

Concrete -> Name %lbrace [0-9 ]:+ %rbrace PostScoreOperator {%
  function(d) {
    return{
      scoreType: "Concrete",
      instrument: d[0],
      score:  d[2],
      postScoreOperator: d[4] //
    };
  }
%}

Name ->
    %functionname
    | %functionkeyword

Operator ->
  %assign {% id %}
  | %effectin {% id %}
  | %effectout {% id %}
  | %ampmore {% id %}
  | %ampless {% id %}

PostScoreOperator ->
  %silence
  | %transpmore
  | %transpless
  | %mult
  | null

  # Whitespace
_  -> wschar:* {% function(d) {return null;} %}
__ -> wschar:+ {% function(d) {return null;} %}

wschar -> %ws {% id %}



# Number -> _number {% function(d) {return {'literal': parseFloat(d[0])}} %}
#
# _posint ->
#   [0-9] {% id %}
#   | _posint [0-9] {% function(d) {return d[0] + d[1]} %}
#
# _int ->
# 	"-" _posint {% function(d) {return d[0] + d[1]; }%}
# 	| _posint {% id %}
#
# _float ->
# 	_int {% id %}
#   | _int "." _posint {% function(d) {return d[0] + d[1] + d[2]; }%}
#   | "." _posint {% function(d) {return "0" + d[0] + d[1]; }%}
#
# _number ->
#   _float {% id %}
#   | _float "e" _int {% function(d){return d[0] + d[1] + d[2]; } %}






# _ -> null | _ [\s] {% function() {} %}
# __ -> [\s] | __ [\s] {% function() {} %}
