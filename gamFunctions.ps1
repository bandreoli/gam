. "Functions\UserFunctions"

$continue = 'y'

while($continue -eq 'y') {
    'Choose An Option:'
    '1. Users'
    '2. OUs'
    '3. Groups'
    '4. Exit'

    $option = Read-Host -Prompt 'Enter Here'

    switch($option) {
        1 {userOptions}
        2 {ouOptions}
        3 {groupOptions}
        4 {}
    }

    if($option -eq 4) {
        $continue = 0
    } else {
        $continue = Read-Host -Prompt 'Continue? (y/n)'
    }
}