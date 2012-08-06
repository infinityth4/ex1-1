#!/usr/bin/perl -I./lib
use strict;
use warnings;
use TemplateEngine;

my $template = TemplateEngine->new( file => 'templates/main.html' );#->はnewメソッドの呼び出し。=>は、ハッシュ（初めてのPerl,p121）（キーと値を結びつける）

print $template->render({
  title   => 'タイトル',
  content => 'これはコンテンツです',
}); 
