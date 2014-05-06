#!/usr/bin/env perl
use v5.14;

my %props;

{
    my $url = "http://www.wikidata.org/w/index.php?title=MediaWiki:Gadget-AuthorityControl.js&action=raw";
    open my $fh, "curl -s '$url' |";
    while (<$fh>) {
        next unless $_ =~ qr{^\s+([0-9]+):\s+'([^']+)',\s+//\s+(.+)};
        my ($id,$url,$name) = ($1,$2,$3); 
        $url =~ s/\$1/{ID}/g;
        $props{id} = { name => $name, url => $url };
    }
}
