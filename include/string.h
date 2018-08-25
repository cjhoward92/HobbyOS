#ifndef __STRING_H__
#define __STRING_H__

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

void *memcpy(void *dest, const void *src, size_t n);

void *memmove(void *dest, const void *src, size_t n);

void *memchr(const void *str, int c, size_t n);

int memcmp(const void *str1, const void *str2, size_t n);

#endif