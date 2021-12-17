<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'motpresse' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'jLciR6}35=|.nb-u23/UuMVRUNI]E$QE~: &h-M??U`+.wedtTSp %}&FNJ|mruC');
define('SECURE_AUTH_KEY',  '6Ykcm)P)NZ/@%ybfb+RWqxmi -@!>kS4Wr_w3A,VD,.*mT|WNp3&#IYd5%hyqF8H');
define('LOGGED_IN_KEY',    'Ouo Mf-^&~slX| Y:R3/v `bI@rqd+3L;F`8-[{6(B_}AOw+9x|wPv7h|7TbN5A$');
define('NONCE_KEY',        '2I7A$t|XP@`Vw-h>uI+<PVJAd++W+pFb1(@dPst>LN1gKYO<(^^gW9Z2Vx+JbC!w');
define('AUTH_SALT',        'X),I)3r?qUhaz&(<l*(/ok1u(w0ON@_d8ON4)wd;Y6+/+1n_]@1z^I5Ug*S!-2Lz');
define('SECURE_AUTH_SALT', 'n?d:gf _X4Mzt`r5!4dME]Co;%gcJ5C?B33s(]5p-=oY&o`2&fqnUe)*7g<gr5>o');
define('LOGGED_IN_SALT',   '62=8Z!CYT~AddA35g%J(?f&1ED%{ZhbnY+QO]^Mu:<Xb8$a5hkV~FYcoxZCSzA+|');
define('NONCE_SALT',       'lP2Bmr/!<c.mU_wr:H0Y{[3Bv1(qQN+ S+D m oghU =;<+I|CXqHU~wt3(.M1N');
+
/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/var/www/html/motpresse.com' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
