# frozen_string_literal: true

require "set"

# Write a program to evaluate a prefix notation string.
# Input operators: "+", "*", "-", "/".
# Numbers are all positive integers only.
# For any such a string the program should return one number which is the
# result of the calculation.

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
    # "+ + 1 2 30" => 33 ((1+2)+30)
    input: "+ + 1 2 30",
    output: 33
  },
  {
    # "+ + 12 16 * 10 4" => 68 ((12+16)+(10*4))
    input: "+ + 12 16 * 10 4",
    output: 68
  }
]
