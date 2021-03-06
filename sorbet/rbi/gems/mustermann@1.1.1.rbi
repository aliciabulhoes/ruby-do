# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `mustermann` gem.
# Please instead update this file by running `bin/tapioca gem mustermann`.

module Mustermann
  class << self
    def [](name); end
    def extend_object(object); end
    def new(*input, type: T.unsafe(nil), operator: T.unsafe(nil), **options); end
    def normalized_type(type); end
    def register(name, type); end
    def try_require(path); end
  end
end

module Mustermann::AST; end

class Mustermann::AST::Boundaries < ::Mustermann::AST::Translator
  def set_boundaries(node, start, stop); end

  class << self
    def set_boundaries(ast, string: T.unsafe(nil), start: T.unsafe(nil), stop: T.unsafe(nil)); end
  end
end

class Mustermann::AST::Boundaries::NodeTranslator < ::Mustermann::AST::Translator::NodeTranslator
  class << self
    def translator; end
  end
end

class Mustermann::AST::Compiler < ::Mustermann::AST::Translator
  def compile(ast, except: T.unsafe(nil), **options); end
  def encoded(char, uri_decode: T.unsafe(nil), space_matches_plus: T.unsafe(nil), **options); end
  def error_class; end

  class << self
    def compile(ast, **options); end
  end
end

class Mustermann::AST::Compiler::Capture < ::Mustermann::AST::Compiler::NodeTranslator
  def pattern(capture: T.unsafe(nil), **options); end
  def translate(**options); end

  private

  def default(**options); end
  def from_array(array, **options); end
  def from_hash(hash, **options); end
  def from_nil(**options); end
  def from_string(string, **options); end
  def from_symbol(symbol, **options); end
  def qualified(string, greedy: T.unsafe(nil), **options); end
  def with_lookahead(string, lookahead: T.unsafe(nil), **options); end
end

class Mustermann::AST::Compiler::NodeTranslator < ::Mustermann::AST::Translator::NodeTranslator
  class << self
    def translator; end
  end
end

class Mustermann::AST::Compiler::Splat < ::Mustermann::AST::Compiler::Capture
  def pattern(**options); end
end

class Mustermann::AST::Compiler::Variable < ::Mustermann::AST::Compiler::Capture
  def default(allow_reserved: T.unsafe(nil), **options); end
  def parametric(string); end
  def pattern(parametric: T.unsafe(nil), separator: T.unsafe(nil), **options); end
  def qualified(string, **options); end
  def register_param(parametric: T.unsafe(nil), split_params: T.unsafe(nil), separator: T.unsafe(nil), **options); end
  def translate(**options); end
end

class Mustermann::AST::Expander < ::Mustermann::AST::Translator
  def add(ast); end
  def add_to(list, result); end
  def error_class; end
  def error_for(values); end
  def escape(string, *args, **_arg2); end
  def expand(values); end
  def expandable?(values); end
  def expandable_keys(keys); end
  def for_capture(node, **options); end
  def keys; end
  def mappings; end
  def pattern(string = T.unsafe(nil), *keys, **filters); end
  def pattern_for(node, **options); end
end

class Mustermann::AST::Expander::NodeTranslator < ::Mustermann::AST::Translator::NodeTranslator
  class << self
    def translator; end
  end
end

class Mustermann::AST::Node
  def initialize(payload = T.unsafe(nil), **options); end

  def each_leaf(&block); end
  def is_a?(type); end
  def length; end
  def min_size; end
  def parse; end
  def payload; end
  def payload=(_arg0); end
  def start; end
  def start=(_arg0); end
  def stop; end
  def stop=(_arg0); end
  def type; end

  class << self
    def [](name); end
    def constant_name(name); end
    def parse(*args, &block); end
    def type; end
  end
end

class Mustermann::AST::Node::Capture < ::Mustermann::AST::Node
  def constraint; end
  def constraint=(_arg0); end
  def convert; end
  def convert=(_arg0); end
  def name; end
  def parse; end
  def qualifier; end
  def qualifier=(_arg0); end
end

class Mustermann::AST::Node::Char < ::Mustermann::AST::Node
  def min_size; end
end

class Mustermann::AST::Node::Composition < ::Mustermann::AST::Node
  def initialize(payload = T.unsafe(nil), **options); end
end

class Mustermann::AST::Node::Expression < ::Mustermann::AST::Node
  def operator; end
  def operator=(_arg0); end
end

class Mustermann::AST::Node::Group < ::Mustermann::AST::Node::Composition; end

class Mustermann::AST::Node::NamedSplat < ::Mustermann::AST::Node::Splat
  def name; end
end

class Mustermann::AST::Node::Optional < ::Mustermann::AST::Node; end
class Mustermann::AST::Node::Or < ::Mustermann::AST::Node; end

class Mustermann::AST::Node::Root < ::Mustermann::AST::Node
  def pattern; end
  def pattern=(_arg0); end

  class << self
    def parse(string, &block); end
  end
end

class Mustermann::AST::Node::Separator < ::Mustermann::AST::Node
  def min_size; end
end

class Mustermann::AST::Node::Splat < ::Mustermann::AST::Node::Capture
  def name; end
end

class Mustermann::AST::Node::Union < ::Mustermann::AST::Node::Composition; end

class Mustermann::AST::Node::Variable < ::Mustermann::AST::Node::Capture
  def explode; end
  def explode=(_arg0); end
  def prefix; end
  def prefix=(_arg0); end
end

class Mustermann::AST::Node::WithLookAhead < ::Mustermann::AST::Node
  def initialize(payload, at_end, **options); end

  def at_end; end
  def at_end=(_arg0); end
  def head; end
  def head=(_arg0); end
end

class Mustermann::AST::ParamScanner < ::Mustermann::AST::Translator
  class << self
    def scan_params(ast); end
  end
end

class Mustermann::AST::ParamScanner::NodeTranslator < ::Mustermann::AST::Translator::NodeTranslator
  class << self
    def translator; end
  end
end

class Mustermann::AST::Parser
  extend ::Forwardable

  def initialize(pattern: T.unsafe(nil), **options); end

  def buffer; end
  def default_node(char); end
  def eos?(*args, **_arg1, &block); end
  def expect(regexp, char: T.unsafe(nil), **options); end
  def getch(*args, **_arg1, &block); end
  def min_size(start, stop, node); end
  def node(type, *args, **_arg2, &block); end
  def parse(string); end
  def pattern; end
  def pos(*args, **_arg1, &block); end
  def read; end
  def read_args(key_separator, close, separator: T.unsafe(nil), symbol_keys: T.unsafe(nil), **options); end
  def read_brackets(open, close, char: T.unsafe(nil), escape: T.unsafe(nil), quote: T.unsafe(nil), **options); end
  def read_escaped(close, escape: T.unsafe(nil), **options); end
  def read_list(*close, separator: T.unsafe(nil), escape: T.unsafe(nil), quotes: T.unsafe(nil), ignore: T.unsafe(nil), **options); end
  def read_suffix(element); end
  def scan(regexp); end
  def string; end
  def unexpected(char = T.unsafe(nil), exception: T.unsafe(nil)); end

  class << self
    def on(*chars, &block); end
    def parse(string, **options); end
    def suffix(pattern = T.unsafe(nil), after: T.unsafe(nil), &block); end
  end
end

class Mustermann::AST::Pattern < ::Mustermann::RegexpBased
  extend ::SingleForwardable

  def boundaries(*args, **_arg1, &block); end
  def compiler(*args, **_arg1, &block); end
  def expand(behavior = T.unsafe(nil), values = T.unsafe(nil)); end
  def map_param(key, value); end
  def param_scanner(*args, **_arg1, &block); end
  def parser(*args, **_arg1, &block); end
  def template_generator(*args, **_arg1, &block); end
  def to_ast; end
  def to_templates; end
  def transformer(*args, **_arg1, &block); end
  def validation(*args, **_arg1, &block); end

  private

  def compile(**options); end
  def generate_templates(*args, **_arg1, &block); end
  def param_converters; end
  def parse(*args, **_arg1, &block); end
  def scan_params(*args, **_arg1, &block); end
  def set_boundaries(*args, **_arg1, &block); end
  def transform(*args, **_arg1, &block); end
  def validate(*args, **_arg1, &block); end

  class << self
    def boundaries; end
    def compiler; end
    def on(*args, **_arg1, &block); end
    def param_scanner; end
    def parser; end
    def suffix(*args, **_arg1, &block); end
    def template_generator; end
    def transformer; end
    def validation; end
  end
end

class Mustermann::AST::TemplateGenerator < ::Mustermann::AST::Translator
  class << self
    def generate_templates(ast); end
  end
end

class Mustermann::AST::TemplateGenerator::NodeTranslator < ::Mustermann::AST::Translator::NodeTranslator
  class << self
    def translator; end
  end
end

class Mustermann::AST::Transformer < ::Mustermann::AST::Translator
  class << self
    def transform(tree); end
  end
end

class Mustermann::AST::Transformer::ArrayTransform < ::Mustermann::AST::Transformer::NodeTranslator
  def create_lookahead(elements, *args); end
  def expect_lookahead?(element); end
  def list_for(element); end
  def lookahead?(element, in_lookahead = T.unsafe(nil)); end
  def lookahead_buffer; end
  def lookahead_payload?(payload, in_lookahead); end
  def payload; end
  def track(element); end
  def translate; end
end

class Mustermann::AST::Transformer::ExpressionTransform < ::Mustermann::AST::Transformer::NodeTranslator
  def translate; end
end

Mustermann::AST::Transformer::ExpressionTransform::OPERATORS = T.let(T.unsafe(nil), Hash)

class Mustermann::AST::Transformer::ExpressionTransform::Operator < ::Struct
  def allow_reserved; end
  def allow_reserved=(_); end
  def parametric; end
  def parametric=(_); end
  def prefix; end
  def prefix=(_); end
  def separator; end
  def separator=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

class Mustermann::AST::Transformer::GroupTransformer < ::Mustermann::AST::Transformer::NodeTranslator
  def group(elements); end
  def split_payload; end
  def translate; end
  def union; end
end

class Mustermann::AST::Transformer::NodeTranslator < ::Mustermann::AST::Translator::NodeTranslator
  class << self
    def translator; end
  end
end

class Mustermann::AST::Transformer::RootTransformer < ::Mustermann::AST::Transformer::GroupTransformer
  def union; end
end

class Mustermann::AST::Translator
  def decorator_for(node); end
  def error_class; end
  def escape(char, parser: T.unsafe(nil), escape: T.unsafe(nil), also_escape: T.unsafe(nil)); end
  def translate(node, *args, **_arg2, &block); end

  class << self
    def create(&block); end
    def dispatch_table; end
    def inherited(subclass); end
    def raises(error); end
    def translate(*types, &block); end
  end
end

class Mustermann::AST::Translator::NodeTranslator
  def initialize(node, translator); end

  def node; end
  def t(*args, **_arg1, &block); end
  def translator; end

  class << self
    def register(*types); end
  end
end

class Mustermann::AST::Validation < ::Mustermann::AST::Translator
  def check_name(name, forbidden: T.unsafe(nil)); end
  def names; end

  class << self
    def validate(ast); end
  end
end

class Mustermann::AST::Validation::NodeTranslator < ::Mustermann::AST::Translator::NodeTranslator
  class << self
    def translator; end
  end
end

class Mustermann::Caster
  def initialize(*types, &block); end

  def cast(hash); end
  def caster_for(type, &block); end
  def register(*types, &block); end
end

class Mustermann::Caster::Any
  def initialize(&block); end

  def cast(key, value); end
end

class Mustermann::Caster::Key < ::Mustermann::Caster::Any
  def initialize(type, &block); end

  def cast(key, value); end
end

class Mustermann::Caster::Value < ::Mustermann::Caster::Any
  def initialize(type, &block); end

  def cast(key, value); end
end

class Mustermann::CompileError < ::Mustermann::Error; end

class Mustermann::Composite < ::Mustermann::Pattern
  def initialize(patterns, operator: T.unsafe(nil), **options); end

  def ==(pattern); end
  def ===(string); end
  def eql?(pattern); end
  def expand(behavior = T.unsafe(nil), values = T.unsafe(nil)); end
  def hash; end
  def inspect; end
  def match(string); end
  def operator; end
  def params(string); end
  def patterns; end
  def respond_to_special?(method); end
  def simple_inspect; end
  def to_s; end
  def to_templates; end

  private

  def patterns_from(pattern, **options); end
  def with_matching(string, method); end

  class << self
    def new(*patterns, **options); end
    def supported?(option, type: T.unsafe(nil), **options); end
  end
end

class Mustermann::Concat < ::Mustermann::Composite
  def initialize(*_arg0, **_arg1); end

  def ===(string); end
  def expand(behavior = T.unsafe(nil), values = T.unsafe(nil)); end
  def match(string); end
  def operator; end
  def params(string); end
  def peek_match(string); end
  def peek_params(string); end
  def peek_size(string); end
  def respond_to_special?(method); end
  def to_templates; end

  private

  def combined_ast; end
  def pump(string, inject_with: T.unsafe(nil), initial: T.unsafe(nil), with_size: T.unsafe(nil)); end
end

module Mustermann::Concat::Native
  def +(other); end
  def look_ahead(other); end

  private

  def native_concat(other); end
  def native_concat?(other); end
end

Mustermann::DEFAULT_TYPE = T.let(T.unsafe(nil), Symbol)

class Mustermann::EqualityMap
  def initialize; end

  def fetch(key); end
  def map; end

  private

  def finalizer(hash); end
  def track(key, object); end

  class << self
    def new; end
  end
end

class Mustermann::Error < ::StandardError; end
class Mustermann::ExpandError < ::Mustermann::Error; end

class Mustermann::Expander
  def initialize(*patterns, additional_values: T.unsafe(nil), **options, &block); end

  def <<(*patterns); end
  def ==(other); end
  def add(*patterns); end
  def additional_values; end
  def cast(*types, &block); end
  def eql?(other); end
  def expand(behavior = T.unsafe(nil), values = T.unsafe(nil)); end
  def expandable?(values); end
  def hash; end
  def patterns; end

  private

  def append(uri, values); end
  def caster; end
  def map_values(values); end
  def slice(hash, keys); end
  def split_values(values); end
  def with_rest(values); end
end

class Mustermann::ParseError < ::Mustermann::Error; end

class Mustermann::Pattern
  include ::Mustermann

  def initialize(string, uri_decode: T.unsafe(nil), **options); end

  def &(other); end
  def +(other); end
  def ==(other); end
  def ===(string); end
  def =~(string); end
  def ^(other); end
  def always_array?(key); end
  def eql?(other); end
  def expand(behavior = T.unsafe(nil), values = T.unsafe(nil)); end
  def hash; end
  def inspect; end
  def match(string); end
  def named_captures; end
  def names; end
  def options; end
  def params(string = T.unsafe(nil), captures: T.unsafe(nil), offset: T.unsafe(nil)); end
  def peek(string); end
  def peek_match(string); end
  def peek_params(string); end
  def peek_size(string); end
  def respond_to?(method, *args); end
  def simple_inspect; end
  def to_proc; end
  def to_s; end
  def to_templates; end
  def uri_decode; end
  def |(other); end

  private

  def map_param(key, value); end
  def respond_to_special?(method); end
  def unescape(string, decode = T.unsafe(nil)); end

  class << self
    def new(string, ignore_unknown_options: T.unsafe(nil), **options); end
    def register(*names); end
    def supported?(option, **options); end
    def supported_options(*list); end
  end
end

Mustermann::Pattern::ALWAYS_ARRAY = T.let(T.unsafe(nil), Array)

class Mustermann::RegexpBased < ::Mustermann::Pattern
  extend ::Forwardable

  def initialize(string, **options); end

  def ===(*args, **_arg1, &block); end
  def =~(*args, **_arg1, &block); end
  def match(*args, **_arg1, &block); end
  def named_captures(*args, **_arg1, &block); end
  def names(*args, **_arg1, &block); end
  def peek_match(string); end
  def peek_size(string); end
  def regexp; end
  def to_regexp; end

  private

  def compile(**options); end
end

class Mustermann::SimpleMatch
  def initialize(string = T.unsafe(nil), names: T.unsafe(nil), captures: T.unsafe(nil)); end

  def +(other); end
  def [](*args); end
  def captures; end
  def inspect; end
  def names; end
  def to_s; end
end
