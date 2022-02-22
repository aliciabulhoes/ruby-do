# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dry-inflector` gem.
# Please instead update this file by running `bin/tapioca gem dry-inflector`.

module Dry
  class << self
    def Equalizer(*keys, **options); end
    def Types(*namespaces, default: T.unsafe(nil), **aliases); end
  end
end

class Dry::Inflector
  def initialize(&blk); end

  def camelize(input); end
  def camelize_lower(input); end
  def camelize_upper(input); end
  def classify(input); end
  def constantize(input); end
  def dasherize(input); end
  def demodulize(input); end
  def foreign_key(input); end
  def humanize(input); end
  def inspect; end
  def ordinalize(number); end
  def pluralize(input); end
  def singularize(input); end
  def tableize(input); end
  def to_s; end
  def uncountable?(input); end
  def underscore(input); end

  private

  def inflections; end
  def internal_camelize(input, upper); end
end

class Dry::Inflector::Acronyms
  def initialize; end

  def add(rule, replacement); end
  def apply_to(word, capitalize: T.unsafe(nil)); end
  def regex; end

  private

  def define_regex_patterns; end
end

Dry::Inflector::DEFAULT_SEPARATOR = T.let(T.unsafe(nil), String)

class Dry::Inflector::Inflections
  def initialize; end

  def acronym(*words); end
  def acronyms; end
  def human(rule, replacement); end
  def humans; end
  def irregular(singular, plural); end
  def plural(rule, replacement); end
  def plurals; end
  def singular(rule, replacement); end
  def singulars; end
  def uncountable(*words); end
  def uncountables; end

  private

  def add_irregular(rule, replacement, target); end
  def rule(rule, replacement, target); end

  class << self
    def build(&blk); end
  end
end

module Dry::Inflector::Inflections::Defaults
  class << self
    def call(inflect); end

    private

    def acronyms(inflect); end
    def irregular(inflect); end
    def plural(inflect); end
    def singular(inflect); end
    def uncountable(inflect); end
  end
end

Dry::Inflector::ORDINALIZE_TH = T.let(T.unsafe(nil), Hash)

class Dry::Inflector::Rules
  def initialize; end

  def apply_to(word); end
  def each(&blk); end
  def insert(index, array); end
end

Dry::Inflector::VERSION = T.let(T.unsafe(nil), String)