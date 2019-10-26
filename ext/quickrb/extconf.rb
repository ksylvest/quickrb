require 'mkmf'

FUNCTIONS = %w[
  JS_NewRuntime
  JS_FreeRuntime
  JS_NewContext
  JS_FreeContext
  JS_Eval
].freeze

INCLUDE_PATH = '/usr/local/include/quickjs'.freeze
LIB_PATH = '/usr/local/lib/quickjs'.freeze

abort('missing "quickjs.h"') unless find_header('quickjs.h', INCLUDE_PATH)

FUNCTIONS.each do |fn|
  abort("missing #{fn.inspect}") unless find_library('quickjs', fn, LIB_PATH)
end

create_makefile('quickrb/quickrb')
