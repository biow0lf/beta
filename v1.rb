# frozen_string_literal: true

require "set"

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
OPERATORS = Set["+", "-", "*", "/"]

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
  # save input for later
  input = expression.dup

  # Token is minimal building block. In you case,
  # operator (like "+") or operand (like "1").
  # E.g. "+ 1 2" reads like, operator "+1, operand "1" and operand "2".
  #
  # let's split input to tokens by space and reverse
  # e.g. "+ 1 2" => ["2", "1", "+"]
  #
  #
  tokens = expression.split(" ").reverse

  # process tokens
  tokens.each do |token|

  end

  0
end

def self_test
  EXAMPLES.each do |example|
    input, output = example[:input], example[:output]
    result = evaluate(input)
    if result == output
      puts "Works!"
    else
      puts "Something went wrong!"
    end
  end
end

self_test

# if ARGV[1] == ""
#   self_test
# else
#   puts evaluate(ARGV[1])
# end
