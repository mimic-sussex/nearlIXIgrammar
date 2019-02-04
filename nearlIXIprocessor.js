// Generated automatically by nearley, version 2.16.0
// http://github.com/Hardmath123/nearley
(function () {
function id(x) { return x[0]; }

const moo = require("moo"); // this 'require' creates a node dependency

const lexer = moo.compile({
  functionkeyword: ['sinosc', 'phasor', 'adsr', 'filter', 'samp'],
  functionname: /[a-zA-Z0-9]+?/,
  number: /[-+]?[0-9]*?\.[0-9]+?/,
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
  transpless: /\-/,


});
var grammar = {
    Lexer: lexer,
    ParserRules: [
    {"name": "main", "symbols": ["_", "Statement", "_"]},
    {"name": "Statement", "symbols": ["Agent", "_", "Operator", "_", "Mode"]},
    {"name": "Agent", "symbols": [(lexer.has("functionname") ? {type: "functionname"} : functionname)], "postprocess": function(d) {return d[0];}},
    {"name": "Mode", "symbols": ["Melodic"]},
    {"name": "Mode", "symbols": ["Percussive"]},
    {"name": "Mode", "symbols": ["Concrete"]},
    {"name": "Melodic", "symbols": [(lexer.has("lbrack") ? {type: "lbrack"} : lbrack), {"literal":"/[^a-zA-Z ]/"}, (lexer.has("rbrack") ? {type: "rbrack"} : rbrack)], "postprocess": function(d) {return d[0] + d[1] + d[2]; }},
    {"name": "Percussive", "symbols": [(lexer.has("pipe") ? {type: "pipe"} : pipe), {"literal":"/[^a-zA-Z0-9 ]/"}, (lexer.has("pipe") ? {type: "pipe"} : pipe)], "postprocess": function(d) {return d[0] + d[1] + d[2]; }},
    {"name": "Concrete", "symbols": [(lexer.has("lbrace") ? {type: "lbrace"} : lbrace), {"literal":"/[0-9 ]/"}, (lexer.has("rbrace") ? {type: "rbrace"} : rbrace)], "postprocess": function(d) {return d[0] + d[1] + d[2]; }},
    {"name": "Operator", "symbols": [(lexer.has("assign") ? {type: "assign"} : assign)]},
    {"name": "Operator", "symbols": [(lexer.has("effectin") ? {type: "effectin"} : effectin)]},
    {"name": "Operator", "symbols": [(lexer.has("effectout") ? {type: "effectout"} : effectout)]},
    {"name": "Operator", "symbols": [(lexer.has("ampmore") ? {type: "ampmore"} : ampmore)]},
    {"name": "Operator", "symbols": [(lexer.has("ampless") ? {type: "ampless"} : ampless)]},
    {"name": "PostScoreOperator", "symbols": [(lexer.has("silence") ? {type: "silence"} : silence)]},
    {"name": "PostScoreOperator", "symbols": [(lexer.has("transpmore") ? {type: "transpmore"} : transpmore)]},
    {"name": "PostScoreOperator", "symbols": [(lexer.has("transpless") ? {type: "transpless"} : transpless)]},
    {"name": "PostScoreOperator", "symbols": [(lexer.has("mult") ? {type: "mult"} : mult)]},
    {"name": "_$ebnf$1", "symbols": []},
    {"name": "_$ebnf$1", "symbols": ["_$ebnf$1", "wschar"], "postprocess": function arrpush(d) {return d[0].concat([d[1]]);}},
    {"name": "_", "symbols": ["_$ebnf$1"], "postprocess": function(d) {return null;}},
    {"name": "__$ebnf$1", "symbols": ["wschar"]},
    {"name": "__$ebnf$1", "symbols": ["__$ebnf$1", "wschar"], "postprocess": function arrpush(d) {return d[0].concat([d[1]]);}},
    {"name": "__", "symbols": ["__$ebnf$1"], "postprocess": function(d) {return null;}},
    {"name": "wschar", "symbols": [(lexer.has("ws") ? {type: "ws"} : ws)], "postprocess": id}
]
  , ParserStart: "main"
}
if (typeof module !== 'undefined'&& typeof module.exports !== 'undefined') {
   module.exports = grammar;
} else {
   window.grammar = grammar;
}
})();
