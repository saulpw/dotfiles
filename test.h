/*
 * Frictionless test framework
 *
 * Copyright (c) 2020  Saul Pwanson <code@saul.pw>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 *
 * To use, put tests inside .c files like this:
 *
 * #ifdef TEST
 * TEST(testname) {
 *   CHECK(whatever());
 *   CHECK_EQ(int, 2+2, 5);  // pretty-printing on fail
 * }
 * #endif
 *
 * Then call runtests() from main() (a weak main() is included here also).
 *
 * Output is to stderr by default; define TESTLOG(FMT, ARGS...) for different behaviour.
 */

#ifndef TEST

#include <stdbool.h> // bool
#include <stdio.h>   // fprintf
#include <stdlib.h>  // abort

#ifndef TESTLOG  // predefine TESTLOG for different behaviour
#define TESTLOG(FMT, ARGS...) fprintf(stderr, FMT "\n", ##ARGS)
#endif

typedef struct test_state_t {
    int nfail;
    int npass;
    int ntests;
} test_state_t;

typedef struct testdesc_t {
    const char *name;
    void (*func)(test_state_t *);
} test_desc_t;

#define TEST(TESTNAME)                           \
    extern void test_##TESTNAME(test_state_t *); \
    test_desc_t desc_##TESTNAME                   \
        __attribute__((__section__("tests")))    \
        __attribute__((__used__))                \
         = { #TESTNAME, test_##TESTNAME };       \
    void test_##TESTNAME(test_state_t *__test)

extern test_desc_t __stop_tests;
extern test_desc_t __start_tests;

static void runtests(void) {
    test_state_t t = {0};

    for (test_desc_t *desc = &__start_tests; desc < &__stop_tests; ++desc) {
        TESTLOG("[%s]", desc->name);
        (*desc->func)(&t);
    }

    if (t.nfail > 0) {
        TESTLOG("%d/%d checks passed (%d FAILED)", t.npass, t.ntests, t.nfail);
        abort();
    }

    if (t.nfail == 0 && t.npass == t.ntests) {
        TESTLOG("ALL %d checks PASS", t.ntests);
    }
}

void main(void) { runtests(); }

#define CHECK(EXPR) ({        \
    __test->ntests += 1;      \
    bool passed = (EXPR);     \
    if (passed) {             \
        __test->npass += 1;   \
    } else {                  \
        TESTLOG("FAILED: " #EXPR); \
        __test->nfail += 1;   \
    }                         \
    passed; \
})

//
// fancier checking with typed output on failure
//

typedef void *ptr;

#define FMT_int "%d"
#define FMT_uint "%u"
#define FMT_float "%f"
#define FMT_ptr "%p"
#define FMT_int8_t FMT_int
#define FMT_int16_t FMT_int
#define FMT_int32_t FMT_int
#define FMT_int64_t "%ld"
#define FMT_uint8_t FMT_uint
#define FMT_uint16_t FMT_uint
#define FMT_uint32_t FMT_uint

#define CHECK_CMP(TYPE, OP, A, B) ({ \
    typeof(A) _a = (A); \
    typeof(B) _b = (B); \
    bool passed2 = CHECK(_a OP _b); \
    if (!passed2) { \
        TESTLOG(#A " " #OP " " #B " (" FMT_##TYPE " " #OP " " FMT_##TYPE " is false)", (TYPE) _a, (TYPE) _b); \
    } \
    passed2; \
})

#define CHECK_EQ(T, A, B) CHECK_CMP(T, ==, A, B)
#define CHECK_NEQ(T, A, B) CHECK_CMP(T, !=, A, B)
#define CHECK_GTEQ(T, A, B) CHECK_CMP(T, >=, A, B)

TEST(unittest) {
    CHECK_EQ(int, 2+2, 4);
    CHECK_NEQ(int, 2+2, 5);
}

#endif
