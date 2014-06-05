<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

define('WP_HOME', 'http://' . getenv('HTTP_HOST'));
define('WP_SITEURL','http://' . getenv('HTTP_HOST'));

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'buildpacks');

/** MySQL database password */
define('DB_PASSWORD', 'buildpacks');

/** MySQL hostname */
define('DB_HOST', '10.244.0.30:5524');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'yJKI[0j? c3{ik23R9{:*5/^D,phA(c)1WO:^u@0z+e=yZC>gj&9B_t=9TUcvUh,');
define('SECURE_AUTH_KEY',  'Tv&@H0H/mRl-+m|bzyLhQB& ow%G+}~|9oiP@B&orF]v-<O|WObRVnWHXEkEoAJD');
define('LOGGED_IN_KEY',    '.NeW?b0~(B>?eck~*PvuY4*G+QmeQp=u>tG*D@9tCb<J@rk,Ro/JRb Db@ha*AB5');
define('NONCE_KEY',        '-s~<9Ia/J7r(+r6U#@Q+w|)b:0&^xB%f aH)(,r_E]uXEp]Agu^f#b5wOMY%JI6j');
define('AUTH_SALT',        'V|;88{K[0[,uiIWy8Rf|Cs-wsh7a%9&anBV|#M5Z^&ej]zqz<WkgrmftTDy?QzqT');
define('SECURE_AUTH_SALT', '`<g(?Dx3.B6O7 <1]RF{jjp.s#LpqcC~/0WP~;,EabF)[-f#lD8Tic,%2[A{H lP');
define('LOGGED_IN_SALT',   'L,#q?=TRB+?:;_3?5L-Nql99xMKU-In1nYX;D`j1dDQG1}[WW3]iA+C?iJP|_YaR');
define('NONCE_SALT',       'DNL5=AQc8k-/&aY3lwzZFEYF[)u=-}=|I{i%[cfz%Ns[zapsmWUN%PF8r8t:YR0;');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');


