// var grammar;

const nearley = require("nearley");
const processor = require("../nearlIXIprocessor.js");


describe('parse_non_null_mode_input', function () {

  it('it should generate an non-null IXI AST for the melodic mode input', function () {

    // var parser = new nearley.Parser(Grammar.ParserRules, Grammar.ParserStart);

    // var parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar));
    var parser = new nearley.Parser(nearley.Grammar.fromCompiled(window.grammar));
    var input = "joe -> fle[1 3 45 67 2]";

    parser.feed(input);

    parser.results.should.not.equal(null);

    console.log(parser.results);
  });
});
