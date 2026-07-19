function cs50
    set src $argv[1]
    set out (path change-extension '' $src)
    clang $src -lcs50 -o $out
end
