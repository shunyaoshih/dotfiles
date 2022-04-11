#!/usr/bin/env bash
# ./color.sh | less -r
for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
done
