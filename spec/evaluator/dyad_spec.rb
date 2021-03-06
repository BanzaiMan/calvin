describe Calvin::Evaluator do
  describe "should evaluate dyads with one array" do
    it "should evaluate plus(`+`) dyad" do
      eval1("1 + 2 3").should eq [3, 4]
      eval1("2 3 + 2").should eq [4, 5]
      eval1("_1 + 2 3").should eq [1, 2]
      eval1("2 3 + _2").should eq [0, 1]
    end

    it "should evaluate minus(`-`) dyad" do
      eval1("1 - 2 3").should eq [-1, -2]
      eval1("2 3 - 2").should eq [0, 1]
      eval1("_1 - 2 3").should eq [-3, -4]
      eval1("2 3 - _2").should eq [4, 5]
    end

    it "should evaluate multiply(`*`) dyad" do
      eval1("1 * 2 3").should eq [2, 3]
      eval1("2 3 * 2").should eq [4, 6]
      eval1("_1 * 2 3").should eq [-2, -3]
      eval1("2 3 * _2").should eq [-4, -6]
    end

    it "should evaluate divide(`/`) dyad" do
      eval1("1.0 / 2 4").should eq [0.5, 0.25]
      eval1("2 4 / 2").should eq [1, 2]
      eval1("_1.0 / 2 4").should eq [-0.5, -0.25]
      eval1("2 3 / _1").should eq [-2, -3]
    end

    it "should evaluate power(`^`) dyad" do
      eval1("3 ^ 2 4").should eq [9, 81]
      eval1("2 4 ^ 2").should eq [4, 16]
      eval1("_1 ^ 3 4").should eq [-1, 1]
      eval1("2 0.25 ^ _2.0").should eq [0.25, 16.0]
    end

    it "should evaluate modulo(`%`) dyad" do
      eval1("2 % 2 3").should eq [0, 2]
      eval1("2 5 % 2").should eq [0, 1]
      eval1("_1 % 2 4").should eq [1, 3]
      eval1("2 3 % _2").should eq [0, -1]
    end

    it "should evaluate equals(`=`) dyad" do
      eval1("1 = 0 1 1 0").should eq [0, 1, 1, 0]
      eval1("0 1 1 0 = 0").should eq [1, 0, 0, 1]
      eval1("0 _1 1 = _1").should eq [0, 1, 0]
    end

    it "should evaluate not equals(`<>`) dyad" do
      eval1("1 <> 2 2 1").should eq [1, 1, 0]
    end

    it "should evaluate less than(`<`) dyad" do
      eval1("1 < 1 2 4").should eq [0, 1, 1]
    end

    it "should evaluate less than or equal to(`<=`) dyad" do
      eval1("1 <= 1 2 3").should eq [1, 1, 1]
    end

    it "should evaluate greater than(`>`) dyad" do
      eval1("1 > 2 1 4").should eq [0, 0, 0]
    end

    it "should evaluate greater than or equal to(`>=`) dyad" do
      eval1("1 >= 1 2 4").should eq [1, 0, 0]
    end

    it "should evaluate drop(`<:`) dyad" do
      eval1("2<:6 7 8").should eq [8]
      eval1("5<:..10").should eq [5, 6, 7, 8, 9]
      eval1("5<:_1..10").should eq [4, 5, 6, 7, 8, 9, 10]
    end

    it "should evaluate take(`>:`) dyad" do
      eval1("2>:6 7 8").should eq [6, 7]
      eval1("5>:..10").should eq [0, 1, 2, 3, 4]
      eval1("5>:_1..10").should eq [-1, 0, 1, 2, 3]
    end
  end

  describe "should evaluate dyads with 2 arrays" do
    it "should evaluate plus(`+`) dyad" do
      eval1("1 2 + 2 3").should eq [3, 5]
      eval1("2 3 + _2 _1").should eq [0, 2]
    end

    it "should evaluate minus(`-`) dyad" do
      eval1("1 1 - 2 3").should eq [-1, -2]
      eval1("2 3 - _2 _1").should eq [4, 4]
    end

    it "should evaluate multiply(`*`) dyad" do
      eval1("2 5 * 2 3").should eq [4, 15]
      eval1("2 3 * _2 _3").should eq [-4, -9]
    end

    it "should evaluate divide(`/`) dyad" do
      eval1("1.0 2.0 / 2 4").should eq [0.5, 0.5]
      eval1("2 4 / 2 1").should eq [1, 4]
    end

    it "should evaluate power(`^`) dyad" do
      eval1("3 3 ^ 2 4").should eq [9, 81]
      eval1("2.0 4.0 ^ _2 _1").should eq [0.25, 0.25]
    end

    it "should evaluate modulo(`%`) dyad" do
      eval1("2 6 % 2 3").should eq [0, 0]
      eval1("2 5 % 2 7").should eq [0, 5]
    end

    it "should evaluate equals(`=`) dyad" do
      eval1("1 1 1 1 = 0 1 1 0").should eq [0, 1, 1, 0]
      eval1("0 1 1 0 = 0 1 0 0").should eq [1, 1, 0, 1]
      eval1("0 _1 1 = _1 0 1").should eq [0, 0, 1]
    end

    it "should evaluate not equals(`<>`) dyad" do
      eval1("1 2 1 <> 2 2 1").should eq [1, 0, 0]
    end

    it "should evaluate less than(`<`) dyad" do
      eval1("1 2 3 < 1 2 4").should eq [0, 0, 1]
    end

    it "should evaluate less than or equal to(`<=`) dyad" do
      eval1("1 2 3 <= 1 2 3").should eq [1, 1, 1]
    end

    it "should evaluate greater than(`>`) dyad" do
      eval1("1 2 3 > 2 1 4").should eq [0, 1, 0]
    end

    it "should evaluate greater than or equal to(`>=`) dyad" do
      eval1("1 2 3 >= 1 2 4").should eq [1, 1, 0]
    end

    it "should apply single verb to a list if possible" do
      eval1("1 2 * [6 7, 8 9]").should eq [[6, 7], [16, 18]]
      eval1("[6 7, 8 9] % 3 2").should eq [[0, 1], [0, 1]]
    end

    it "should evaluate or(`|`) dyad on booleans" do
      eval1("(2=2)|3=1").should eq 1
      eval1("(5>9)|8>9").should eq 0
    end

    it "should evaluate and(`&`) dyad on booleans" do
      eval1("(2>3)&4>3").should eq 0
      eval1("(1<=2)&6<=7").should eq 1
    end

    it "should evaluate or(`|`) and and(`&`) chained dyad" do
      eval1("((2+3)>3)&(4<7+8)&1<0").should eq 0
      eval1("((2+3)>3)|(4<7+8)&1<0").should eq 1
    end
  end


  describe "exceptions" do
    it "should not allow dyads on uneven array size" do
      expect { eval1("2 5 % 3 4 1") }.to raise_exception(ArgumentError)
      expect { eval1("[2 5, 2 1] % [3 4, 1 2 3]") }.to raise_exception(ArgumentError)
      expect { eval1("1 2 = 2 3 4") }.to raise_exception(ArgumentError)
    end
  end
end
