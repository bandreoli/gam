function userOptions {
    $continue = 1

    while($continue -eq 1) {
        'User Options:'
        '1. Get User Info'
        '2. Create User'
        '3. Update User'
        '4. Delete User'
        '5. Return'

        $option = Read-Host -Prompt 'Enter Here'

        switch($option) {
            1 {getUserInfo}
            2 {createUser}
            3 {updateUser}
            4 {deleteUser}
            5 {$continue = 0}
        }
    }
}

function getUserInfo {
    $continue = 'y'

    while($continue -eq 'y') {
        $username = getUser

        gam info user $username

        $continue = Read-Host -Prompt 'Get info from another user? (y/n)'
    }
}

function createUser {
    $continue = 'y'

    while($continue -eq 'y') {
        'Creating New User'
        $username = getUser
        $firstname = Read-Host -Prompt 'Firstname'
        $lastname = Read-Host -Prompt 'Lastname'
        $password = Read-Host -Prompt 'Password'
        $changepassword = Read-Host -Prompt 'Change Password on Login? (on/off)'
        $org = Read-Host -Prompt 'OU'
        gam create user $username firstname $firstname lastname $lastname password $password changepassword $changepassword org $org

        $continue = Read-Host -Prompt 'Create another user? (y/n)'
    }
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