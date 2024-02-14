#!/bin/bash

# Choose the file and table names here
csvFile="your_csv_file.csv"
sqlFile="your_sql_file.sql"
tableName="yourtable"

# Use awk to handle the conversion, considering MySQL's quoting requirements
awk -v table="$tableName" 'BEGIN {
    FS=",";
    print "START TRANSACTION;";
}
NR == 1 {
    for (i = 1; i <= NF; i++) {
        # Replace spaces with underscores and enclose column names in backticks
        gsub(/ /, "_", $i);
        col[i] = "`" $i "`";
    }
    next;
}
{
    printf "INSERT INTO `%s` (", table;
    for (i = 1; i <= NF; i++) {
        printf "%s%s", col[i], (i<NF ? ", " : "");
    }
    printf ") VALUES (";
    for (i = 1; i <= NF; i++) {
        # Properly escape single quotes in values and enclose values in single quotes
        gsub(/'\''/, "'\'''\''", $i);
        printf "'\''%s'\''%s", $i, (i<NF ? ", " : "");
    }
    print ");";
}
END {
    print "COMMIT;";
}' $csvFile > $sqlFile

echo "Conversion completed: $sqlFile"
