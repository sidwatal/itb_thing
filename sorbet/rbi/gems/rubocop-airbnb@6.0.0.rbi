# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rubocop-airbnb` gem.
# Please instead update this file by running `bin/tapioca gem rubocop-airbnb`.

# String inflections copied over from ActiveSupport
#
# source://rubocop-airbnb//lib/rubocop/airbnb/inflections.rb#2
module Inflections
  # Convert Foo::BarBaz to foo/bar_baz.
  # Copied from ActiveSupport.
  #
  # source://rubocop-airbnb//lib/rubocop/airbnb/inflections.rb#5
  def underscore(camel_cased_word); end
end

# These methods are useful for Rubocop rules related to Rails autoloading.
#
# source://rubocop-airbnb//lib/rubocop/airbnb/rails_autoloading.rb#2
module RailsAutoloading
  # Given "foo/bar/baz", return:
  # [
  #   %r{/foo.rb$},
  #   %r{/foo/bar.rb$},
  #   %r{/foo/bar/baz.rb$},
  #   %r{/foo/bar/baz/}, # <= only if allow_dir = true
  # ]
  #
  # source://rubocop-airbnb//lib/rubocop/airbnb/rails_autoloading.rb#20
  def allowable_paths_for(expected_dir, options = T.unsafe(nil)); end

  # source://rubocop-airbnb//lib/rubocop/airbnb/rails_autoloading.rb#48
  def full_const_name(parent_module_name, const_name); end

  # source://rubocop-airbnb//lib/rubocop/airbnb/rails_autoloading.rb#33
  def normalize_module_name(module_name); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/airbnb/rails_autoloading.rb#3
  def run_rails_autoloading_cops?(path); end

  # module_name looks like one of these:
  #   Foo::Bar for an instance method
  #   #<Class:Foo::Bar> for a class method.
  # For either case we return ["Foo", "Bar"]
  #
  # source://rubocop-airbnb//lib/rubocop/airbnb/rails_autoloading.rb#44
  def split_modules(module_name); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#4
module RuboCop; end

# RuboCop Airbnb project namespace
#
# source://rubocop-airbnb//lib/rubocop/airbnb.rb#8
module RuboCop::Airbnb; end

# source://rubocop-airbnb//lib/rubocop/airbnb.rb#12
RuboCop::Airbnb::CONFIG = T.let(T.unsafe(nil), Hash)

# source://rubocop-airbnb//lib/rubocop/airbnb.rb#11
RuboCop::Airbnb::CONFIG_DEFAULT = T.let(T.unsafe(nil), Pathname)

# Because RuboCop doesn't yet support plugins, we have to monkey patch in a
# bit of our configuration.
#
# source://rubocop-airbnb//lib/rubocop/airbnb/inject.rb#9
module RuboCop::Airbnb::Inject
  class << self
    # source://rubocop-airbnb//lib/rubocop/airbnb/inject.rb#10
    def defaults!; end
  end
end

# source://rubocop-airbnb//lib/rubocop/airbnb.rb#9
RuboCop::Airbnb::PROJECT_ROOT = T.let(T.unsafe(nil), Pathname)

# Version information for the the Airbnb RuboCop plugin.
#
# source://rubocop-airbnb//lib/rubocop/airbnb/version.rb#6
RuboCop::Airbnb::VERSION = T.let(T.unsafe(nil), String)

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#5
module RuboCop::Cop; end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#6
module RuboCop::Cop::Airbnb; end

# This cop checks for a class or module declared in a file that does not match its name.
# The Rails autoloader can't find such a constant, but sometimes
# people "get lucky" if the file happened to be loaded before the method was defined.
#
# Note that autoloading works fine if classes are defined in the file that defines
# the module. This is common usage for things like error classes, so we'll allow it.
# Nested classes are also allowed:
#
# @example
#   # bad
#
#   # foo/bar.rb
#   module Foo
#   class Goop
#   end
#
#   module Moo
#   end
#   end
#
#   # good
#
#   # foo.rb
#
#   # foo/goop.rb
#   module Foo
#   class Goop
#   end
#   end
#
#   # foo/moo.rb
#   module Foo
#   module Moo
#   end
#   end
# @example
#   # good
#
#   # foo.rb
#   module Foo
#   class Bar < StandardError
#   end
#   end
#
#   # good
#
#   # foo.rb
#   class Foo
#   class Bar # nested class
#   end
#   end
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#59
class RuboCop::Cop::Airbnb::ClassOrModuleDeclaredInWrongFile < ::RuboCop::Cop::Base
  include ::Inflections
  include ::RailsAutoloading

  # class C
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#80
  def on_class(node); end

  # module M
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#75
  def on_module(node); end

  private

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#103
  def add_error(const_name, fully_qualified_const_name, node); end

  # Does this node define an Error class? (Classname or base class includes the word
  # "Error" or "Exception".)
  #
  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#124
  def error_class?(node, class_or_module, const_name); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#86
  def on_class_or_module(node); end
end

# class Foo or module Foo in the wrong file
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#64
RuboCop::Cop::Airbnb::ClassOrModuleDeclaredInWrongFile::CLASS_OR_MODULE_MSG = T.let(T.unsafe(nil), String)

# class FooError < StandardError, in the wrong file
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/class_or_module_declared_in_wrong_file.rb#69
RuboCop::Cop::Airbnb::ClassOrModuleDeclaredInWrongFile::ERROR_CLASS_MSG = T.let(T.unsafe(nil), String)

# This cop checks for a constant assigned in a file that does not match its owning scope.
# The Rails autoloader can't find such a constant, but sometimes
# people "get lucky" if the file happened to be loaded before the method was defined.
#
# @example
#   # bad
#
#   # foo/bar.rb
#   module Foo
#   BAZ = 42
#   end
#
#   # good
#
#   # foo.rb
#   module Foo
#   BAZ = 42
#   end
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/const_assigned_in_wrong_file.rb#25
class RuboCop::Cop::Airbnb::ConstAssignedInWrongFile < ::RuboCop::Cop::Base
  include ::Inflections
  include ::RailsAutoloading

  # FOO = 42
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/const_assigned_in_wrong_file.rb#41
  def on_casgn(node); end

  private

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/const_assigned_in_wrong_file.rb#61
  def add_error(const_name, node); end
end

# FOO = 42
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/const_assigned_in_wrong_file.rb#30
RuboCop::Cop::Airbnb::ConstAssignedInWrongFile::ASSIGNMENT_MSG = T.let(T.unsafe(nil), String)

# FOO = 42 at global scope
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/const_assigned_in_wrong_file.rb#35
RuboCop::Cop::Airbnb::ConstAssignedInWrongFile::GLOBAL_ASSIGNMENT = T.let(T.unsafe(nil), String)

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#4
class RuboCop::Cop::Airbnb::ContinuationSlash < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#8
  def enforce_violation(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_and_asgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_casgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_cvasgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_gvasgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#8
  def on_if(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_ivasgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_lvasgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_masgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_op_asgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#18
  def on_or_asgn(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#8
  def on_send(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/continuation_slash.rb#5
RuboCop::Cop::Airbnb::ContinuationSlash::MSG = T.let(T.unsafe(nil), String)

# Cop to help prevent the scorge of Default Scopes from ActiveRecord.
# Once in place they are almost impossible to remove.
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/default_scope.rb#6
class RuboCop::Cop::Airbnb::DefaultScope < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/default_scope.rb#12
  def on_send(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/default_scope.rb#7
RuboCop::Cop::Airbnb::DefaultScope::MSG = T.let(T.unsafe(nil), String)

# Cop to enforce "attr { CONST }" instead of "attr CONST" in factories,
# because the latter forces autoload, which slows down spec startup time and
# Zeus reload time after touching a model.
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_attr_references_class.rb#7
class RuboCop::Cop::Airbnb::FactoryAttrReferencesClass < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_attr_references_class.rb#11
  def factory_attributes(param0); end

  # Look for "attr CONST" expressions in factories or traits. In RuboCop, this is
  # a `send` node, sending the attr method.
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_attr_references_class.rb#17
  def on_send(node); end

  private

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_attr_references_class.rb#59
  def add_const_offenses(node); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_attr_references_class.rb#26
  def in_factory_file?(node); end

  # Is this node in a factory or trait, but not inside a nested block in a factory or trait?
  #
  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_attr_references_class.rb#34
  def in_factory_or_trait?(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_attr_references_class.rb#8
RuboCop::Cop::Airbnb::FactoryAttrReferencesClass::MSG = T.let(T.unsafe(nil), String)

# Cop to tell developers to use :class => "MyClass" instead of :class => MyClass,
# because the latter slows down reloading zeus.
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_class_use_string.rb#6
class RuboCop::Cop::Airbnb::FactoryClassUseString < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_class_use_string.rb#10
  def on_send(node); end

  private

  # Return the descendant node that is a hash pair (:key => value) whose key
  # is :class.
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_class_use_string.rb#24
  def class_node(node); end

  # Given a hash pair :class_name => value, is the value a hardcoded string?
  #
  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_class_use_string.rb#33
  def string_class_name?(class_pair); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/factory_class_use_string.rb#7
RuboCop::Cop::Airbnb::FactoryClassUseString::MSG = T.let(T.unsafe(nil), String)

# Modifying Mass assignment restrictions eliminates the entire point of disabling
# mass assignment. It's a lazy, potentially dangerous approach that should be discouraged.
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/mass_assignment_accessible_modifier.rb#6
class RuboCop::Cop::Airbnb::MassAssignmentAccessibleModifier < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/mass_assignment_accessible_modifier.rb#9
  def on_send(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/mass_assignment_accessible_modifier.rb#7
RuboCop::Cop::Airbnb::MassAssignmentAccessibleModifier::MSG = T.let(T.unsafe(nil), String)

# This cop checks for methods defined in a module declaration, in a file that doesn't
# match the module name. The Rails autoloader can't find such a method, but sometimes
# people "get lucky" if the file happened to be loaded before the method was defined.
#
# Note that autoloading works fine if classes are defined in the file that defines
# the module. This is common usage for things like error classes, so we'll allow it:
#
# @example
#   # bad
#
#   # foo/bar.rb
#   module Foo
#   class Bar
#   end
#
#   def baz
#   42
#   end
#   end
#
#   # good
#
#   # foo/bar.rb
#   module Foo
#   class Bar
#   end
#   end
#
#   # foo.rb
#   module Foo
#   def baz
#   42
#   end
#   end
# @example
#   # good
#
#   # foo.rb
#   module Foo
#   class Bar < StandardError
#   def baz
#   end
#   end
#   end
#
#   # good
#
#   # foo.rb
#   class Foo
#   class Bar # nested class
#   def baz
#   end
#   end
#   end
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/module_method_in_wrong_file.rb#62
class RuboCop::Cop::Airbnb::ModuleMethodInWrongFile < ::RuboCop::Cop::Base
  include ::Inflections
  include ::RailsAutoloading

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/module_method_in_wrong_file.rb#72
  def on_def(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/module_method_in_wrong_file.rb#72
  def on_defs(node); end

  private

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/module_method_in_wrong_file.rb#81
  def on_method_def(node, method_name, args, body); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/module_method_in_wrong_file.rb#66
RuboCop::Cop::Airbnb::ModuleMethodInWrongFile::MSG_TEMPLATE = T.let(T.unsafe(nil), String)

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/no_timeout.rb#4
class RuboCop::Cop::Airbnb::NoTimeout < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/no_timeout.rb#12
  def on_send(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/no_timeout.rb#5
RuboCop::Cop::Airbnb::NoTimeout::MSG = T.let(T.unsafe(nil), String)

# Cop to enforce use of options hash over default arguments
# https://github.com/airbnb/ruby#no-default-args
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/opt_arg_parameters.rb#6
class RuboCop::Cop::Airbnb::OptArgParameters < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/opt_arg_parameters.rb#11
  def on_args(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/opt_arg_parameters.rb#7
RuboCop::Cop::Airbnb::OptArgParameters::MSG = T.let(T.unsafe(nil), String)

# Prefer matching Phrase Bundle and t call keys inside of
# PhraseBundleClasses.
#
# @example
#   # bad
#   def phrases
#   {
#   "shortened_key" => t(
#   "my_real_translation_key",
#   default: 'Does not matter',
#   ),
#   }
#   end
#
#   # good
#   def phrases
#   {
#   "my_real_translation_key" => t(
#   "my_real_translation_key",
#   default: 'Does not matter',
#   ),
#   }
#   end
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/phrase_bundle_keys.rb#27
class RuboCop::Cop::Airbnb::PhraseBundleKeys < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/phrase_bundle_keys.rb#31
  def on_send(node); end

  private

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/phrase_bundle_keys.rb#53
  def const_phrase_bundle_children(node); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/phrase_bundle_keys.rb#43
  def in_phrase_bundle_class?(node); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/phrase_bundle_keys.rb#61
  def t_call?(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/phrase_bundle_keys.rb#28
RuboCop::Cop::Airbnb::PhraseBundleKeys::MESSAGE = T.let(T.unsafe(nil), String)

# Disallow ActiveRecord calls that pass interpolated or added strings as an argument.
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/risky_activerecord_invocation.rb#5
class RuboCop::Cop::Airbnb::RiskyActiverecordInvocation < ::RuboCop::Cop::Base
  # Return true if the first arg is a :dstr that has non-:str components
  #
  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/risky_activerecord_invocation.rb#49
  def includes_interpolation?(args); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/risky_activerecord_invocation.rb#55
  def includes_sum?(args); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/risky_activerecord_invocation.rb#32
  def on_send(node); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/risky_activerecord_invocation.rb#44
  def vulnerable_ar_method?(method); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/risky_activerecord_invocation.rb#25
RuboCop::Cop::Airbnb::RiskyActiverecordInvocation::MSG = T.let(T.unsafe(nil), String)

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/risky_activerecord_invocation.rb#6
RuboCop::Cop::Airbnb::RiskyActiverecordInvocation::VULNERABLE_AR_METHODS = T.let(T.unsafe(nil), Array)

# This cop checks for Rspec describe or context method calls under a namespace.
# It can potentially cause autoloading to occur in a different order than it
# would have in development or production. This could cause flaky tests.
#
# @example
#   # bad
#
#   # spec/foo/bar_spec.rb
#   module Foo
#   describe Bar do
#   end
#   end
#
#   # good
#
#   # spec/foo/bar_spec.rb do
#
#   describe Foo::Bar
#   end
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#23
class RuboCop::Cop::Airbnb::RspecDescribeOrContextUnderNamespace < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#35
  def describe_or_context?(param0 = T.unsafe(nil)); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#96
  def get_described_class(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#102
  def get_method_parent(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#90
  def get_module_name(node); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#108
  def is_block?(node); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#86
  def is_spec_file?(path); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#38
  def on_module(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#64
  def search_children_for_describe_or_context(nodes); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#24
RuboCop::Cop::Airbnb::RspecDescribeOrContextUnderNamespace::DESCRIBE_OR_CONTEXT_UNDER_NAMESPACE_MSG = T.let(T.unsafe(nil), String)

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#31
RuboCop::Cop::Airbnb::RspecDescribeOrContextUnderNamespace::FIX_CODE_HELP_MSG = T.let(T.unsafe(nil), String)

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_describe_or_context_under_namespace.rb#28
RuboCop::Cop::Airbnb::RspecDescribeOrContextUnderNamespace::FIX_DESCRIBE_OR_CONTEXT_HELP_MSG = T.let(T.unsafe(nil), String)

# This cop checks how the Rails environment is modified in specs. If an individual method on
# Rails.env is modified multiple environment related branchs could be run down. Rather than
# modifying a single path or setting Rails.env in a way that could bleed into other specs,
# use `stub_env`
#
# @example
#   # bad
#
#   # spec/foo/bar_spec.rb
#   before(:each) do
#   allow(Rails.env).to receive(:production).and_return(true)
#   end
#
#   before(:each) do
#   expect(Rails.env).to receive(:production).and_return(true)
#   end
#
#   before(:each) do
#   Rails.env = :production
#   end
#
#   # good
#
#   # spec/foo/bar_spec.rb do
#   before(:each) do
#   stub_env(:production)
#   end
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_environment_modification.rb#31
class RuboCop::Cop::Airbnb::RspecEnvironmentModification < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_environment_modification.rb#32
  def allow_or_expect_rails_env(param0 = T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_environment_modification.rb#52
  def is_spec_file?(path); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_environment_modification.rb#44
  def on_send(node); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_environment_modification.rb#40
  def rails_env_assignment(param0 = T.unsafe(nil)); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_environment_modification.rb#36
  def stub_rails_env(param0 = T.unsafe(nil)); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/rspec_environment_modification.rb#42
RuboCop::Cop::Airbnb::RspecEnvironmentModification::MESSAGE = T.let(T.unsafe(nil), String)

# Cop to tackle prevent more complicated modifier if/unless statements
# https://github.com/airbnb/ruby#only-simple-if-unless
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_modifier_conditional.rb#6
class RuboCop::Cop::Airbnb::SimpleModifierConditional < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_modifier_conditional.rb#11
  def multiple_conditionals?(param0 = T.unsafe(nil)); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_modifier_conditional.rb#13
  def on_if(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_modifier_conditional.rb#7
RuboCop::Cop::Airbnb::SimpleModifierConditional::MSG = T.let(T.unsafe(nil), String)

# Cop to tackle prevent unless statements with multiple conditions
# https://github.com/airbnb/ruby#unless-with-multiple-conditions
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_unless.rb#6
class RuboCop::Cop::Airbnb::SimpleUnless < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_unless.rb#9
  def multiple_conditionals?(param0 = T.unsafe(nil)); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_unless.rb#11
  def on_if(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/simple_unless.rb#7
RuboCop::Cop::Airbnb::SimpleUnless::MSG = T.let(T.unsafe(nil), String)

# This cop checks for constant assignment inside of specs
#
# @example
#   # bad
#   describe Something do
#   PAYLOAD = [1, 2, 3]
#   end
#
#   # good
#   describe Something do
#   let(:payload)  { [1, 2, 3] }
#   end
#
#   # bad
#   describe Something do
#   MyClass::PAYLOAD = [1, 2, 3]
#   end
#
#   # good
#   describe Something do
#   before { stub_const('MyClass::PAYLOAD', [1, 2, 3])
#   end
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/spec_constant_assignment.rb#28
class RuboCop::Cop::Airbnb::SpecConstantAssignment < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/spec_constant_assignment.rb#33
  def on_casgn(node); end

  private

  # @return [Boolean]
  #
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/spec_constant_assignment.rb#44
  def in_spec_file?(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/spec_constant_assignment.rb#29
RuboCop::Cop::Airbnb::SpecConstantAssignment::MESSAGE = T.let(T.unsafe(nil), String)

# Disallow use of YAML/Marshal methods that can trigger RCE on untrusted input
#
# source://rubocop-airbnb//lib/rubocop/cop/airbnb/unsafe_yaml_marshal.rb#5
class RuboCop::Cop::Airbnb::UnsafeYamlMarshal < ::RuboCop::Cop::Base
  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/unsafe_yaml_marshal.rb#35
  def check_marshal(node, receiver, method_name, *_args); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/unsafe_yaml_marshal.rb#24
  def check_yaml(node, receiver, method_name, *_args); end

  # source://rubocop-airbnb//lib/rubocop/cop/airbnb/unsafe_yaml_marshal.rb#10
  def on_send(node); end
end

# source://rubocop-airbnb//lib/rubocop/cop/airbnb/unsafe_yaml_marshal.rb#6
RuboCop::Cop::Airbnb::UnsafeYamlMarshal::MSG = T.let(T.unsafe(nil), String)
