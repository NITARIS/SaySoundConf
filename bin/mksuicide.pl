#! /usr/bin/perl -w

use strict;

my $counter = 0;

print << "EOF";
        "suicidesound" // 自殺でランダムに流れる
        {
EOF

while(<>) {
  chomp;
  printf("\t\t\"file%s\"    \"%s\"\n", ++$counter == 1 ? "" : $counter, $_);
}

print << "EOF";
		"count" "$counter" // ランダムで鳴らす数
		"actiononly"    "$counter"
		"action" "kill"
		"param" "suicide"
	}
EOF
