# frozen_string_literal: true

# Let's make v1 version more OOP version

class PolishNotationCalculator
  OPERATORS = ["+", "-", "*", "/"].freeze

  attr_reader :expression, :stack

  def initialize(expression)
    @expression = expression
    @stack = []
  end

  def evaluate
    tokens.each do |token|
      if operator?(token)
        operand_1, operand_2 = stack.pop, stack.pop

        result = operand_1.public_send(token, operand_2)

        stack.push(result)
      else
        stack.push(token.to_i)
      end
    end

    stack.pop
  end

  private

  def operator?(token)
    OPERATORS.include?(token)
  end

  def tokens
    @tokens ||= expression.split.reverse
  end
end
