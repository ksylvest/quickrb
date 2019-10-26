#include "quickrb_context.h"

#define FILENAME ("runtime")

extern VALUE rb_mQuickRB;
VALUE rb_cQuickRBContext;

static const rb_data_type_t quickrb_runtime_type = {
  .wrap_struct_name = "quickrb_context",
  .function = {
    .dmark = NULL,
    .dfree = JS_FreeContext,
    .dsize = NULL,
  },
  .data = NULL,
  .flags = RUBY_TYPED_FREE_IMMEDIATELY,
};

void init_quickrb_context() {
  rb_cQuickRBContext = rb_define_class_under(rb_mQuickRB, "Context", rb_cObject);
  rb_define_method(rb_cQuickRBContext, "eval", quickrb_context_eval, -1);
}

VALUE quickrb_context_alloc(VALUE self) {
  JSRuntime *runtime = JS_NewRuntime();
  JSContext *context = JS_NewContext(runtime);
  return TypedData_Wrap_Struct(self, &quickrb_runtime_type, context);
}

VALUE quickrb_context_eval(int argc, VALUE *argv, VALUE self) {
  VALUE input;
  VALUE filename;
  rb_scan_args(argc, argv, "11", &input, &filename); // i.e. input (required) and filename (optional)

  Check_Type(input, T_STRING);
  if (!NIL_P(filename)) { Check_Type(filename, T_STRING); }

  printf("quickrb_context_eval\n");
  printf("INPUT: %s\n", StringValueCStr(input));
  printf("FILENAME: %s\n", NIL_P(filename) ? FILENAME : StringValueCStr(filename));
  // JSValue value = JS_Eval()
}
