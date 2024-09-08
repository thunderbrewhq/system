#ifndef SYSTEM_UNSAFE_HPP
#define SYSTEM_UNSAFE_HPP

// Abbreviations to disable the UndefinedBehaviorSanitizer

#define WHOA_UNSAFE __attribute__((no_sanitize("undefined")))

#define WHOA_UNSAFE_BOUNDS __attribute__((no_sanitize("bounds")))

#endif
