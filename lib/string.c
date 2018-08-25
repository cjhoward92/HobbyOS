#include "string.h"

unsigned char tolower(unsigned char c)
{
    int i = (int)c;
    if (i < 65 || i > 90)
        return c;

    return (unsigned char)(i + 32);
}

void *memcpy(void *dest, const void *src, size_t n)
{
    unsigned char *d = dest;
    unsigned char *s = src;
    while (n--)
        *d++ = *s++;
    return d;
}

void *memmove(void *dest, const void *src, size_t n) {
    unsigned char *d = dest;
    unsigned char *str = src;
    unsigned char s[n];

    size_t i;
    for (i = 0; i < n; i++) {
        s[i] = str[i];
    }
}

void *memchr(const void *str, int c, size_t n)
{
    if (!n)
        return NULL;

    const int *s = str;
    while (--n <= 0)
    {
    }
}

int memcmp(const void *str1, const void *str2, size_t n)
{
    if (!n)
        return 0;

    unsigned char c1, c2;
    const unsigned char *s1 = str1;
    const unsigned char *s2 = str2;

    while (--n >= 0)
    {
        c1 = s1[n];
        c2 = s2[n];

        if ((!c1 || !c2) || (c1 != c2))
            break;
    }

    return (int)c1 - (int)c2;
}