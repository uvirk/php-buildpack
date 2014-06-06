Sample wordpress app running on CF.

- Wordpress is installed with composer (see package.sh script)
- Use postgres for the DB.
- files/ has the source to use postgres for the DB.
- files/ get moved into wp to avoid being deleted when installing wordpress.
- DO NOT change files in wp because they will be removed!
