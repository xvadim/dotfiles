set omnifunc=htmlcomplete#CompleteTags

set makeprg=linkchecker\ -v\ --check-extern\ -o\ csv\ %

set errorformat=%-G#%.%#,
                \%-Gurlname;parentname;%.%#,
                \%-G%.%#;True;%.%#,
                \%-G%.%#URLs\ checked%.%#,
                \%.%#file://%f;;%m;;;False;%.%#;%l;%c;%.%#;%.%#;%.%#;%.%#;%.%#;%.%#;
