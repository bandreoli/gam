function userOptions {
    'Choose An Option:'
    '1. Create User'
    '2. Update User'
    '3. Delete User'
    '4. Return'

    $option = Read-Host -Prompt 'Enter Here'

    switch($option) {
        1 {createUser}
        2 {updateUser}
        3 {deleteUser}
        4 {}
    }
}

function createUser {
    $username = getUser
    $firstname = Read-Host -Prompt 'Firstname'
    $lastname = Read-Host -Prompt 'Lastname'
    $password = Read-Host -Prompt 'Password'
    $changepassword = Read-Host -Prompt 'Change Password on Login? (on/off)'
    $org = Read-Host -Prompt 'OU'
    gam create user $username firstname $firstname lastname $lastname password $password changepassword $changepassword org $org
}

function updateUser {
    $username = getUser
}

function deleteUser {
    $continue = 'y'

    while($continue -eq 'y') {
        $username = getUser

        $delete = Read-Host -Prompt "Are you sure you want to delete $username ? (y/n)"

        if($delete -eq 'y') {
            gam delete user $username
        }

        $continue = Read-Host -Prompt 'Delete another user? (y/n)'
    }
}

function getUser {
    $exists = 1
    while($exists -eq 1) {
        $username = Read-Host -Prompt 'Input Username'
        $exists = 0
    }
    return $username
}