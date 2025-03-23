require "./v2"

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

EXAMPLES.each do |example|
  input, output = example[:input], example[:output]
  result = PolishNotationCalculator.new(input).evaluate
  if result == output
    puts "Works! '#{input}' is equal to '#{result}'"
  else
    puts "Something went wrong! '#{input}' is NOT equal to '#{result}'"
  end
end
