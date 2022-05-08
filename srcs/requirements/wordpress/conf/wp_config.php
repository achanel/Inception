<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'DATABASE_NAME' );

/** Database username */
define( 'DB_USER', 'DATABASE_USER' );

/** Database password */
define( 'DB_PASSWORD', 'DATABASE_PASS' );

/** Database hostname */
define( 'DB_HOST', 'DATABASE_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 * 
 *  */
define('AUTH_KEY',         'QzAZyD*:a&lXTCj:+-i1+x5(T%*y-2G(Gpztg8Nx]g,?#j&g{~+~;n05T};bs<N*');
define('SECURE_AUTH_KEY',  'hoMDds%}DJ/x>4IeV2ZkXwwD+-Na WWz]qA04GM*wi41Km/HJN-]MxxO)@A/<5m^');
define('LOGGED_IN_KEY',    'btPbSA,:DJKV=cRiR!?m#wz;,9f;a++>O4+@:],1jpwj-G]h| of0wW.]-yp$ip8');
define('NONCE_KEY',        'zVLZaSFg`7E&$zWoo!-cy#x+9X;u8B#<87bn6-{$lmK({At.dFnBR)HZ8WVj)8#A');
define('AUTH_SALT',        'yW+uBZ%NM0ERd:bD*j>b<qLbnOLzta[Ft-xAs9; >fl[+|POgy07PPyx=-8?^3Z*');
define('SECURE_AUTH_SALT', '.4,>:u]Y:B2~+F?w5e.HJs-ROd|*A?J#y].i{N+k_<K22u/_l@M/bj~4v|&h-$Cl');
define('LOGGED_IN_SALT',   '9Av{2I^K`gEj+OMUS5|,V#rn/S3ME|t`vYN}wZzv[BA%~$FlBy)3*a=*}Q18}e6z');
define('NONCE_SALT',       'MZT3,>_:*fL$uFk2l2XE,:&@(xpiDnPpPUA<$?V@;hk~8in --*|P1wb-#H@cp^G');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';