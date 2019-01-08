function groupOptions {
    $continue = 1

    while($continue -eq 1) {
        'Group Options'
        '1. Get Group Info'
        '2. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {}
            2 {$continue = 0}
        }
    }
}