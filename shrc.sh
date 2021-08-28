#!/usr/bin/env bash

function br() {
  echo "$(git symbolic-ref --short HEAD)";
}
