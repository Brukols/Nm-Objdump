/*
** EPITECH PROJECT, 2020
** utiliuty
** File description:
** header
*/

#ifndef UTILITY_H
#define UTILITY_H

#include "nm.h"

typedef struct section_s {
    char letter;
    bool (*ptr)(nm_t *, int);
} section_t;

#endif /* !UTILITY_H */
