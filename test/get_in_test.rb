require 'test/unit'
require 'get_in'

class GetInTest < Test::Unit::TestCase
  data(
    "Flat Hash"         => [{foo: 'FOO'}, [:foo], 'FOO'],
    "Nested Hash"       => [{foo: {bar: {baz: 'FOOBAR'}}}, [:foo, :bar, :baz], 'FOOBAR'],
    "Not existed key"   => [{foo: 'FOO'}, [:bar], nil],
    "Not existed level" => [{foo: 'FOO'}, [:foo, :bar, :baz], nil],
    "Value is nil"      => [{foo: nil}, [:foo], nil],
    "Value is false"    => [{foo: false}, [:foo], false],
    "Not a Hash"        => ['String', [:foo], nil],
  )
  test 'get_in without default' do |data|
    hash, keys, expected = data
    assert do
      hash.get_in(keys) == expected
    end
  end

  data(
    "Not existed key"   => [{foo: 'FOO'}, [:bar], 'DEFAULT', 'DEFAULT'],
    "Not existed level" => [{foo: 'FOO'}, [:foo, :bar, :baz], 'DEFAULT', 'DEFAULT'],
    "Value is nil"      => [{foo: nil}, [:foo], 'DEFAULT', nil],
    "Value is false"    => [{foo: false}, [:foo], 'DEFAULT', false],
    "Not a Hash"        => ['String', [:foo], 'DEFAULT', 'DEFAULT'],
  )
  test 'get_in with default' do |data|
    hash, keys, default, expected = data
    assert do
      hash.get_in(keys, default) == expected
    end
  end
end
