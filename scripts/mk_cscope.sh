#!/bin/sh
echo "rm *cscope*"
rm *cscope*
echo "rm *tags*"
rm *tags*
set -x
find . \( -name "*.[ch]" -or -name "*.pm"  -or -name "*.cpp" \) > cscope.files
# find ../raidv2 \( -name "*.[ch]" -or -name "*.pm" \) >> cscope.files
# find ../rsm \( -name "*.[ch]" -or -name "*.pm" \) >> cscope.files
touch tags.lst
find | grep "\.c$" >> tags.lst
find | grep "\.cpp$" >> tags.lst
find | grep "\.h$" >> tags.lst
cscope -i tags.lst
cscope -b
ctags -R .
