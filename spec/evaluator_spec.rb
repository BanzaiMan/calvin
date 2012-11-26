require "spec_helper"

# describe Calvin::Evaluator do
#   it "should parse foldl" do
#     eval1("+\\1 2 3").should eq 6
#     eval1("-\\1 2 3").should eq -4
#     eval1("*\\2 3 5").should eq 30
#     eval1("/\\8 2 2").should eq 2
#     eval1("%\\9 7 9").should eq 2
#     eval1("^\\2 2 3").should eq 64
#   end
#
#   it "should parse foldr" do
#     eval1("+\\:1 2 3").should eq 6
#     eval1("-\\:1 2 3").should eq 0
#     eval1("*\\:2 3 5").should eq 30
#     eval1("/\\:2 2 8").should eq 2
#     eval1("%\\:9 7 9").should eq 2
#     eval1("^\\:2 2 3").should eq 81
#   end
#
#   it "should parse map" do
#     eval1("+2@1 2 3").should eq [3, 4, 5]
#     eval1("2+@1 2 3").should eq [3, 4, 5]
#
#     eval1("-2@1 2 3").should eq [-1, 0, 1]
#     eval1("2-@1 2 3").should eq [1, 0, -1]
#
#     eval1("*2@1 2 3").should eq [2, 4, 6]
#     eval1("2*@1 2 3").should eq [2, 4, 6]
#
#     eval1("/2@9 6 3").should eq [4, 3, 1]
#     eval1("4/@1 2 3").should eq [4, 2, 1]
#
#     eval1("%2@1 2 3").should eq [1, 0, 1]
#     eval1("2%@1 2 3").should eq [0, 0, 2]
#
#     eval1("^2@1 2 3").should eq [1, 4, 9]
#     eval1("2^@1 2 3").should eq [2, 4, 8]
#   end
#
#   it "should parse filter" do
#     eval1(">3@1 2 4").should eq [4]
#     eval1("<3@1 6 1").should eq [1, 1]
#     eval1(">=3@1 3 4").should eq [3, 4]
#     eval1("<=3@1 3 4").should eq [1, 3]
#     eval1("=3@1 2 3 3 4").should eq [3, 3]
#
#     eval1("3>@1 2 4").should eq [1, 2]
#     eval1("3<@1 6 1").should eq [6]
#     eval1("3>=@1 3 4").should eq [1, 3]
#     eval1("3<=@1 3 4").should eq [3, 4]
#     eval1("3=@1 2 3 3 4").should eq [3, 3]
#   end
#
#   it "should parse nested expressions" do
#     eval1("+\\2^@1 2 3").should eq 14
#     eval1("-\\:-2@1 2 3").should eq 2
#     eval1("/2@^2@2+@1 2 3").should eq [4, 8, 12]
#   end
#
#   it "should parse ranges" do
#     eval1("..10").should eq 0..9
#     eval1("1..100").should eq 1..100
#     eval1("+\\1..100").should eq (100 * 101) / 2
#     eval1("+\\..100").should eq (99 * 100) / 2
#   end
#
#   it "should map ranges" do
#     eval1("^2@1..3").should eq [1, 4, 9]
#     eval1("2^@1..3").should eq [2, 4, 8]
#   end
#
#   it "should apply monads to single element too" do
#     eval1("*2@+\\1 2 3").should eq 12
#   end
#
#   it "should save assigned variables in env" do
#     e = Calvin::Evaluator.new
#
#     e.apply ast("a:=1")
#     e.env["a"].should eq [1]
#     e.apply(ast("a")[0]).should eq [1]
#
#     e.apply ast("a:=1 2 4")
#     e.apply(ast("a")[0]).should eq [1, 2, 4]
#
#     e.apply ast("b:=+\\4..6")
#     e.apply(ast("b")[0]).should eq 15
#   end
# end
