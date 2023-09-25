#!/usr/bin/env bash

layout_rust() {
  CARGO_HOME="$(direnv_layout_dir)/cargo"
  export CARGO_HOME
}
