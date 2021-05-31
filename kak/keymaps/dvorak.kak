set-option global keymap_name "Dvorak"

map global normal l s
map global normal s l
map global normal n k
map global normal k n
map global normal t j
map global normal j t

map global normal <s-l> <s-s>
map global normal <s-s> <s-l>
map global normal <s-n> <s-k>
map global normal <s-k> <s-n>
map global normal <s-t> <s-j>
map global normal <s-j> <s-t>

map global normal <a-l> <a-s>
map global normal <a-L> <a-S>
map global normal <a-s> <a-l>
map global normal <a-n> <a-k>
map global normal <a-k> <a-n>

map global normal <c-l> <c-s>
map global normal <c-s> <c-l>
map global normal <c-n> <c-k>
map global normal <c-k> <c-n>
# map global normal <c-t> <c-j>
map global normal <c-j> <c-t>

map global goto s l -docstring "line end"
map global goto n k -docstring "buffer top"
map global goto t j -docstring "buffer bottom"
