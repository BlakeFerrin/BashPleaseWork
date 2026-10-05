NR>1 && substr($4, length($4)-3)>1699 && substr($4, length($4)-3)<1800 {print $0 > "presidentData/" month "/presidents1700.txt"; count17++} END {print "\tThere are ", count17, " records from President1700.txt file"}
NR>1 && substr($4, length($4)-3)>1799 && substr($4, length($4)-3)<1900 {print $0 > "presidentData/" month "/presidents1800.txt"; count18++} END {print "\tThere are ", count18, " records from President1800.txt file"}
NR>1 && substr($4, length($4)-3)>1899 && substr($4, length($4)-3)<2000 {print $0 > "presidentData/" month "/presidents1900.txt"; count19++} END {print "\tThere are ", count19, " records from President1900.txt file"}
NR>1 && substr($4, length($4)-3)>1999 && substr($4, length($4)-3)<2100 {print $0 > "presidentData/" month "/presidents2000.txt"; count20++} END {print "\tThere are ", count20, " records from President2000.txt file"}

