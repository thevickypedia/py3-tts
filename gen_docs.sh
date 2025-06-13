#!/usr/bin/env bash
# 'set -e' stops the execution of a script if a command or pipeline has an error.
# This is the opposite of the default shell behaviour, which is to ignore errors in scripts.
set -e

clean_docs() {
  # Clean up docs directory keeping the CNAME file if present
  directory="docs"
  file_to_keep="CNAME"
  if [ -e "${directory}/${file_to_keep}" ]; then
    find "${directory}" -mindepth 1 ! -name "${file_to_keep}" -exec rm -rf {} +
  else
    find "${directory}" -mindepth 1 -exec rm -rf {} +
  fi
}

gen_docs() {
  # Generate sphinx docs
	mkdir -p doc_generator/_static  # creates a _static folder if unavailable
  cd doc_generator && make dirhtml && mv _build/dirhtml/* ../docs && rm -rf _build && cd ..
}

run_pytest() {
  # Run pytest
  export PYTHONWARNINGS="ignore::DeprecationWarning"
  python -m pytest
}

gen_docs &
clean_docs &
run_pytest &

wait

# The existence of this file tells GitHub Pages not to run the published files through Jekyll.
# This is important since Jekyll will discard any files that begin with _
touch docs/.nojekyll
