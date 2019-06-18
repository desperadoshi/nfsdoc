#!/bin/bash
hugo -d docs/
git add --all
git commit -m "update"
git push
