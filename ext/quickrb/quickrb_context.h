#ifndef CONTEXT_H
#define CONTEXT_H

#include "quickrb.h"

void init_quickrb_context();

VALUE quickrb_context_alloc(VALUE self);
VALUE quickrb_context_eval();

#endif /* CONTEXT_H */
