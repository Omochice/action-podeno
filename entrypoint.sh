#!/bin/sh -l

echo "Hello $1"
time=$(date)
ls
echo "time=$time" >> $GITHUB_OUTPUT

