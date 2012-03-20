" ---------------------------------------------------------------------------- #
"
" ~/.vimrc
" Last updated: 24.06.2011
"
" ---------------------------------------------------------------------------- #
" Подсветка синтаксиса
syntax enable

" Включить автоотступ
set autoindent

" Включаем 'умную' автоматическую расстановку отступов
set smartindent

" Использовать <Backspace>, вместо <x>
set backspace=indent,eol,start

" Отключить режим совместимости с Vi
set nocompatible

" Включить режим Paste
set paste

" Размер табуляции
set tabstop=4

" Включает отображение номеров строк
set number 

" Code Folding
if has ('folding')
  set foldenable
  set foldmethod=marker
  set foldmarker={{{,}}}
  set foldcolumn=0
endif

"включаем поддержку 256 цветов
set t_Co=256
let g:solarized_termcolors=256

" Цветовая схема
"colorscheme dante
"colorscheme desert
"colorscheme neverland
"colorscheme wombat
"colorscheme xterm16
"colorscheme zenburn
"colorscheme professional
colorscheme solarized

" Указать цвет комментариев
" highlight Comment ctermfg=darkgrey

" Указать фон консоли
set background=dark
"set background=light

" История команд - 50
set history=50

" Включаем мышь
set mouse=a
set mousemodel=popup

" Показывать линию курсора
set cursorline

" Всегда показывать положение курсора
set ruler

"Маркер строки
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Автоопределение файлов
filetype plugin on
filetype indent on

" Формат строки состояния
set statusline=%<%f%h%m%r\ %l,%c%V\ %P 


" Всегда отображать статусную строку для каждого окна
set laststatus=2

" Показывать текущую команду
set showcmd

" Показывать режим работы
set showmode

" Поиск в реалтайме
set incsearch

" Отключаем создание бэкапов
set nobackup

" Отключаем создание swap файлов
set noswapfile

" Кодировка текста по умолчанию
set termencoding=utf-8

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Просмотр нетекстовых файлов в Vim
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"

" Стрелки для комментариев 
map - $a --><Esc>
map = $a <--<Esc> 

" Быстрое сохранение на <F2> во всех режимах
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>

map <F4>  <esc>:call SWITCHFOLD()<cr>                                                                                                                                             
function SWITCHFOLD()
    if &foldmethod=="marker"
        set foldmethod=syntax
        return
    endif
    if &foldmethod=="syntax"
        set foldmethod=indent
        return
    endif
    if &foldmethod=="indent"
        set foldmethod=manual
        return
    endif
    if &foldmethod=="manual"
        set foldmethod=marker
        return
    endif
endfunction

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" Выход без сохранения на <F10> во всех режимах
imap <F10> <Esc>:q!<CR>
map <F10> <Esc>:q!<CR>

" Вставка из буфера мыши
map <S-Insert> <Middlemouse>
vmap <c-c> "+y
imap <c-v> <esc>"+gPi
nmap <c-v> "+gP
""

"НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)
set foldenable " включить фолдинг
set foldmethod=syntax " определять блоки на основе синтаксиса файла
set foldcolumn=3 " показать полосу для управления сворачиванием
set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
let perl_folding=1 " правильное сворачивание классов и функций Perl
let php_folding=1 " правильное сворачивание классов и функций PHP
set foldopen=all " автоматическое открытие сверток при заходе в них

fu! TabMoveLeft()
		let current_tab = tabpagenr()
		if current_tab > 1
		   let current_tab = current_tab - 2
		   execute 'tabmove' current_tab
		endif
	endf

	fu! TabMoveRight()
		let current_tab = tabpagenr()
		execute 'tabmove' current_tab
	endf

" предыдущая вкладка
nmap <silent><A-j> :tabprevious<CR>
imap <silent><A-j> <C-O>:tabprevious<CR>
vmap <silent><A-j> <ESC>:tabprevious<CR>

" следующая вкладка
nmap <silent><A-k> :tabnext<CR>
imap <silent><A-k> <C-O>:tabnext<CR>
vmap <silent><A-k> <ESC>:tabnext<CR>

" первая вкладка
nmap <silent><A-h> :tabfirst<CR>
imap <silent><A-h> <C-O>:tabfirst<CR>
vmap <silent><A-h> <ESC>:tabfirst<CR>

" последняя вкладка
nmap <silent><A-l> :tablast<CR>
imap <silent><A-l> <C-O>:tablast<CR>
vmap <silent><A-l> <ESC>:tablast<CR>

" переместить вкладку в начало
nmap <silent><A-S-h> :tabmove 0<CR>
imap <silent><A-S-h> <C-O>:tabmove 0<CR>
vmap <silent><A-S-h> <ESC>:tabmove 0<CR>

" переместить вкладку в конец
nmap <silent><A-S-l> :tabmove<CR>
imap <silent><A-S-l> <C-O>:tabmove<CR>
vmap <silent><A-S-l> <ESC>:tabmove<CR>

" переместить вкладку назад
nmap <silent><A-S-j> :call TabMoveLeft()<CR>
imap <silent><A-S-j> <C-O>:call TabMoveLeft()<CR>
vmap <silent><A-S-j> <ESC>:call TabMoveLeft()<CR>

" переместить вкладку вперёд
nmap <silent><A-S-k> :call TabMoveRight()<CR>
imap <silent><A-S-k> <C-O>:call TabMoveRight()<CR>
vmap <silent><A-S-k> <ESC>:call TabMoveRight()<CR>
