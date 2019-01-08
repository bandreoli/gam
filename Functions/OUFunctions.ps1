function ouOptions {
    $continue = 1

    while($continue -eq 1) {
        'OU Options'
        '1. Get OU Info'
        '2. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getOUInfo}
            2 {$continue = 0}
        }
    }
}

function getOUInfo {
    $continue = 'y'

    while($continue -eq 'y') {
        'Getting OU Info'

        $ou = getOU
        gam info org $ou

        $continue = Read-Host -Prompt 'Get info from another OU? (y/n)'
        ''
    }
}

function getOU {
    $ou = ""
    while($ou -eq "") {
        $ou = Read-Host -Prompt 'Input OU (Required)'
    }
    return $ou
}