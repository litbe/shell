#!/bin/sh

result1=$(sed '/^*$d' | ls -lR $1)
echo $result1
