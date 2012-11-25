require "bundler/setup"
require "calvin"

RSpec.configure do |config|
  def ast(input)
    Calvin::AST.new(input).ast
  end

  def eval(input)
    Calvin::Evaluator.new.apply ast(input)
  end
end