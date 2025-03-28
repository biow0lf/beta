# frozen_string_literal: true

# Write a program to evaluate a prefix notation string.
# Input operators: "+", "*", "-", "/".
# Numbers are all positive integers only.
# For any such a string the program should return one number which is the
# result of the calculation.

# NOTES:
# What is "prefix notation"?
# Prefix notation is just ["Polish notation"](https://en.wikipedia.org/wiki/Polish_notation).
# Let's see example: "+ 1 2".
# "+" is [operator](https://en.wikipedia.org/wiki/Operation_(mathematics))
# and "1" and "2" are [operands](https://en.wikipedia.org/wiki/Operand).
#
# So, "+ 1 2" is just "1 + 2".
#
# From another side: this is s-expressions from lisp.
#
# E.g. in SBCL console:
# ```
# * (+ 1 2)
# 3
# * (+ (+ 1 2) 30)
# 33
# * (+ (+ 12 16) (* 10 4))
# 68
# ```
#
# In SBCL console we can have a little bit more fun:
#
# Sum negative numbers:
# ```
# * (+ 0.9 -0.9)
# 0.0
# *
# ```

# In our case, I will write simple calc for Polish notation.

# This is a set of operators: plus, minus, multiply, divide.
OPERATORS = ["+", "-", "*", "/"]

EXAMPLES = [
  {
    # "9" => 9
    input: "9",
    output: 9
  },
  {
    # "+ 1 2" => 3 (1 + 2)
    input: "+ 1 2",
    output: 3
  },
  {
    # "+ + 1 2 30" => 33 ((1 + 2) + 30)
    input: "+ + 1 2 30",
    output: 33
  },
  {
    # "+ + 12 16 * 10 4" => 68 ((12 + 16) + (10 * 4))
    input: "+ + 12 16 * 10 4",
    output: 68
  }
]

# @param expression [String] Input expression e.g. "+ 1 2"
def evaluate(expression)
  # Token is minimal building block. In you case,
  # operator (like "+") or operand (like "1").
  # E.g. "+ 1 2" reads: operator "+1, operand "1" and operand "2".
  #
  # let's split input to tokens by space and reverse
  # e.g. "+ 1 2" => ["2", "1", "+"]
  #
  # Here should be the question. Why we reverse?
  # Let's see on simple example: "+ 1 2".
  # In this case, we know that we take zero element as operator and
  # first and second as operands. And everything that we should do
  # is just first operand, operator and second operand.
  # E.g. "1", "+", "2". -> "1 + 2" -> 3.
  #
  # But, of last operand is expression, we need to calculate it before
  # calculating current expression.
  # E.g. "+ + 1 2 3". We should calculate "+ 2 3" before calculating "+ 1 5".
  # So, let's reverse it.
  #
  # E.g. "+ + 1 2 3" => ["3", "2", "1", "+", "+"]
  # We start from end. Take "3" and "2" as operands and start looking on for
  # operator. We take first operator from array that after and numbers.
  # Evaluate it and put back for calculation.
  #
  # ["3", "2", "1", "+", "+"]:
  # 1. Take 3 and 2 as operands.
  # 2. Take + as operator.
  # 3. Calculate 3 + 2 = 5.
  # 4. Replace "3" and "2" with "5"
  # 5. Remove "+" from array. It will be: ["5", "1", "+"]
  # 6. Calculate again.
  tokens = expression.split(" ").reverse

  # We are using stack for storing operands.
  # [LIFO (Last In First Out)](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)).
  stack = []

  # process tokens
  tokens.each do |token|
    if OPERATORS.include?(token)
      # Take last two operands from stack.
      operand_1 = stack.pop
      operand_2 = stack.pop

      result = operand_1.public_send(token, operand_2)

      # put result back to end of stack
      stack.push(result)
    else
      # If token is not operator, append token to end of stack for later.
      # If token is not operator, convert to int.
      stack.push(token.to_i)
    end
  end

  # Last value in stack is expression result
  stack.pop
end

def self_test
  EXAMPLES.each do |example|
    input, output = example[:input], example[:output]
    result = evaluate(input)
    if result == output
      puts "Works! '#{input}' is equal to '#{result}'"
    else
      puts "Something went wrong! '#{input}' is NOT equal to '#{result}'"
    end
  end
end

if ARGV == []
  self_test
else
  expression = ARGV[0]
  result = evaluate(expression)

  puts "Input: '#{expression}' -- result: '#{result}'"
end
