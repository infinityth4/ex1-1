#!/usr/bin/perl -I./lib
use strict;
use warnings;
use TemplateEngine;

my $template = TemplateEngine->new( file => 'templates/main.html' );
print $template->render({
  title   => 'タイトル',
  content => 'これはコンテンツです',
}); 
