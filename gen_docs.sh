#!/usr/bin/env bash
# 'set -e' stops the execution of a script if a command or pipeline has an error.
# This is the opposite of the default shell behaviour, which is to ignore errors in scripts.
set -e
if [ -e "docs/CNAME" ]; then
  cp "docs/CNAME" "CNAME"
fi
rm -rf docs
mkdir docs
mkdir -p doc_generator/_static  # creates a _static folder if unavailable
cd doc_generator && make dirhtml && mv _build/dirhtml/* ../docs && rm -rf _build && cd ..
touch docs/.nojekyll
if [ -e "CNAME" ]; then
  cp "CNAME" "docs/CNAME"
fi
