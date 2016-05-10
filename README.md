# Panama Papers
Tools and data for the Panama Papers. From CSV into MySQL.

## Data
Just [the data](https://cloudfront-files-1.publicintegrity.org/offshoreleaks/data-csv.zip) with the following issues fixed (i.e. faulty characters removed):
- In the "Addresses.csv" there are about a dozen backslashes (`\`). One of them (somewhere around line 31360) escapes the closing quote. Most of them probably originate in faulty OCR, most of them didn't add any meaning / information - but as they are very few, they could be investigated by hand.
- One address in the same file contains a big block of XML, probably HTML (around line 146027).
- In "Officers.csv" there are three backslashes, one of them escapes a comma (around line 316870).

*Sorry for the estimates on line numbers, but the numbers reported by MySQL differ from the command line results*

## Import into MySQL
The table structure is without links and with some guesswork, see comments in scripts.

## SQL dumps
A good old dump of the entire MySQL database. Might be compliant with other SQL-dialects.
