#! /usr/bin/perl -w

use strict;
use utf8;

while(<>) {
  my $keyword;
  my $comment = "";
  my $files = "";
  my $counter = 0;

  chomp;

  # キーワード抽出
  /^.*\"(.*)\"/;
  $keyword = $1;

  # コメント抽出
  $comment = $1 if m"// *(.*)$";

  # "{" 行をスキップ
  <>;

  # ファイル名を取り出すループ
  while(<>) {
    chomp;

    # "}" で終了
    last if(/}/);

    /^.*\"(\D*)\d*\".*\"(.*)\"/;
    $files .= ',"' . $2 . '"' if($1 eq "file");
  }

  print "\"$keyword\",\"$comment\"$files\n";
}
