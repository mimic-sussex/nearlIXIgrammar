var chai = require('chai');
var expect = chai.expect;
const processor = require("../nearlIXIprocessor.js");

const parser = new nearley.Parser(nearley.Grammar.fromCompiled(processor))


function test_Melodic_Mode() {

  parser.feed("joe -> fle[1 3 45 67 2]");
  parser.results;

}

function test_Percussive_Mode() {

  parser.feed("if (true) {");
  parser.feed("x = 1");
  parser.feed("}");
}

function test_Concrete_Mode() {

  parser.feed("if (true) {");
  parser.feed("x = 1");
  parser.feed("}");
}
