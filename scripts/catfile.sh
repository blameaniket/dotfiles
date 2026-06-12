#!/usr/bin/env bash

selection=`fzf`

echo $selection
cat $selection

