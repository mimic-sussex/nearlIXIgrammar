var chai = require('chai');
var expect = chai.expect;
const nearley = require("nearley");
const processor = require("../nearlIXIprocessor.js");

const parser = new nearley.Parser(nearley.Grammar.fromCompiled(processor))


function test_Melodic_Mode() {

  var input = "joe -> fle[1 3 45 67 2]";

  parser.feed(input);
  parser.results;

}

function test_Percussive_Mode() {

  var input = "perc -> |x xo xox xox|";

  parser.feed(input);
  parser.results;
}

function test_Concrete_Mode() {

  var input = "connie -> marimba{1 3 45 67 2}!";

  parser.feed(input);
  parser.results;
}
