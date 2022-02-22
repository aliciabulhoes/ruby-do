# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dry-logic` gem.
# Please instead update this file by running `bin/tapioca gem dry-logic`.

module Dry
  class << self
    def Equalizer(*keys, **options); end
    def Types(*namespaces, default: T.unsafe(nil), **aliases); end
  end
end

module Dry::Logic
  class << self
    def Rule(*args, **options, &block); end
  end
end

class Dry::Logic::Evaluator
  include ::Dry::Core::Equalizer::Methods

  def initialize(path); end

  def path; end
end

class Dry::Logic::Evaluator::Attr < ::Dry::Logic::Evaluator
  def [](input); end
  def call(input); end
end

class Dry::Logic::Evaluator::Key < ::Dry::Logic::Evaluator
  def [](input); end
  def call(input); end
end

class Dry::Logic::Evaluator::Set
  include ::Dry::Core::Equalizer::Methods

  def initialize(evaluators); end

  def [](input); end
  def call(input); end
  def evaluators; end

  class << self
    def new(paths); end
  end
end

module Dry::Logic::Operations; end

class Dry::Logic::Operations::Abstract
  include ::Dry::Core::Constants
  include ::Dry::Core::Equalizer::Methods
  include ::Dry::Logic::Operators

  def initialize(*rules, **options); end

  def curry(*args); end
  def id; end
  def new(rules, **new_options); end
  def options; end
  def rules; end
  def to_ast; end
  def with(new_options); end
end

Dry::Logic::Operations::Abstract::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)
Dry::Logic::Operations::Abstract::EMPTY_HASH = T.let(T.unsafe(nil), Hash)
Dry::Logic::Operations::Abstract::EMPTY_OPTS = T.let(T.unsafe(nil), Hash)
Dry::Logic::Operations::Abstract::EMPTY_SET = T.let(T.unsafe(nil), Set)
Dry::Logic::Operations::Abstract::EMPTY_STRING = T.let(T.unsafe(nil), String)
Dry::Logic::Operations::Abstract::IDENTITY = T.let(T.unsafe(nil), Proc)
Dry::Logic::Operations::Abstract::Self = T.let(T.unsafe(nil), Proc)
Dry::Logic::Operations::Abstract::Undefined = T.let(T.unsafe(nil), Object)

class Dry::Logic::Operations::And < ::Dry::Logic::Operations::Binary
  def initialize(*_arg0, **_arg1); end

  def [](input); end
  def call(input); end
  def hints; end
  def operator; end
  def type; end
end

class Dry::Logic::Operations::Attr < ::Dry::Logic::Operations::Key
  def type; end

  class << self
    def evaluator(name); end
  end
end

class Dry::Logic::Operations::Binary < ::Dry::Logic::Operations::Abstract
  def initialize(left, right, **options); end

  def ast(input = T.unsafe(nil)); end
  def left; end
  def right; end
  def to_s; end
end

class Dry::Logic::Operations::Check < ::Dry::Logic::Operations::Unary
  def initialize(*rules, **options); end

  def [](input); end
  def ast(input = T.unsafe(nil)); end
  def call(input); end
  def evaluator; end
  def type; end

  class << self
    def new(rule, **options); end
  end
end

class Dry::Logic::Operations::Each < ::Dry::Logic::Operations::Unary
  def [](arr); end
  def call(input); end
  def type; end
end

class Dry::Logic::Operations::Implication < ::Dry::Logic::Operations::Binary
  def [](input); end
  def call(input); end
  def operator; end
  def type; end
end

class Dry::Logic::Operations::Key < ::Dry::Logic::Operations::Unary
  def initialize(*rules, **options); end

  def [](hash); end
  def ast(input = T.unsafe(nil)); end
  def call(hash); end
  def evaluator; end
  def path; end
  def to_s; end
  def type; end

  class << self
    def evaluator(name); end
    def new(rules, **options); end
  end
end

class Dry::Logic::Operations::Negation < ::Dry::Logic::Operations::Unary
  def [](input); end
  def call(input); end
  def type; end
end

class Dry::Logic::Operations::Or < ::Dry::Logic::Operations::Binary
  def [](input); end
  def call(input); end
  def operator; end
  def type; end
end

class Dry::Logic::Operations::Set < ::Dry::Logic::Operations::Abstract
  def [](input); end
  def ast(input = T.unsafe(nil)); end
  def call(input); end
  def to_s; end
  def type; end
end

class Dry::Logic::Operations::Unary < ::Dry::Logic::Operations::Abstract
  def initialize(*rules, **options); end

  def ast(input = T.unsafe(nil)); end
  def rule; end
  def to_s; end
end

class Dry::Logic::Operations::Xor < ::Dry::Logic::Operations::Binary
  def [](input); end
  def ast(input = T.unsafe(nil)); end
  def call(input); end
  def operator; end
  def type; end
end

module Dry::Logic::Operators
  def &(other); end
  def >(other); end
  def ^(other); end
  def and(other); end
  def or(other); end
  def then(other); end
  def xor(other); end
  def |(other); end
end

module Dry::Logic::Predicates
  extend ::Dry::Logic::Predicates::Methods

  mixes_in_class_methods ::Dry::Logic::Predicates::Methods

  class << self
    def included(other); end
  end
end

module Dry::Logic::Predicates::Methods
  def [](name); end
  def array?(input); end
  def attr?(name, input); end
  def bool?(input); end
  def bytesize?(size, input); end
  def case?(pattern, input); end
  def date?(input); end
  def date_time?(input); end
  def decimal?(input); end
  def empty?(input); end
  def eql?(left, right); end
  def even?(input); end
  def excluded_from?(list, input); end
  def excludes?(value, input); end
  def exclusion?(list, input); end
  def false?(value); end
  def filled?(input); end
  def float?(input); end
  def format?(regex, input); end
  def gt?(num, input); end
  def gteq?(num, input); end
  def hash?(input); end
  def included_in?(list, input); end
  def includes?(value, input); end
  def inclusion?(list, input); end
  def int?(input); end
  def is?(left, right); end
  def key?(name, input); end
  def lt?(num, input); end
  def lteq?(num, input); end
  def max_bytesize?(num, input); end
  def max_size?(num, input); end
  def min_bytesize?(num, input); end
  def min_size?(num, input); end
  def nil?(input); end
  def none?(input); end
  def not_eql?(left, right); end
  def number?(input); end
  def odd?(input); end
  def predicate(name, &block); end
  def respond_to?(method, input); end
  def size?(size, input); end
  def str?(input); end
  def time?(input); end
  def true?(value); end
  def type?(type, input); end
  def uri?(schemes, input); end
  def uuid_v1?(input); end
  def uuid_v2?(input); end
  def uuid_v3?(input); end
  def uuid_v4?(input); end
  def uuid_v5?(input); end
end

class Dry::Logic::Result
  include ::Dry::Core::Constants

  def initialize(success, id = T.unsafe(nil), &block); end

  def ast(input = T.unsafe(nil)); end
  def failure?; end
  def id; end
  def serializer; end
  def success; end
  def success?; end
  def to_ast; end
  def to_s; end
  def type; end

  private

  def visit(ast); end
  def visit_and(node); end
  def visit_hint(node); end
  def visit_not(node); end
  def visit_or(node); end
  def visit_predicate(node); end
  def visit_xor(node); end
end

Dry::Logic::Result::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)
Dry::Logic::Result::EMPTY_HASH = T.let(T.unsafe(nil), Hash)
Dry::Logic::Result::EMPTY_OPTS = T.let(T.unsafe(nil), Hash)
Dry::Logic::Result::EMPTY_SET = T.let(T.unsafe(nil), Set)
Dry::Logic::Result::EMPTY_STRING = T.let(T.unsafe(nil), String)
Dry::Logic::Result::IDENTITY = T.let(T.unsafe(nil), Proc)
Dry::Logic::Result::SUCCESS = T.let(T.unsafe(nil), T.untyped)
Dry::Logic::Result::Self = T.let(T.unsafe(nil), Proc)
Dry::Logic::Result::Undefined = T.let(T.unsafe(nil), Object)

class Dry::Logic::Rule
  include ::Dry::Core::Constants
  include ::Dry::Core::Equalizer::Methods
  include ::Dry::Logic::Operators

  def initialize(predicate, options = T.unsafe(nil)); end

  def args; end
  def arity; end
  def ast(input = T.unsafe(nil)); end
  def bind(object); end
  def curry(*new_args); end
  def eval_args(object); end
  def id; end
  def options; end
  def parameters; end
  def predicate; end
  def type; end
  def with(new_opts); end

  private

  def args_with_names(*input); end

  class << self
    def build(predicate, args: T.unsafe(nil), arity: T.unsafe(nil), **options); end
    def interfaces; end
    def specialize(arity, curried, base = T.unsafe(nil)); end
  end
end

Dry::Logic::Rule::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)
Dry::Logic::Rule::EMPTY_HASH = T.let(T.unsafe(nil), Hash)
Dry::Logic::Rule::EMPTY_OPTS = T.let(T.unsafe(nil), Hash)
Dry::Logic::Rule::EMPTY_SET = T.let(T.unsafe(nil), Set)
Dry::Logic::Rule::EMPTY_STRING = T.let(T.unsafe(nil), String)
Dry::Logic::Rule::IDENTITY = T.let(T.unsafe(nil), Proc)

class Dry::Logic::Rule::Interface < ::Module
  def initialize(arity, curried); end

  def arity; end
  def constant?; end
  def curried; end
  def curried?; end
  def curried_args; end
  def define_application; end
  def define_constant_application; end
  def define_constructor; end
  def name; end
  def unapplied; end
  def unapplied_args; end
  def variable_arity?; end
end

Dry::Logic::Rule::Interface::SPLAT = T.let(T.unsafe(nil), Array)

class Dry::Logic::Rule::Predicate < ::Dry::Logic::Rule
  def ast(input = T.unsafe(nil)); end
  def name; end
  def to_ast(input = T.unsafe(nil)); end
  def to_s; end
  def type; end

  class << self
    def specialize(arity, curried, base = T.unsafe(nil)); end
  end
end

class Dry::Logic::Rule::Predicate::Predicate2Arity < ::Dry::Logic::Rule::Predicate; end
class Dry::Logic::Rule::Predicate::Predicate2Arity1Curried < ::Dry::Logic::Rule::Predicate; end
Dry::Logic::Rule::Self = T.let(T.unsafe(nil), Proc)
Dry::Logic::Rule::Undefined = T.let(T.unsafe(nil), Object)

class Dry::Logic::RuleCompiler
  include ::Dry::Core::Constants

  def initialize(predicates); end

  def call(ast); end
  def predicates; end
  def visit(node); end
  def visit_and(node); end
  def visit_attr(node); end
  def visit_check(node); end
  def visit_each(node); end
  def visit_implication(node); end
  def visit_key(node); end
  def visit_not(node); end
  def visit_or(node); end
  def visit_predicate(node); end
  def visit_set(node); end
  def visit_xor(node); end
end

Dry::Logic::RuleCompiler::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)
Dry::Logic::RuleCompiler::EMPTY_HASH = T.let(T.unsafe(nil), Hash)
Dry::Logic::RuleCompiler::EMPTY_OPTS = T.let(T.unsafe(nil), Hash)
Dry::Logic::RuleCompiler::EMPTY_SET = T.let(T.unsafe(nil), Set)
Dry::Logic::RuleCompiler::EMPTY_STRING = T.let(T.unsafe(nil), String)
Dry::Logic::RuleCompiler::IDENTITY = T.let(T.unsafe(nil), Proc)
Dry::Logic::RuleCompiler::Self = T.let(T.unsafe(nil), Proc)
Dry::Logic::RuleCompiler::Undefined = T.let(T.unsafe(nil), Object)
