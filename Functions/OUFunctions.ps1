function ouOptions {
    $continue = 1

    while($continue -eq 1) {
        'OU Options'
        '1. Get OU Info'
        '2. Create OU'
        '3. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getOUInfo}
            2 {createOU}
            3 {$continue = 0}
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

function createOU {
    $continue = 'y'

    while($continue -eq 'y') {
        'Creating OU'

        $ou = getOU

        $desc = Read-Host -Prompt 'Description'
        if($desc -ne '') {
            $descCom = " description '$desc'"
        }
        $parent = Read-Host -Prompt 'Parent OU'
        if($parent -ne '') {
            $parentCom = " parent '$parent'"
        }

        $command = "gam create org '$ou' $descCom $parentCom"

        iex $command

        $continue = Read-Host -Prompt 'Create another OU? (y/n)'
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