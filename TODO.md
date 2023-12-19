# todo

-   grep for things across multiple lines

    e.g., "pastoral assistant"
    
        /^.*pastoral[ \t\r\n]+assistant.*$/im

    with `--html`:

        /^.*pastoral([ \t\r\n]+|<[^>]*>)+assistant([^\r\n]+|<[^>]*>)*$/sim
