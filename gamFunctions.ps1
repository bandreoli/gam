. "Functions\UserFunctions"
. "Functions\DriveFunctions"

$continue = 1

while($continue -eq 1) {
    'Choose An Option:'
    '1. Users'
    '2. OUs'
    '3. Groups'
    '4. Drive'
    '5. Exit'

    $option = Read-Host -Prompt 'Enter Here'
    ''

    switch($option) {
        1 {userOptions}
        2 {ouOptions}
        3 {groupOptions}
        4 {driveOptions}
        5 {$continue = 0}
    }
}