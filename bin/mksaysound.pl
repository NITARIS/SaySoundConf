#! /usr/bin/perl -w

use strict;
use utf8;
use Text::CSV_XS;

my $csv = Text::CSV_XS->new( { binary => 1 } );
open(my $fh, "-") or die $!;
binmode($fh, ":encoding(utf8)");

while(my $row = $csv->getline($fh)) {
  my $keyword = shift @$row;
  my $comment = shift @$row;
  $comment = " // " . $comment if(length($comment) > 0);
  print << "EOF";
	"$keyword"$comment
	{
EOF

  for(my $counter = 0; $counter++ <= $#$row;) {
    printf("\t\t\"file%s\" \"%s\"\n", $counter == 1 ? "" : $counter, $$row[$counter - 1]);
  }

  print "\t\t\"count\" \"" . ($#$row + 1) . "\"\n" if $#$row > 0;

  print << "EOF";
	}
EOF
}
