#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
RED='\033[0;31m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'


test_passed=0
test_crashed=0
test_failed=0
nb_test=0

# $1 = path binary
# $2 = description of the test
exec_test()
{
    ((nb_test++))
    echo -ne "${CYAN}${bold}Test n°$nb_test${NC} ${bold}($2)${NC} : "

    # Get the expect value
    expect=`nm $1`

    # Get the actual value
    result=`./my_nm $1`

    if [[ "$expect" == "$result" ]]
    then
        echo -ne "${GREEN}${bold}OK${NC}\n"
        ((test_passed++))
    else
        echo -ne "${RED}${bold}KO${NC}\n"
        ((test_failed++))
    fi
}

exec_test "my_objdump" "test simple objdump"
exec_test "/usr/lib64/ld-linux-x86-64.so.2" "/usr/lib64/ld-linux-x86-64.so.2"
exec_test "src/init_elfs_struct.o" "src/init_elfs_struct.o relocatable file"

exit 0