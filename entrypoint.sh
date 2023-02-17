#!/bin/sh

git config --global --add safe.directory /src
/usr/local/bin/gitleaks detect --verbose --redact
