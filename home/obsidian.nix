_: {
  home.file.".obsidian.vimrc".text = ''
    imap <C-g> <Esc>
    vmap <C-g> <Esc>

    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap * *zzzv

    set clipboard=unnamed

    nmap <F8> :nohl

    exmap back obcommand app:go-back
    nmap <C-o> :back
    exmap forward obcommand app:go-forward
    nmap <C-i> :forward
    exmap close obcommand workspace:close
    nmap q :close

    nmap j gjzz
    nmap k gkzz

    exmap surround_wiki surround [[ ]]
    exmap surround_double_quotes surround " "
    exmap surround_single_quotes surround ' '
    exmap surround_brackets surround ( )
    exmap surround_square_brackets surround [ ]
    exmap surround_curly_brackets surround { }
    exmap surround_italic surround _ _
    exmap surround_bold surround __ __

    vunmap S
    vmap S" :surround_double_quotes
    vmap S' :surround_single_quotes
    vmap S( :surround_brackets
    vmap S) :surround_brackets
    vmap S[ :surround_square_brackets
    vmap S] :surround_square_brackets
    vmap S{ :surround_curly_brackets
    vmap S} :surround_curly_brackets
    vmap Sl :surround_wiki
    vmap Si :surround_italic
    vmap Sb :surround_bold

    exmap goto_link obcommand editor:follow-link
    nmap gd :goto_jlink

    unmap <Space>
    exmap open_file obcommand switcher:open
    nmap <Space>fs :open_file
  '';
}