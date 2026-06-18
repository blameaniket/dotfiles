#!/usr/bin/env bash

selection=`rg --files ~ -g '*.pdf*' | fzf`
sioyek $selection &
