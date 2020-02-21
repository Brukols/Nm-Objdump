/*
** EPITECH PROJECT, 2020
** objdump
** File description:
** flag_has_syms
*/

#include "../../../include/objdump.h"
#include <stdio.h>

int flag_has_syms(objdump_t *obj)
{
    char *name;

    for (size_t i = 0; i < obj->ehdr->e_shnum; i++) {
        name = obj->shdr.addrstrtable + obj->shdr.get_sh_name(obj, i);
        if (!strcmp(name, ".dynsym") || !strcmp(name, ".symtab"))
            return (HAS_SYMS);
    }
    return (0);
}