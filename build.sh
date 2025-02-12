#!/bin/bash

bnfc -m TinyPlus.cf
make
ghc --make Interpret.hs