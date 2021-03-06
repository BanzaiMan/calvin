require "spec_helper"

describe Calvin::AST do
  describe "Atom" do
    it "should parse integers" do
      ast1("1").should eq 1
      ast1("2 ").should eq 2
      ast1(" 2 ").should eq 2
    end

    it "should parse floats" do
      ast1("1.99").should eq 1.99
      ast1("28.8 ").should eq 28.8
      ast1(" 2.9 ").should eq 2.9
    end
  end

  describe "List" do
    it "should parse lists" do
      ast1("1 2").should eq [1, 2]
      ast1("12 2.3").should eq [12, 2.3]
    end
  end

  describe "Table" do
    it "should parse tables" do
      ast1("[1 1, 2 2]").should eq [[1, 1], [2, 2]]
    end
  end

  describe "Monads" do
    it "should parse simple monads" do
      ast1("- 1").should eq monad: { lambda: [{ verb: "-" }], expression: 1 }
      ast1("/1").should eq monad: { lambda: [{ verb: "/" }], expression: 1 }
    end
  end

  describe "Dyads" do
    it "should parse single dyads" do
      ast1("1 + 1").should eq dyad: { left: 1, verb: "+", right: 1 }
      ast1("1 ^1").should eq dyad: { left: 1, verb: "^", right: 1 }
    end

  end

  describe "Sentences" do
    it "should parse double dyads/monads sentence" do
      ast1("1 2 + 3 4").should eq dyad: { left: [1, 2], verb: "+",
                                          right: [3, 4] }
      ast1("1 2 + 3").should eq dyad: { left: [1, 2], verb: "+", right: 3 }
      ast1("[1 2, 3 4] + 1").should eq dyad: { left: [[1, 2], [3, 4]],
                                               verb: "+", right: 1 }
    end
  end
end
