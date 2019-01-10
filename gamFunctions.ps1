. "Functions\UserFunctions"
. "Functions\DriveFunctions"
. "Functions\OUFunctions"
. "Functions\GroupFunctions"
. "Functions\SchemaFunctions"

$continue = 1

'Google Admin Management'
'Ctrl+C to exit at any time'
''

while($continue -eq 1) {
    'Choose An Option:'
    '1. Users'
    '2. OUs'
    '3. Groups'
    '4. Drive'
    '5. Schemas'
    '6. Exit'

    $option = Read-Host -Prompt 'Enter Here'
    ''

    switch($option) {
        1 {userOptions}
        2 {ouOptions}
        3 {groupOptions}
        4 {driveOptions}
        5 {schemaOptions}
        6 {$continue = 0}
    }
}