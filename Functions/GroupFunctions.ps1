function groupOptions {
    $continue = 1

    while($continue -eq 1) {
        'Group Options'
        '1. Get Group Info'
        '2. Create A Group'
        '10. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getGroupInfo}
            2 {createGroup}
            10 {$continue = 0}
        }
    }
}

function getGroupInfo {
    $continue = 'y'

    while($continue -eq 'y') {
        "Getting Group Info"

        $group = getGroup
        iex "gam info group '$group'"

        $continue = Read-Host -Prompt 'Get info from another Group? (y/n)'
        ''
    }
}

function createGroup {
    $continue = 'y'

    while($continue -eq 'y') {
        "Creating Another Group"

        $group = getGroup

        iex "gam create group '$group'"

        $continue = Read-Host -Prompt 'Create another Group? (y/n)'
        ''
    }
}

function getGroup {
    $group = ""
    while($group -eq "") {
        $group = Read-Host -Prompt 'Input Group (Required)'
    }
    return $group
}