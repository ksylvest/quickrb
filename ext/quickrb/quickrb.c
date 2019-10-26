#include "quickrb.h"
#include "quickrb_context.h"

VALUE rb_mQuickRB;

void Init_quickrb()
{
  rb_mQuickRB = rb_define_module("QuickRB");

  init_quickrb_context();

  const char *filename = "runtime";
  const char *script = "3 + 4";
  const size_t length = strlen(script);

  JSRuntime *runtime = JS_NewRuntime();
  JSContext *context = JS_NewContext(runtime);

  JSValue value = JS_Eval(context, script, length, filename, JS_EVAL_TYPE_GLOBAL);

  const char *result = JS_ToCString(context, value);
  printf("%s = %s\n", script, result);
  JS_FreeCString(context, result);

  JS_FreeContext(context);
  JS_FreeRuntime(runtime);
}
