package TemplateEngine;
use strict;
use warnings;

use File::Basename;


sub new{
	my ($class,%location)=@_;
	bless{%location},$class;
}


sub render(%){
	my ($location,$var)=@_;
	my (%location)=%{$location};
	my $filename = basename($location{file});
	my $dirname = dirname $location{file};
	
	my $new=$dirname."/temp.html";
	my (%var)=%{$var};
	
	open( OLD, "< $location{file}" )|| die "ファイルを開けません :$!\n";
	open( NEW, "> $new" );
	while ( <OLD> ) {
		
		$_=~s/{% title %}/$var{title}/;
		$_=~s/{% content %}/$var{content}/;
		print NEW $_;
		
	}
	

	close( OLD );
	close( NEW );

	open( NEW, "< $new" );
	while ( <NEW> ) {
		print $_;
	}
	
	unlink $new;
	return ;
}

1;
