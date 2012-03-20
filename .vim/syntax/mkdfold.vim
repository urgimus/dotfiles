" Markdown section regions to be folded
syn region mkdSec1 start=/^\s*#[^#].*/ end=/^\s*#[^#].*/me=s-1 fold 
syn region mkdSec2 start=/^\s*##[^#].*/ end=/^\s*#\{1,2\}[^#].*/me=s-1 fold containedin=mkdSec1
syn region mkdSec3 start=/^\s*###[^#].*/ end=/^\s*#\{1,3\}[^#].*/me=s-1 fold containedin=mkdSec1,mkdSec2

