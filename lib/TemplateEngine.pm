package TemplateEngine;
use strict;
use warnings;

use File::Basename;


sub new{
	#main.plから、templates/main.htmlを受け取り,ファイルを指定する。書き換えは、renderで。
	my ($class,%location)=@_;
	
	#下の２行をblessの下に書くと、Can't call method "test01" without a package or object reference at pm06_main.pl line 9.
	#print "class name:$_[0] .\n";
	#print "TemplateEngine::new location:$location{file}\n";

	bless{%location},$class;
	
	
}


sub render(%){
	##arguments
	my ($location,$var)=@_;#my($var)=@_で$var2{title}を$var{file}にすると、locationと表示される。
	
	#print "\$location :",%{$location},"\n";#?
	my (%location)=%{$location};
	#print "\$location{file}:$location{file}\n";#ファイルの場所
	#my $old=$location{file};#書き換えるディレクトリ・ファイルの名前
	
	#ファイル名のみ取得（use File::Basename;）

	my $filename = basename($location{file});	# $name = 'test.txt'
	#print "\$newfilename:$name\n";

	#my @extlist = ('.html');
	#my $filename = basename($location{file}, @extlist);#拡張子なしのファイル名
	#print "\$filename:$filename\n";
	my $dirname = dirname $location{file};#$dirname=./object
	
	my $new=$dirname."/output.html";#新しいファイルの名前
	
	
	##convert
	my (%var)=%{$var};
	#print "\$var{title}:$var{title}\n";
	#print "\$var{content}:$var{content}\n";
	
	open( OLD, "< $location{file}" )|| die "ファイルを開けません :$!\n";
	open( NEW, "> $new" );
	while ( <OLD> ) {
		
		#chomp($_);#改行文字を削除
		$_=~s/{% title %}/$var{title}/;
		$_=~s/{% content %}/$var{content}/;
		print NEW $_;
		
	}
	

	close( OLD );
	close( NEW );
	$filename=$dirname."/".$filename;
	#rename( $new, "$new.html" );#前半のファイル名を後半のファイル名に変える。
	#rename( $new, $filename );#前半のファイル名を後半のファイル名に変える。
	
	open( NEW, "< $location{file}" );
	while ( <NEW> ) {
		print $_;
	}
	
}

1;#???.pm did not return a true value at ???.plがでないために。

