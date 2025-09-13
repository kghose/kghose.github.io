# Neo(Vi(m))


| Task | Commands |
| ------- | ---------------------|
| Open file in new tab | `tabedit <filename>` |
| Go to third tab | `2gt` |
| Wrap paragraph | `gq}` |
| Go to 34% of the file | `34%` |
| Copy large number of lines | Mark starting line: `ma`|
| | At last line, yank from mark: ``y`a``|
| This can be used to delete too | ``d`a``|
| See available color schemes | `:colorscheme [space] [CTRL+D]` |
| Built in color schemes are in | `/usr/share/vim/vim90/colors/` |
| Open builtin file explorer `netrw` | `:Explore`, `:Sexplore`, `:Vexplore` |


| `GitGutterStageHunk` | Stage the hunk the cursor is on |

## Auto save for markdown files

In `.vimrc`/`init.vim`
```
" Auto save for markdown files in insert mode
autocmd BufNewFile,BufRead *.md :autocmd TextChangedI <buffer> if &readonly == 0 | silent write | endif
```

Refs: [[1](https://stackoverflow.com/a/60095826)], [[2](https://stackoverflow.com/a/63589188)]


## Copy-paste

Check if compiled with clipboard support
```
vim --version | grep clipboard

# or
:echo has('clipboard'))
```

Paste from clipboards (When compiled with +clipboard option
```
"+p
"*p
```


## _Esc_ ape from insert mode is slow

https://vi.stackexchange.com/a/20220
```
set tttimeoutlen=5
```


## Builtin file explorer: `netrw`

```
# Start with
```

Refs: [[1](https://www.vim.org/scripts/script.php?script_id=1075)], 
[[2](https://neovim.io/doc/user/pi_netrw.html)]

## Color schemes
```



## Plugins
1. [git gutter](https://github.com/airblade/vim-gitgutter)
2. [A.L.E](https://github.com/dense-analysis/ale)
3. ~~[NERDTree](https://github.com/preservim/nerdtree)~~ 
Actually, the "builtin" explorer `netrw` is good enough for me.


