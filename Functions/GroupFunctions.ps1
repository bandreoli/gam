function groupOptions {
    $continue = 1

    while($continue -eq 1) {
        'Group Options'
        '1. Get Group Info'
        '2. Create Group'
        '3. Show All Groups'
        '10. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getGroupInfo}
            2 {createGroup}
            3 {printGroups}
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

function deleteGroup {
    $continue = 'y'

    while($continue -eq 'y') {
        'Deleting Group'

        $group = getGroup


        $delete = Read-Host -Prompt "Are you sure you want to delete $group ? (y/n)"

        if($delete -eq 'y') {
            gam delete group $group
        }

        $continue = Read-Host -Prompt 'Delete another Group? (y/n)'
        ''
    }
}

function printGroups {
    gam print groups name description members
    ''
}

function getGroup {
    $group = ""
    while($group -eq "") {
        $group = Read-Host -Prompt 'Input Group (Required)'
    }
    return $group
}