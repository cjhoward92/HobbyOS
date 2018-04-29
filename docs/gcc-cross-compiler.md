# Building a GCC Cross Compiler

Follow the tutorial found [here](https://wiki.osdev.org/GCC_Cross-Compiler) and make sure your arch is `x86_64` and not something like `i386` or `i686` as those are 32bit. Make sure you also [build without redzone](https://wiki.osdev.org/Libgcc_without_red_zone) or you will have a bad time...

Lastly, it is recommended you build all of the optional dependencies from source, as it is real tricky to compile anything without them.

For building the OS and Kernel, see [here](https://wiki.osdev.org/Bare_Bones);