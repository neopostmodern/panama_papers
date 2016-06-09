# Panama Papers
Tools and data for the Panama Papers. From CSV into MySQL.

## Data
Just [the data](https://cloudfront-files-1.publicintegrity.org/offshoreleaks/data-csv.zip) with the some issues fixed (i.e. faulty characters removed).
See `data-cleaning.sh` for details.

(Most of the backslashes probably originate in faulty OCR, most of them didn't add any meaning / information - but as they are very few, they could be investigated by hand.)

## Import into MySQL
The table structure is without links and with some guesswork, see comments in scripts.

## SQL dumps
A good old dump of the entire MySQL database. Might be compliant with other SQL-dialects.

Generated with:

    mysqldump -p -u [username] --add-drop-table panama_leaks > panama_leaks.sql

To restore use:

    mysql -p -u [username] panama_leaks < sql_dumps/panama_leaks.sql
