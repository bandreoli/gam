$username = $args[0]

if($username -like "") {
	throw ".\changepassword.ps1 username"
}

gam update user $username password Password123 changepassword on