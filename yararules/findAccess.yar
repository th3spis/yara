rule trufedAccess
{
    strings:
	$st1 = "GET /wp-config.php"
	$st2 = "GET /wp-snapshots/tmp/index.php"
	$st3 = "GET /wp-snapshots/index.php"
	$st4 = "GET /wp-settings.php"
	$st5 = "GET /.well-known/pki-validation/index.php"
	$st6 = "GET /.well-known/index.php"
	$st7 = "GET /.tmb/index.php"
	$st9 = "GET /tienda/wp-config.php"
	$st10 = "GET /tienda/wp-settings.php"
	$st11 = "GET /tienda/.tmb/index.php"
	$st12 = "GET /tienda/index.php"
	$st8 = "GET /index.php"
    condition:
        $st1 or $st2 or $st3 or $st4 or $st5 or $st6 or $st7 or $st9 or $st10 or $st11 or $st12 or $st8
}


