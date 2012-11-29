#!/usr/bin/env perl

$command = "/var/www/cacti/scripts/check_http -H $ARGV[0] -f follow -t 60";
if ($ARGV[1]) {
  $command .= " -u $ARGV[1]";
}
$response = `$command`;

chomp $response;
#($load) = ($response =~ /NOW: Mean:(\d+\|\d)/);
($load) = ($response =~ /time=(\d+\.\d+|\d+\.|\.\d+|\d+)/);
#print "$response\n";
print "$load\n";
