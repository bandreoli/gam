function ouOptions {
    $continue = 1

    while($continue -eq 1) {
        'OU Options'
        '1. Get OU Info'
        '2. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {}
            2 {$continue = 0}
        }
    }
}