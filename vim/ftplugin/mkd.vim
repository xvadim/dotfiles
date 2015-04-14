set makeprg=linkchecker\ -v\ --check-extern\ \-f\ ~\/work\/blogger\/lrc\ -o\ csv\ %

set errorformat=%-G#%.%#,
                \%-Gurlname;parentname;%.%#,
                \%-G%.%#;True;%.%#,
                \%-G%.%#URLs\ checked%.%#,
                \%.%#file://%f;;%m;;;False;%.%#;%l;%c;%.%#;%.%#;%.%#;%.%#;%.%#;%.%#;
