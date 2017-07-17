# modify.awk
BEGIN { FS = ","; OFS = "," }
#1 Expect the first record to have the starting balance.
NR == 1 { print $0,"FLIGHTDATE"
          next     # get next record and start over
}
#2 Apply to each check record, adding amount from balance.
NR > 1 { printf("%s,%4d-%2.2i-%2.2i\n", $0, $1, $2, $3)
}
