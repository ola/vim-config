set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
syntax on

"set hidden
set history=100
set vb t_vb=

let mapleader = ","

runtime! config/**/*
