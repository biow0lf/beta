# Polish Notation Calculator

## Quick calculation

```shell
bundle exec ruby v1.rb "+ + 12 16 * 10 4"
```

## Self test

```shell
bundle exec ruby v1.rb
```

## Algorithm visualization

### Tokenization

### Example "+ + 1 2 3"

```ruby
input = "+ + 1 2 3" # => "+ + 1 2 3"

tokens = input.split.reverse # => ["3", "2", "1", "+", "+"]
```

#### Calculation

```ruby
stack = []

tokens = ["3", "2", "1", "+", "+"]

token_1 = tokens[0] # => "3"
token_2 = tokens[1] # => "2"
token_3 = tokens[2] # => "1"
token_4 = tokens[3] # => "+"
token_5 = tokens[4] # => "+"

# token_1 is not an operator
stack.append(token_1.to_i) # => [3]

# token_2 is not an operator
stack.append(token_2.to_i) # => [3, 2]

# token_3 is not an operator
stack.append(token_3.to_i) # => [3, 2, 1]

# token_4 is an operator "+"
operand_1 = stack.pop # => 1
operand_2 = stack.pop # => 2

stack # => [3]

result = operand_1.public_send(token_4, operand_2) # => 3

stack.append(result) # => [3, 3]

# token_5 is an operator "+"
operand_3 = stack.pop # => 3
operand_4 = stack.pop # => 3

stack # => []

result_2 = operand_3.public_send(token_5, operand_4) # => 6

stack.append(result_2) # => [6]

# last element in stack is result
stack # => [6]
```
